using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace letter_demo
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDBConnection"].ToString());
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string user = UserName.Text;
                string password = Password.Text; // Ideally, this should be a hashed password

                con.Open();
                // Update your query to include the "type" column which stores the user's role
                string qry = "SELECT type,UserID FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@Username", user);
                cmd.Parameters.AddWithValue("@Password", password); // In a real scenario, this should be hashed

                SqlDataReader srd = cmd.ExecuteReader();
                if (srd.Read())
                {
                    string userType = srd["type"].ToString(); // Use the actual column name here, assumed as "type"
                    if (userType == "admin")
                    {
                        Session["UserID"] = srd["UserID"].ToString();
                        Response.Redirect("steps.aspx");
                    }
                    else if (userType == "user") // Ensure this matches the exact value in your DB
                    {
                        Session["UserID"] = srd["UserID"].ToString();
                        Response.Redirect("useroldletters.aspx");
                    }
                }
                else
                {
                    ResultLabel.Text = "Incorrect Username/Password";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }

        }

        protected void Submit_Click1(object sender, EventArgs e)
        {

        }
    }
}