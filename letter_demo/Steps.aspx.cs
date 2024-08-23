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
    public partial class Steps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //for old letters
            int oldlettersCount = foroldletters();
            string message = $"{oldlettersCount} - Letters";
            oldLettersCountLabel.Text = message;

            //for new letters
            int newlettersCount = fornewletters();
            string newmessage = $"{newlettersCount} - Letters";
            Label1.Text = newmessage;

            //for mails 
            int mailCount = formails();
            string mailmessage = $"{mailCount} - Mails";
            Label2.Text = mailmessage;

            //for pending mails
            int pendingletterscount = pendingreplies();
            string repliesmessage = $"{pendingletterscount} - Letters";
            Label3.Text = repliesmessage;

            //for replieds
            int replies = replied();
            string replymessage = $"{replies} - Letters";
            Label4.Text = replymessage;



            BindGridView();
        }
        
        private int foroldletters()
        {
            int count = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM UploadedDocuments";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                count = (int)command.ExecuteScalar();
            }

            return count;
        }

        private int fornewletters()
        {
            int count = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM letters";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                count = (int)command.ExecuteScalar();
            }

            return count;
        }

        private int formails()
        {
            int count = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Mail where Subject <> 'Choose Option'  ";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                count = (int)command.ExecuteScalar();
            }

            return count;
        }


        private int pendingreplies()
        {
            int count = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Mail where Type = 'Reply to be given' AND Subject <> 'Choose Option' ";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                count = (int)command.ExecuteScalar();
            }

            return count;
        }


        private int replied()
        {
            int count = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM letters WHERE Response = 'Re: ' AND type <> 12; ";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                count = (int)command.ExecuteScalar();
            }

            return count;
        }

        string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
        
        private void BindGridView()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select l.date, l.Name,l.Subject,l.type,l.DocumentUpload from Mail l where subject <> 'Choose Option' ", con);
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adap.Fill(ds);
                con.Close();

                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        protected void NewLetterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("letter.aspx");
        }

        protected void AddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void Seeoldletter_Click(object sender, EventArgs e)
        {
            Response.Redirect("oldletters.aspx");
        }

        protected void uploadletters_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadOldletters.aspx");
        }

        protected void loadreport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Fetch_Crystal.aspx");
        }
    }
}