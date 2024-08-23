using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace letter_demo
{
    public partial class adminuploadletterdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
        
        private void BindGridView()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT UserName, SaveDate, Designation, Organization, Subject, DocumentPath FROM UploadedDocuments", con);
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adap.Fill(ds);
                con.Close();

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
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

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            ApplySearch();
        }

        protected void SearchDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            ApplySearch();
        }

        private void ApplySearch()
        {
            string keyword = SearchBox.Text.Trim();
            string searchField = SearchDropDown.SelectedValue;
            if (!string.IsNullOrEmpty(keyword))
            {
                // Filter the GridView data based on the search keyword and selected field
                DataView dv = new DataView(GetDataSource());
                dv.RowFilter = $"{searchField} LIKE '%{keyword}%'";
                GridView1.DataSource = dv;
                GridView1.DataBind();
            }
            else
            {
                BindGridView();
            }
        }

        private DataTable GetDataSource()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT UserName, SaveDate, Designation, Organization, Subject, DocumentPath FROM UploadedDocuments", con);
            SqlDataAdapter adap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            return dt;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int documentPathIndex = GridView1.Columns.IndexOf(GridView1.Columns.Cast<DataControlField>()
                    .FirstOrDefault(col => col.HeaderText.Equals("DocumentPath")));

                if (documentPathIndex >= 0)
                {
                    string documentPath = e.Row.Cells[documentPathIndex].Text;
                    
                    HyperLink link = new HyperLink();
                    link.NavigateUrl = documentPath;
                    link.Target = "_blank";
                    link.Text = "Open Document";
                    
                    e.Row.Cells[documentPathIndex].Controls.Clear();
                    e.Row.Cells[documentPathIndex].Controls.Add(link);
                }
            }
        }

        protected void btnOpenPDF_Click(object sender, EventArgs e)
        {
            // Get the ID of the clicked row
            Button btnOpenPDF = (Button)sender;
            //int id = Convert.ToInt32(btnOpenPDF.CommandArgument);
            string pdfFilePath = btnOpenPDF.CommandArgument;

            if (!string.IsNullOrEmpty(pdfFilePath))
            {
                // Open the PDF file in a new tab/window
                Response.Redirect(pdfFilePath);
            }
            else
            {
                // Handle error or show a message that PDF file path is not available
                // You can also use JavaScript to show an alert message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('PDF file path not found.');", true);
            }
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            SearchBox.Text = "";

            BindGridView();
        }
    }
}
