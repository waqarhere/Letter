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
    public partial class viewrepliedstatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
            BindGridView1();
        }

        string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

        private void BindGridView()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select d.Date1,d.Department,d.SenderName,d.type,d.recnum,d.documentUpload from delivery d", con);
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

        private void BindGridView1()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select d.SaveDate,d.SenderName,d.Department,d.ReceiverName,d.ReceiverDepartment,d.FilePath from Documents d", con);
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adap.Fill(ds);
                con.Close();

                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView2.DataSource = ds.Tables[0];
                        GridView2.DataBind();
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
            Response.Redirect("Steps.aspx");
        }
    }
}