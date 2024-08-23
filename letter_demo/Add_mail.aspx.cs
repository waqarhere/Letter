using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace letter_demo
{
    public partial class Add_mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userID = Session["UserID"] as string;

            if (string.IsNullOrEmpty(userID))
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void Old_Click(object sender, EventArgs e)
        {
            Response.Redirect("Steps.aspx");
        }
        protected void ShowReport_Click(object sender, EventArgs e)
        {
            string userID = Session["UserID"] as string;

            if (string.IsNullOrEmpty(userID))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (documentUpload.HasFile)
            {
                string fileExtension = Path.GetExtension(documentUpload.FileName).ToLower();
                if (fileExtension != ".pdf")
                {
                    Response.Write("<script>alert('Please select a .pdf format file.');</script>");
                    return; // Stop further processing
                }

                string directoryPath = Server.MapPath("~/doc/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string fileName = Guid.NewGuid().ToString() + fileExtension;
                string savePath = Path.Combine(directoryPath, fileName);
                documentUpload.SaveAs(savePath);

                string fileUrl = Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + (HttpContext.Current.Request.ApplicationPath.EndsWith("/") ? "" : "/") + "doc/" + fileName;

                string query = @"INSERT INTO Mail (UserID, Date, ConcernedFile, ConcernedDept, Name, Subject, Type, DocumentUpload) 
                         VALUES (@UserID, @Date, @ConcernedFile, @ConcernedDept, @Name, @Subject, @Type, @DocumentUpload)";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@UserID", userID),
                    new SqlParameter("@Date", Date.Value), // Assuming the date of submission is now
                    new SqlParameter("@ConcernedFile", concernedfile.Text),
                    new SqlParameter("@ConcernedDept", concerneddept.Text),
                    new SqlParameter("@Name", Name.Value),
                    new SqlParameter("@Subject", subject.Text),
                    new SqlParameter("@Type", type.Text),
                    new SqlParameter("@DocumentUpload", fileUrl) // corrected to pass URL
                };

                new CommonLogics().addRecord(query, parameters);
            }
            else
            {
                Response.Write("<script>alert('Please select a file to upload.');</script>");
            }
        }

    }
}
