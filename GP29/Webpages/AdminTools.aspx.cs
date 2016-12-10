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
using System.Data.SqlClient;
using Oracle.ManagedDataAccess.Client;

public partial class AdminTools : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Read the employees list when initially loading the page
        if (!IsPostBack)
        {
            LoadEmployeesList();
        }
    }
    private void LoadEmployeesList()
    {
        Global.databaseManager.getEmployeesSummaries(
            (dataSet) =>
            {
                employeesList.DataSource = dataSet;
                employeesList.DataValueField = "EmployeeID";
                employeesList.DataTextField = "Firstname";
                employeesList.DataBind();

                // Disable the update button
                updateButton.Enabled = false;
                // Disable the delete button
                deleteButton.Enabled = false;
                // Clear any values in the TextBox controls
                txtFirstName.Text = "";
                txtLastName.Text = "";
                userNameTextBox.Text = "";
                addressTextBox.Text = "";
                cityTextBox.Text = "";
                stateTextBox.Text = "";
                zipTextBox.Text = "";
                homePhoneTextBox.Text = "";
                extensionTextBox.Text = "";
                mobilePhoneTextBox.Text = "";
            },
            () =>
            {
                LabelMessage.Text = "An error occured while trying to get list of employees! Reload page and try again!";
                employeesList.DataSource = new DataSet();
                employeesList.DataBind();

                // Disable the update button
                updateButton.Enabled = false;
                // Disable the delete button
                deleteButton.Enabled = false;
                // Clear any values in the TextBox controls
                txtFirstName.Text = "";
                txtLastName.Text = "";
                userNameTextBox.Text = "";
                addressTextBox.Text = "";
                cityTextBox.Text = "";
                stateTextBox.Text = "";
                zipTextBox.Text = "";
                homePhoneTextBox.Text = "";
                extensionTextBox.Text = "";
                mobilePhoneTextBox.Text = "";
            });
    }
    protected void selectButton_Click(object sender, EventArgs e)
    {
        // Declare objects
        OracleConnection conn;
        OracleCommand comm;
        OracleDataReader reader;
        // Read the connection string from Web.config
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
        // Initialize connection
        conn = new OracleConnection(connectionString);
        // Create command
        comm = new OracleCommand(
            "SELECT Name, Username, Address, City, State, Zip, " +
            "HomePhone, Extension, MobilePhone FROM Employees " +
            "WHERE EmployeeID = @EmployeeID", conn);
        // Add command parameters
        comm.Parameters.Add("@EmployeeID", System.Data.SqlDbType.Int);
        comm.Parameters["@EmployeeID"].Value =
            employeesList.SelectedItem.Value;
        // Enclose database code in Try-Catch-Finally
        try
        {
            // Open the connection
            conn.Open();
            // Execute the command
            reader = comm.ExecuteReader();
            // Display the data on the form
            if (reader.Read())
            {
                txtFirstName.Text = reader["FirstName"].ToString();
                txtLastName.Text = reader["Lastname"].ToString();
                userNameTextBox.Text = reader["Username"].ToString();
                addressTextBox.Text = reader["Address"].ToString();
                cityTextBox.Text = reader["City"].ToString();
                stateTextBox.Text = reader["State"].ToString();
                zipTextBox.Text = reader["Zip"].ToString();
                homePhoneTextBox.Text = reader["PHONENUMBER"].ToString();
                //extensionTextBox.Text = reader["Extension"].ToString();
                //mobilePhoneTextBox.Text = reader["MobilePhone"].ToString();
            }
            // Close the reader 
            reader.Close();
            // Enable the Update button
            updateButton.Enabled = true;
            // Enable the Delete button
            deleteButton.Enabled = true;
        }
        catch (Exception ex)
        {
            // Display error message
            dbErrorLabel.Text =
                "Error loading the employee details!<br />" + ex.Message;
        }
        finally
        {
            // Close the connection
            conn.Close();
        }
    }
    protected void updateButton_Click(object sender, EventArgs e)
    {
        LabelMessage.Text = "";

        Employee employee = new Employee();

        int employeeID = Int32.Parse(employeesList.SelectedItem.Value);
        Global.databaseManager.getEmployeeByID(employeeID,
            (dataSet) => {
                employee.firstName = dataSet.Tables[0].Rows[0]["FIRSTNAME"].ToString();
                employee.lastName = dataSet.Tables[0].Rows[0]["LASTNAME"].ToString();
                employee.username = dataSet.Tables[0].Rows[0]["USERNAME"].ToString();
                employee.password = dataSet.Tables[0].Rows[0]["PASSWORD"].ToString();
                employee.address = dataSet.Tables[0].Rows[0]["ADDRESS"].ToString();
                employee.city = dataSet.Tables[0].Rows[0]["CITY"].ToString();
                employee.state = dataSet.Tables[0].Rows[0]["STATE"].ToString();
                employee.zip = dataSet.Tables[0].Rows[0]["ZIP"].ToString();
                employee.phoneNumber = dataSet.Tables[0].Rows[0]["PHONENUMBER"].ToString();

                employee.firstName = (txtFirstName.Text == "" || txtFirstName.Text == null) ? employee.firstName : txtFirstName.Text;
                employee.lastName = (txtLastName.Text == "" || txtLastName.Text == null) ? employee.lastName : txtLastName.Text;
                employee.username = (userNameTextBox.Text == "" || userNameTextBox.Text == null) ? employee.username : userNameTextBox.Text;
                employee.password = (txtBoxPassword.Text == "" || txtBoxPassword.Text == null) ? employee.password : txtBoxPassword.Text;
                employee.address = (addressTextBox.Text == "" || addressTextBox.Text == null) ? employee.address : addressTextBox.Text;
                employee.city = (cityTextBox.Text == "" || cityTextBox.Text == null) ? employee.city : cityTextBox.Text;
                employee.state = (stateTextBox.Text == "" || stateTextBox.Text == null) ? employee.state : stateTextBox.Text;
                employee.zip = (zipTextBox.Text == "" || zipTextBox.Text == null) ? employee.zip : zipTextBox.Text;
                employee.phoneNumber = (mobilePhoneTextBox.Text == "" || mobilePhoneTextBox.Text == null) ? employee.phoneNumber : mobilePhoneTextBox.Text;

                Global.databaseManager.updateEmployee(employee,
                    () =>
                    {
                        LabelMessage.Text = "Employee updated successfully!";

                        // Refresh the employees list
                        LoadEmployeesList();
                    },
                    () =>
                    {
                        LabelMessage.Text = "Error updating employee! Please try again";

                        // Refresh the employees list
                        LoadEmployeesList();
                    });

            },
            () => {
                LabelMessage.Text = "An error occured! please try again!";

                // Refresh the employees list
                LoadEmployeesList();
            });

        
    }
    protected void deleteButton_Click(object sender, EventArgs e)
    {
        int employeeID = Int32.Parse(employeesList.SelectedItem.Value);
        Global.databaseManager.deleteEmployee(employeeID,
            () =>
            {
                LabelMessage.Text = "Employee deleted successfully";
            },
            () =>
            {
                LabelMessage.Text = "Error deleting employee!";
            });


        
        // Refresh the employees list
        LoadEmployeesList();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        LabelMessage.Text = "";

        Employee employee = new Employee();
        employee.firstName = txtFirstName.Text;
        employee.lastName = txtLastName.Text;
        employee.username = userNameTextBox.Text;
        employee.password = txtBoxPassword.Text;
        employee.address = addressTextBox.Text;
        employee.city = cityTextBox.Text;
        employee.state = stateTextBox.Text;
        employee.zip = zipTextBox.Text;
        employee.phoneNumber = mobilePhoneTextBox.Text;

        Global.databaseManager.insertEmployee(employee,
            () =>
            {
                LabelMessage.Text = "Employee successfully added";
            },
            () =>
            {
                LabelMessage.Text = "Error inserting new employee!";
            });

        // Refresh employee list
        LoadEmployeesList();
    }
}
