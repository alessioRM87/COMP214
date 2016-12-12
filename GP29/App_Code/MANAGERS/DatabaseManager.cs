using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per DatabaseManager
/// </summary>
public class DatabaseManager
{

    #region AutoProperties

    private OracleConnection connection { get; set; }

    #endregion

    #region Variable Declaration

    private const String connectionString = "Dorknozzle";

    #endregion

    #region Constructor
    public DatabaseManager()
    {
        connection = new OracleConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString);
    }

    #endregion

    #region Methods

    public void getEmployees(Action<DataSet> success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SELECT * FROM EMPLOYEE", connection);

        try
        {
            connection.Open();

            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(oracleCommand);

            DataSet dataSet = new DataSet();

            oracleDataAdapter.Fill(dataSet);

            connection.Close();

            success.Invoke(dataSet);

        }
        catch
        {
            connection.Close();

            failure.Invoke();
        }
        
    }

    public void getEmployeesSummaries(Action<DataSet> success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SELECT EMPLOYEEID, FIRSTNAME FROM EMPLOYEE", connection);

        try
        {
            connection.Open();

            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(oracleCommand);

            DataSet dataSet = new DataSet();

            oracleDataAdapter.Fill(dataSet);

            connection.Close();

            success.Invoke(dataSet);

        }
        catch
        {
            connection.Close();

            failure.Invoke();
        }
    }
    public void getEmployeeByID(int employeeID, Action<DataSet> success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SELECT * FROM EMPLOYEE WHERE EMPLOYEEID = :EmployeeID", connection);

        oracleCommand.Parameters.Add("EmployeeID", employeeID);

        try
        {
            connection.Open();

            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(oracleCommand);

            DataSet dataSet = new DataSet();

            oracleDataAdapter.Fill(dataSet);

            connection.Close();

            success.Invoke(dataSet);

        }
        catch
        {
            connection.Close();

            failure.Invoke();
        }
        
    }

    public void searchEmployees(string searchType, string searchStr, Action<DataSet> success, Action<string> failed)
    {
        string query = "";

        switch(searchType)
        {
            case "fname":
                query = "SELECT * FROM EMPLOYEE " +
            "WHERE UPPER(FIRSTNAME) LIKE '%' || :SS  || '%' ";
                break;
            case "lname":
                query = "SELECT * FROM EMPLOYEE " +
            "WHERE UPPER(LASTNAME) LIKE '%' || :SS  || '%' ";
                break;
            case "uname":
                query = "SELECT * FROM EMPLOYEE " +
            "WHERE UPPER(USERNAME) LIKE '%' || :SS  || '%' ";
                break;
        }

        
        OracleCommand oracleCommand = new OracleCommand(query, connection);
        oracleCommand.Parameters.Add("SS", OracleDbType.Varchar2).Value = searchStr.Trim().ToUpper();

        try
        {
            connection.Open();

            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(oracleCommand);

            DataSet dataSet = new DataSet();

            oracleDataAdapter.Fill(dataSet);

            connection.Close();

            success.Invoke(dataSet);

        }
        catch(Exception ex)
        {
            connection.Close();

            failed.Invoke(ex.Message);
        }
        
    }

    public void insertEmployee(Employee employee, Action success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SP_INSERT_EMPLOYEE", connection);

        oracleCommand.CommandType = CommandType.StoredProcedure;

        oracleCommand.Parameters.Add("FIRSTNAME", employee.firstName);
        oracleCommand.Parameters.Add("LASTNAME", employee.lastName);
        oracleCommand.Parameters.Add("USERNAME", employee.username);
        oracleCommand.Parameters.Add("PASSWORD", employee.password);
        oracleCommand.Parameters.Add("ADDRESS", employee.address);
        oracleCommand.Parameters.Add("CITY", employee.city);
        oracleCommand.Parameters.Add("STATE", employee.state);
        oracleCommand.Parameters.Add("ZIP", employee.zip);
        oracleCommand.Parameters.Add("PHONENUMBER", employee.phoneNumber);
        //TODO Remove hardcoded values
        oracleCommand.Parameters.Add("DEPARTMENTID", 3);
        oracleCommand.Parameters.Add("COMPANYID", 1);

        try
        {
            connection.Open();

            oracleCommand.ExecuteNonQuery();

            connection.Close();

            success.Invoke();
        }
        catch
        {
            connection.Close();

            failure.Invoke();
        }
        
    }

    public void updateEmployee(Employee employee, Action success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("UPDATE Employee" + 
            " SET FIRSTNAME=:Firstname, LASTNAME=:Lastname, USERNAME=:Username, " +
            "ADDRESS=:Address, CITY=:City, STATE=:State, ZIP=:Zip, " +
            "PHONENUMBER=:PhoneNumber " +
            "WHERE EMPLOYEEID=:EmployeeID", connection);

        oracleCommand.Parameters.Add("Firstname", employee.firstName);
        oracleCommand.Parameters.Add("Lastname", employee.lastName);
        oracleCommand.Parameters.Add("Username", employee.username);
        oracleCommand.Parameters.Add("Address", employee.address);
        oracleCommand.Parameters.Add("City", employee.city);
        oracleCommand.Parameters.Add("State", employee.state);
        oracleCommand.Parameters.Add("Zip", employee.zip);
        oracleCommand.Parameters.Add("PhoneNumber", employee.phoneNumber);
        oracleCommand.Parameters.Add("EmployeeID", employee.employeeID);

        try
        {
            connection.Open();

            oracleCommand.ExecuteNonQuery();

            connection.Close();

            success.Invoke();
        }
        catch (Exception e)
        {
            connection.Close();

            failure.Invoke();
        }
    }

    public void deleteEmployee(int employeeID, Action success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SP_DELETE_EMPLOYEE", connection);

        oracleCommand.CommandType = CommandType.StoredProcedure;

        oracleCommand.Parameters.Add("EMPLOYEEID", employeeID);
        OracleParameter returnParameter = oracleCommand.Parameters.Add("SUCCESS", OracleDbType.Byte);
        returnParameter.Direction = ParameterDirection.ReturnValue;

        try
        {
            connection.Open();

            oracleCommand.ExecuteNonQuery();

            Boolean successReturn = (Boolean)returnParameter.Value;

            if (successReturn)
            {
                connection.Close();

                success.Invoke();
            }
            else
            {
                connection.Close();

                failure.Invoke();
            }
        }
        catch
        {
            connection.Close();

            failure.Invoke();
        }
        
    }

    public void insertTax(Tax tax, Action<double> success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SP_INSERT_TAX", connection);

        oracleCommand.CommandType = CommandType.StoredProcedure;

        oracleCommand.Parameters.Add("EMPLOYEEID", 1);
        oracleCommand.Parameters.Add("INCOME", tax.incomes);
        oracleCommand.Parameters.Add("TAXESPAID", tax.taxesPaid);
        oracleCommand.Parameters.Add("CONTR", tax.contributions);
        oracleCommand.Parameters.Add("TAXYEAR", tax.year);
        oracleCommand.Parameters.Add("REFUND", tax.refund);
        oracleCommand.Parameters["REFUND"].Direction = ParameterDirection.Output;

        try
        {
            connection.Open();

            oracleCommand.ExecuteNonQuery();

            connection.Close();

            connection.Open();

            OracleCommand oracleCommandSelect = new OracleCommand("SELECT REFUND FROM TAX WHERE (EMPLOYEEID = :EmployeeID AND TAXYEAR = :TaxYear)", connection);

            oracleCommandSelect.Parameters.Add("EmployeeID", 1);
            oracleCommandSelect.Parameters.Add("TaxYear", tax.year);

            Console.WriteLine(oracleCommand);

            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(oracleCommandSelect);

            DataSet dataSet = new DataSet();

            oracleDataAdapter.Fill(dataSet);

            tax.refund = Double.Parse(dataSet.Tables[0].Rows[0]["REFUND"].ToString());

            success.Invoke(tax.refund);
        }
        catch (Exception e)
        {
            connection.Close();

            Console.WriteLine(e.Message);
            failure.Invoke();
        }
        
    }

    public void insertLoan(Loan loan, Action success, Action failure)
    {
        OracleCommand oracleCommand = new OracleCommand("SP_INSERT_LOAN", connection);

        oracleCommand.CommandType = CommandType.StoredProcedure;

        oracleCommand.Parameters.Add("LOANVALUE", loan.loanValue);
        oracleCommand.Parameters.Add("YEARS", loan.years);
        oracleCommand.Parameters.Add("INTERESTRATE", loan.interestRate);
        oracleCommand.Parameters.Add("EMPLOYEEID", 1);

        try
        {
            connection.Open();

            oracleCommand.ExecuteNonQuery();

            connection.Close();

            success.Invoke();
        }
        catch (Exception e)
        {
            connection.Close();

            failure.Invoke();
        }
    }

    #endregion
}