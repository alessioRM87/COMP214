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
        if (!IsPostBack)
        {
            txtInterest.Attributes.Add("readonly", "readonly");
            computeInterest();
        }

    }

    protected void ddlAmount_SelectedIndexChanged(object sender, EventArgs e)
    {
        computeInterest();
    }

    protected void ddlDuration_SelectedIndexChanged(object sender, EventArgs e)
    {
        computeInterest();
    }

    private void computeInterest()
    {
        double interestPerMonth = 0.01;

        int amount = int.Parse(ddlAmount.SelectedValue);
        int months = int.Parse(ddlDuration.SelectedValue);

        double interest = amount * months * interestPerMonth;
        //txtInterest.Text = "$" + interest.ToString("#.##");
        //txtInterest.Text = string.Format("{0:#.00}", Convert.ToDecimal(interest) / 100);
        txtInterest.Text = interest.ToString("C", CultureInfo.GetCultureInfo("en-US"));
    }
}