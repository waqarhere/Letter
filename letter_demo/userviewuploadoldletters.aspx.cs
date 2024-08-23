using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace letter_demo
{
    public partial class viewuploadoldletters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }

        private void BindGridView()
        {
            try
            {
                // Check if CommunicationID is stored in the Session after user logs in
                if (Session["UserID"] == null)
                {
                    // User is not logged in or session expired, redirect to login page
                    Response.Redirect("Login.aspx");
                }

                // Retrieve CommunicationID from the Session
                int communicationId = Convert.ToInt32(Session["UserID"]);

                string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

                // Establish database connection
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Create SQL command to fetch data based on CommunicationID
                    SqlCommand cmd = new SqlCommand("SELECT l.UserName, l.SaveDate, l.Designation, l.Organization, l.Subject FROM UploadedDocuments l WHERE l.UserID = @UserID", con);
                    cmd.Parameters.AddWithValue("@UserID", communicationId);

                    // Execute SQL command and fetch data
                    SqlDataAdapter adap = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adap.Fill(ds);

                    // Bind data to GridView if records are found
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }
                    else
                    {
                        // No records found, clear GridView
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception or show user-friendly error message
                // Redirect to an error page if needed
                //Response.Redirect("ErrorPage.aspx?message=" + Server.UrlEncode(ex.Message));
                Response.Write("An error occurred: " + ex.Message);
            }

        }

        private void ApplySearch()
        {
            string keyword = SearchBox.Text.Trim();
            if (!string.IsNullOrEmpty(keyword))
            {
                DataView dv = new DataView(GetDataSource()); // Ensure GetDataSource is implemented properly.

                // Attempt to parse the keyword as a date.
                if (DateTime.TryParse(keyword, out DateTime parsedDate))
                {
                    // If the keyword is a valid date, filter by the SaveDate column.
                    dv.RowFilter = $"Convert(SaveDate, 'System.String') LIKE '%{parsedDate:MM/dd/yyyy}%'"; // Adjust date format as necessary
                }
                else
                {
                    // For non-date keywords, exclude the SaveDate from the filter to avoid exceptions.
                    dv.RowFilter = $"UserName LIKE '%{keyword}%' OR Designation LIKE '%{keyword}%' OR Organization LIKE '%{keyword}%' OR Subject LIKE '%{keyword}%'";
                }

                GridView1.DataSource = dv;
                GridView1.DataBind();
            }
            else
            {
                // If search keyword is empty, bind the GridView with the original data.
                BindGridView();
            }
        }

        private DataTable GetDataSource()
        {
            DataTable dt = new DataTable();
            try
            {
                // Assuming Session["UserID"] contains the user ID.
                int communicationId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-DOETT97;Initial Catalog=transaction;Integrated Security=True;"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT UserName, SaveDate, Designation, Organization, Subject FROM UploadedDocuments WHERE UserID = @UserID", con);
                    cmd.Parameters.AddWithValue("@UserID", communicationId);

                    SqlDataAdapter adap = new SqlDataAdapter(cmd);
                    adap.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions or log errors as appropriate for your application
                // For example: Response.Write("An error occurred: " + ex.Message);
            }
            return dt;
        }

        protected void NewLetterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadOldletters.aspx");
        }

        protected void SearchButton_Click1(object sender, EventArgs e)
        {
            ApplySearch();
        }

        protected void SearchDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            ApplySearch();
        }
    }
}