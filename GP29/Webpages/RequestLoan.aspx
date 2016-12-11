<%@ Page Title="" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="RequestLoan.aspx.cs" Inherits="RequestLoan" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Request A Loan</h1>

    <h3>Loan Information</h3>

    <span class="widelabel2">Amount:</span>
    <asp:DropDownList ID="ddlAmount" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAmount_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="1000" Text="$1,000" />
        <asp:ListItem Value="5000" Text="$5,000" />
        <asp:ListItem Value="10000" Text="$10,000" />
        <asp:ListItem Value="20000" Text="$20,000" />
        <asp:ListItem Value="50000" Text="$50,000" />
        <asp:ListItem Value="100000" Text="$100,000" />
    </asp:DropDownList>

    
    <br />
    <span class="widelabel2">Duration (months):</span>
    <asp:DropDownList ID="ddlDuration" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDuration_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="3" Text="3" />
        <asp:ListItem Value="6" Text="6" />
        <asp:ListItem Value="9" Text="9" />
        <asp:ListItem Value="12" Text="12" />
        <asp:ListItem Value="15" Text="15" />
        <asp:ListItem Value="18" Text="18" />
        <asp:ListItem Value="21" Text="21" />
        <asp:ListItem Value="24" Text="24" />
        <asp:ListItem Value="27" Text="27" />
        <asp:ListItem Value="30" Text="30" />
    </asp:DropDownList>
    <br />
    <span class="widelabel2">Total Interest:</span>
    <asp:TextBox ID="txtInterest" runat="server" />  
    <br />
    <br />
    <asp:Button Text="Submit" ID="btnSubmit" runat="server" />

</asp:Content>

