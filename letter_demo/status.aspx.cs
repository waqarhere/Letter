using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace letter_demo
{
    public partial class status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userID = Session["UserID"] as string;

            if (string.IsNullOrEmpty(userID))
            {
                Response.Redirect("Login.aspx");
                return;
            }
            databindset();
        }

        protected void onhandsubmit_Click(object sender, EventArgs e)
        {
            string userID = Session["UserID"] as string;

            if (string.IsNullOrEmpty(userID))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                if (fileExtension != ".pdf")
                {
                    Response.Write("Please select .pdf format file.");
                    return;
                }

                // Change the directory path to point to the "doc" folder
                string directoryPath = Server.MapPath("~/doc/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string fileName = Guid.NewGuid().ToString() + fileExtension;
                string savePath = Path.Combine(directoryPath, fileName);
                FileUpload1.SaveAs(savePath);

                // Convert the save path to a URL, ensuring it points to the "doc" folder
                string fileUrl = Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + (HttpContext.Current.Request.ApplicationPath.EndsWith("/") ? "" : "/") + "doc/" + fileName;

                string query = @"INSERT INTO Documents (Department, SenderName, SaveDate, ReceiverName, ReceiverDepartment, FilePath, UserID)
                 VALUES (@Department, @SenderName, @SaveDate, @ReceiverName, @ReceiverDepartment, @FilePath, @UserID);";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@SaveDate", SaveDate.Value),
                    new SqlParameter("@Department", department.Value),
                    new SqlParameter("@SenderName", senderName.Value),
                    new SqlParameter("@ReceiverName", recName.Text),
                    new SqlParameter("@ReceiverDepartment", recdept.Text),
                    new SqlParameter("@FilePath", fileUrl), // Save the URL instead of the local path
                    new SqlParameter("@UserID", userID)
                };

                new CommonLogics().addRecord(query, parameters);
            }
            else
            {
                Response.Write("Please select .pdf format file.");
            }
        }
        
        protected void upload_Click(object sender, EventArgs e)
        {
            string userID = Session["UserID"] as string;

            if (string.IsNullOrEmpty(userID))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (documentUpload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(documentUpload.FileName).ToLower();
                if (fileExtension != ".pdf")
                {
                    Response.Write("Please select .pdf format file.");
                    return;
                }
                
                string directoryPath = Server.MapPath("~/doc/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string fileName = Guid.NewGuid().ToString() + fileExtension;
                string savePath = Path.Combine(directoryPath, fileName);
                FileUpload1.SaveAs(savePath);
                
                string fileUrl = Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + (HttpContext.Current.Request.ApplicationPath.EndsWith("/") ? "" : "/") + "doc/" + fileName;

                string query = @"INSERT INTO delivery (Department, SenderName, Date1, type, recnum, documentUpload, UserID)
                 VALUES (@Department, @SenderName, @Date1, @type, @recnum, @documentUpload, @UserID);";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@Date1", Date1.Value),
                    new SqlParameter("@Department", department.Value),
                    new SqlParameter("@SenderName", senderName.Value),
                    new SqlParameter("@type", type.Text),
                    new SqlParameter("@recnum", recnum.Text),
                    new SqlParameter("@documentUpload", fileUrl),
                    new SqlParameter("@UserID", userID)
                };

                new CommonLogics().addRecord(query, parameters);
            }
            else
            {
                Response.Write("Please select .pdf format file.");
            }
        }
        
        protected void view_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewrepliedstatus.aspx");
        }    

        //++++++++ dropdown method ++++++++++
        private void databindset()
        {
            string cs = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("select CommunicationID, Subject from letters where response = 're:'", con);  // Ensure these columns exist.
                DataSet ds = new DataSet();
                da.Fill(ds);

                DataTable dt = ds.Tables[0];

                if (!dt.Columns.Contains("DisplayField"))
                {
                    dt.Columns.Add("DisplayField", typeof(string), "Convert(CommunicationID, 'System.String') + ' - ' + Subject");
                }

                txtsubject.DataTextField = "DisplayField";
                txtsubject.DataValueField = "CommunicationID";
                txtsubject.DataSource = ds.Tables[0];
                txtsubject.DataBind();
            }
        }

        protected void onhandview_Click1(object sender, EventArgs e)
        {
            Response.Redirect("viewrepliedstatus.aspx");
        }
    }
}