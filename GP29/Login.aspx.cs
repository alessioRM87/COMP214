using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Login : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUser.Text.Trim();
        string password = txtPassword.Text;

        login(username, password);
    }

    private void login(string username, string password)
    {
        OracleConnection conn;
        //SqlConnection conn;
        //SqlCommand comm;
        OracleCommand comm;
        OracleDataReader reader;
        //SqlDataReader reader;
        // Read the connection string from Web.config
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
        // Initialize connection
        conn = new OracleConnection(connectionString);
        // Create command
        comm = new OracleCommand(
          "SELECT * FROM EMPLOYEE where USERNAME= :UN and PASSWORD= :PW",
          conn);
        comm.Parameters.Add("UN", username);
        comm.Parameters.Add("PW", password);
        // Enclose database code in Try-Catch-Finally
        try
        {
            // Open the connection
            conn.Open();
            // Execute the command
            reader = comm.ExecuteReader();

            if(reader != null && reader.HasRows)
            {
                reader.Read();
                //showMessage(reader[0].ToString() + " " + reader[1].ToString());
                showMessage(string.Format("Name: {0} {1}", reader["FIRSTNAME"], reader["LASTNAME"]));
            }
            else
            {
                showMessage("Invalid username/password.");
            }

            reader.Close();
        }
        finally
        {
            // Close the connection
            conn.Close();
        }
    }

    private void showMessage(string msg)
    {
        Response.Write("<script type='text/javascript'> alert('" + msg + "'); </script>");
    }
}
