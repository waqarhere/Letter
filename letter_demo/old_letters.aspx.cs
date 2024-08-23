using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;
using System.Drawing.Imaging;
using System.Data;

namespace letter_demo
{
    public partial class old_letters : System.Web.UI.Page
    {
        string connectionstring = @"Data Source=DESKTOP-DOETT97;Initial Catalog=transaction;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection sqlcon =  new SqlConnection(connectionstring))
            {
                sqlcon.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from letters", sqlcon);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                letters.DataSource = dtb1;
                letters.DataBind();
            }

        }

        private void ReadQRCode()
        {
            var reader = new BarcodeReader();
            string filename = Path.Combine(Request.MapPath("~/images"), "QRImage.jpg");

            var result = reader.Decode(new Bitmap(filename));
            if (result != null)
            {
                string studentId = result.Text;
                lblQRCode.Text = "QR Code: " + studentId;

                // Query the database to fetch student data using the read studentId
                string connectionString = "Data Source=DESKTOP-DOETT97;Initial Catalog=transaction;Integrated Security=True"; // Provide your connection string here
                string query = "SELECT * FROM Student WHERE id = @Id";

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@Id", studentId);
                            connection.Open();

                            using (SqlDataReader innerreader = command.ExecuteReader())
                            {
                                if (innerreader.Read())
                                {
                                    // Display fetched student data
                                    //lblStudentName.Text = "Name: " + innerreader["name"].ToString();
                                    //lblFatherName.Text = "Father's Name: " + innerreader["fathername"].ToString();
                                    //lblCell.Text = "Cell: " + innerreader["cell"].ToString();
                                    //lblEnrollmentDate.Text = "Enrollment Date: " + innerreader["enrollment_date"].ToString();
                                    //lblDegreeName.Text = "Degree Name: " + innerreader["degree_name"].ToString();
                                }
                                else
                                {
                                    // No student found with the given ID
                                    //lblStudentName.Text = "No student found with ID: " + studentId;
                                    //lblFatherName.Text = "";
                                    //lblCell.Text = "";
                                    //lblEnrollmentDate.Text = "";
                                    //lblDegreeName.Text = "";
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    //lblStudentName.Text = "Error: " + ex.Message;
                    //lblFatherName.Text = "";
                    //lblCell.Text = "";
                    //lblEnrollmentDate.Text = "";
                    //lblDegreeName.Text = "";
                }
            }
            else
            {
                lblQRCode.Text = "No QR code found.";
            }
        }

        protected void linkselect_Click(object sender, EventArgs e)
        {
            int CommunicationID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        }
    }
}