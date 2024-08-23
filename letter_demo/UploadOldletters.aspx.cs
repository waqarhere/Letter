using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace letter_demo
{
    public partial class UploadOldletters : System.Web.UI.Page
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

                // Change the directory path to point to the "doc" folder
                string directoryPath = Server.MapPath("~/doc/");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string fileName = Guid.NewGuid().ToString() + fileExtension; // Unique file name
                string savePath = Path.Combine(directoryPath, fileName);
                documentUpload.SaveAs(savePath);

                // Convert the save path to a URL, ensuring it points to the "doc" folder
                string fileUrl = Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + (HttpContext.Current.Request.ApplicationPath.EndsWith("/") ? "" : "/") + "doc/" + fileName;

                string query = @"INSERT INTO UploadedDocuments (SaveDate, UserName, designation, organization, subject, DocumentPath, UserID)
                 VALUES (@SaveDate, @UserName, @designation, @organization, @subject, @DocumentPath, @UserID);";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@SaveDate", DateTime.Now), // Assuming you're saving the current date
                    new SqlParameter("@UserName", UserName.Text),
                    new SqlParameter("@designation", designation.Text),
                    new SqlParameter("@organization", organization.Text),
                    new SqlParameter("@subject", subject.Text),
                    new SqlParameter("@DocumentPath", fileUrl), // Save the URL instead of the local path
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
            Response.Redirect("adminuploadletterdetails.aspx");
        }
    }

}