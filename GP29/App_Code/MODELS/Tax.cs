using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Tax
/// </summary>
public class Tax
{
    public Tax()
    {
        refund = 0;
    }

    public int taxID { get; set; }

    public double incomes { get; set; }

    public double taxesPaid { get; set; }

    public double contributions { get; set; }

    public double refund { get; set; }

    public int year { get; set; }
}