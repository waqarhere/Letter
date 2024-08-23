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
    public partial class useroldletters : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("SELECT l.Name, l.SaveDate, l.Subject, l.Response FROM letters l WHERE l.UserID = @UserID", con);
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

        protected void NewLetterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("letter.aspx");
        }

        protected void uploadletters_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadOldletters.aspx");
        }
    }
}