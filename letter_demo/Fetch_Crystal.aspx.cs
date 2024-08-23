using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace letter_demo.Report
{
    public partial class Fetch_Crystal : System.Web.UI.Page
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

        SqlConnection con = new SqlConnection();
        ReportDocument crystalreport = new ReportDocument();


        protected void ShowReport_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
            ReportDocument crystalReport = new ReportDocument();

            string userId = RefNo.Text.Trim();
            string reportFileName = userId + "_Report.pdf";
            string reportPath = Server.MapPath("~/Reports/" + reportFileName);

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string sql = "SELECT * FROM Letters WHERE CommunicationID = @UserID";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataSet1 ds = new DataSet1();
                    adp.Fill(ds, "Letter");

                    crystalReport.Load(Server.MapPath("~/Report/CrystalReport2.rpt"));
                    crystalReport.SetDataSource(ds);

                    crystalReport.ExportToDisk(ExportFormatType.PortableDocFormat, reportPath);
                    
                    string script = $"window.open('Reports/{reportFileName}', '_blank');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "openReport", script, true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
            }
            finally
            {
                crystalReport.Close();
                crystalReport.Dispose();
            }
        }
        
        protected void Old_Click(object sender, EventArgs e)
        {
            Response.Redirect("Steps.aspx");
        }
    }
}