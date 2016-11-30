using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Employee
/// </summary>
public class Employee
{
    public int employeeID { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string username { get; set; }
    public string password { get; set; }
    public string address { get; set; }
    public string city { get; set; }
    public string state { get; set; }
    public string zip { get; set; }
    public string phoneNumber { get; set; }


    public Employee()
    {
        employeeID = 0;
        firstName = "";
        lastName = "";
        username = "";
        password = "";
        address = "";
        city = "";
        state = "";
        zip = "";
        phoneNumber = "";

    }
}