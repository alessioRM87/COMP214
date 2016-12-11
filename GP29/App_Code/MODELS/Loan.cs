using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Loan
/// </summary>
public class Loan
{
    public Loan()
    {
    }

    public int loanID { get; set; }

    public double loanValue { get; set; }

    public int years { get; set; }

    public double interestRate { get; set; }

    public int companyID { get; set; }

    public int employeeID { get; set; }
}