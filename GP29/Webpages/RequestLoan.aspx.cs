using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestLoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddlAmount_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void ddlDuration_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Loan loan = new Loan();

        try
        {
            loan.loanValue = Double.Parse(ddlAmount.SelectedItem.Value);
            loan.years = Int32.Parse(ddlDuration.SelectedItem.Value);
            loan.interestRate = Double.Parse(txtInterest.Text);

            Global.databaseManager.insertLoan(loan,
                () =>
                {
                    labelMessage.Text = "Loan successfully created!";
                },
                () =>
                {
                    labelMessage.Text = "An error occured! please try again!";
                });
        }
        catch
        {
            labelMessage.Text = "Please insert correct values for loan!";
        }


    }
}