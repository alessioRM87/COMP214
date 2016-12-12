<%@ Page Title="" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="TaxGeneration.aspx.cs" Inherits="TaxGeneration" %>

<asp:Content ID="ContentTax" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>GENERATE TAX REFUND</h1>

    <h3>Incomes, taxes and contribution informations</h3>
    <br />

        <h3>Note : a tax can be generated only once per year. The employee ID is always 1. If there is an error, please try a different year</h3>


    <br />
    <br />

    <div class="form-group">
        <asp:Label ID="labelIncomes" runat="server" Text="Total incomes : "></asp:Label>
        <asp:TextBox ID="textboxIncomes" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label ID="labelTaxes" runat="server" Text="Total taxes paid : "></asp:Label>
        <asp:TextBox ID="textboxTaxes" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label ID="labelContributions" runat="server" Text="Total contributions : "></asp:Label>
        <asp:TextBox ID="textboxContributions" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
     <div class="form-group">
        <asp:Label ID="labelYear" runat="server" Text="Year : "></asp:Label>
        <asp:TextBox ID="textboxYear" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <br />
    <asp:Button ID="buttonGenerate" runat="server" Text="GENERATE TAX REFUND" CssClass="btn btn-default" OnClick="buttonGenerate_Click" />
    <br />
    <br />
    <asp:Label ID="labelMessage" runat="server"></asp:Label>
</asp:Content>

