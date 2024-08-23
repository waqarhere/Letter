using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using ZXing;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Data;

namespace letter_demo
{
    public partial class letter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                BindDropDown();
                
                foreach (ListItem item in YesNoRadioButtonList.Items)
                {
                    if (item.Value == "Yes")
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
            
            CommunicationID.ReadOnly = true;
            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string qry = @"select max(CommunicationID) from letters";
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    object result = cmd.ExecuteScalar();
                    if (result != DBNull.Value)
                    {
                        int cid = Convert.ToInt32(result) + 1;
                        CommunicationID.Text = cid.ToString();
                    }
                    else
                    {
                        CommunicationID.Text = "1";
                    }
                }
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            GenerateCode(CommunicationID.Text, Subject.Text, SaveDate.Value);
        }

        private void GenerateCode(string name, string Subject, string date)
        {
            var writer = new BarcodeWriter
            {
                Format = BarcodeFormat.QR_CODE
            };
            var result = writer.Write($" Ref-ID: {name}\n Subject: {Subject}\n Date: {date}\n Remarks: Verified");
            string fileName = $"{name}.jpg";
            string path = Server.MapPath($"~/images/{fileName}");

            using (var barcodeBitmap = new Bitmap(result))
            {
                barcodeBitmap.Save(path, ImageFormat.Jpeg);
            }

            imagesQRCode.Visible = true;
            imagesQRCode.ImageUrl = $"~/images/{fileName}";
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                string userID = Session["UserID"] as string;
                if (string.IsNullOrEmpty(userID))
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

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
                documentUpload.SaveAs(savePath);
                
                string fileUrl = Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + (HttpContext.Current.Request.ApplicationPath.EndsWith("/") ? "" : "/") + "doc/" + fileName;

                string formattedDate = SaveDate.Value;

                string query = @"INSERT INTO letters (UserID, SaveDate, Name, Designation, Organization, Subject, Response, Dear, Description, City, DeptRef, QRCodePath, ConcernedFile, cc, title, FilePath, [type]) 
                         VALUES (@UserID, @SaveDate, @Name, @Designation, @Organization, @Subject, @Response, @Dear, @Description, @City, @DeptRef, @QRCodePath, @ConcernedFile, @cc, @title, @FilePath, @type)";

                string QRCodePath = $"~/images/{CommunicationID.Text}.jpg";

                string selectedType = type.SelectedValue;

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter("@UserID", userID),
                    new SqlParameter("@SaveDate", DateTime.Now),
                    new SqlParameter("@Name", Name.Value),
                    new SqlParameter("@Designation", Designation.Text),
                    new SqlParameter("@Organization", Organization.Text),
                    new SqlParameter("@Subject", Subject.Text),
                    new SqlParameter("@Response", DropDownList1.Text),
                    new SqlParameter("@ConcernedFile", DropDownList2.Text),
                    new SqlParameter("@title", DropDownList3.Text),
                    new SqlParameter("@Dear", Dear.Value),
                    new SqlParameter("@Description", BodyText.Value),
                    new SqlParameter("@City", City.Text),
                    new SqlParameter("@cc", Textarea1.Text),
                    new SqlParameter("@DeptRef", DeptRef.Text),
                    new SqlParameter("@QRCodePath", QRCodePath),
                    new SqlParameter("@FilePath", fileUrl),
                    new SqlParameter("@type", selectedType)
                };

                string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddRange(parameters.ToArray());
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void Old_Click(object sender, EventArgs e)
        {
            Response.Redirect("Steps.aspx");
        }


        //======= TO FETCH LIST FROM DB TO DROPDOWN ========
        // Method to fetch data from the database and bind it to the dropdown list
        private void BindDropDown()
        {
            string cs = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT MailID, ConcernedDept, Subject FROM Mail WHERE Type = 'Reply to be given' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                DataTable dt = ds.Tables[0];

                if (!dt.Columns.Contains("DisplayField"))
                {
                    dt.Columns.Add("DisplayField", typeof(string), "Convert(ConcernedDept, 'System.String') + ' - ' + Subject");
                }

                type.DataTextField = "DisplayField";
                type.DataValueField = "MailID";
                type.DataSource = dt;
                type.DataBind();

                if (dt.Rows.Count > 0)
                {
                    type.SelectedIndex = 0;
                    UpdateTextFields(dt.Rows[0]);
                }
            }
        }

        // Method to update the text fields based on the selected item in the dropdown
        private void UpdateTextFields(DataRow row)
        {
            DeptRef.Text = row["ConcernedDept"].ToString();
            Subject.Text = row["Subject"].ToString();
        }

        // Event handler for selected index change in the dropdown list
        protected void txtsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedMailID = type.SelectedValue;
            string cs = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT ConcernedDept, Subject FROM letters WHERE MailID = @MailID", con);
                cmd.Parameters.AddWithValue("@MailID", selectedMailID);

                try
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            DeptRef.Text = reader["ConcernedDept"].ToString();
                            Subject.Text = reader["Subject"].ToString();
                        }
                        else
                        {
                            DeptRef.Text = "No data found";
                            Subject.Text = "No data found";
                        }
                    }
                }
                catch (SqlException ex)
                {
                    DeptRef.Text = "Error loading data";
                    Subject.Text = "";
                }
            }
        }



    }
}
