using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Global
/// </summary>
public static class Global
{
    #region Singleton Declarations

    private static DatabaseManager _databaseManager = new DatabaseManager();

    #endregion

    #region Singleton AutoProperties

    public static DatabaseManager databaseManager
    {
        get { return _databaseManager; }
    }

    #endregion
}