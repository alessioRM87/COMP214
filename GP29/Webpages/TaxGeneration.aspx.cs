using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TaxGeneration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void buttonGenerate_Click(object sender, EventArgs e)
    {
        Tax tax = new Tax();
        tax.incomes = Double.Parse(textboxIncomes.Text);
        tax.taxesPaid = Double.Parse(textboxTaxes.Text);
        tax.contributions = Double.Parse(textboxContributions.Text);
        tax.year = Int32.Parse(textboxYear.Text);

        Global.databaseManager.insertTax(tax,
            (refund) =>
            {
                labelMessage.Text = "Tax generated correctly! REFUND : " + refund;
            },
            () =>
            {
                labelMessage.Text = "An error occured! Please try again! ";
            }
        );
    }
}