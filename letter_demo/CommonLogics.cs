using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Xml.Linq;


namespace letter_demo
{
    public class CommonLogics
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

        public int addRecord(string query, List<SqlParameter> sqlParams)
        {

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (sqlParams != null)
                        {
                            command.Parameters.AddRange(sqlParams.ToArray());
                        }
                        
                        int rowsAffected = command.ExecuteNonQuery();
                        return rowsAffected;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return 0;
            }
        }

        public void addRecord(string commandText, List<SqlParameter> parameters, bool isStoredProcedure = false)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = isStoredProcedure ? CommandType.StoredProcedure : CommandType.Text;
                    foreach (var parameter in parameters)
                    {
                        command.Parameters.Add(parameter);
                    }
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}