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

    #endregion
}