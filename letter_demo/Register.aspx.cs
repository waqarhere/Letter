using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace letter_demo
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string selectedType = type.SelectedValue;
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            string storedProcedureName = "spAddUser";

            // List of parameters as before, but adjusted for the stored procedure
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                    new SqlParameter("@Username", UserName.Text),
                    new SqlParameter("@Department", Dept.Text),
                    new SqlParameter("@Password", Password.Text),
                    new SqlParameter("@type", type.Text),
            };

            // Assuming addRecord method can determine context (stored procedure call in this case) based on input
            new CommonLogics().addRecord(storedProcedureName, parameters, isStoredProcedure: true);

            //UserName.Text = "";
            //Dept.Text = "";
            //Password.Text = "";
        }

        protected void NewLetterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Steps.aspx");
        }
    }
}