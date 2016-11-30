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

    public void getEmployees(Action<DataSet> success, Action failed)
    {
        OracleCommand oracleCommand = new OracleCommand("SELECT * FROM EMPLOYEE", connection);

        try
        {
            connection.Open();

            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(oracleCommand);

            DataSet dataSet = new DataSet();

            oracleDataAdapter.Fill(dataSet);

            success.Invoke(dataSet);

        }
        catch
        {
            failed.Invoke();
        }
        finally
        {
            connection.Close();
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

            success.Invoke();
        }
        catch
        {
            failure.Invoke();
        }
        finally
        {
            connection.Close();
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
                success.Invoke();
            }
            else
            {
                failure.Invoke();
            }
        }
        catch
        {
            failure.Invoke();
        }
        finally
        {
            connection.Close();
        }
    }

    #endregion
}