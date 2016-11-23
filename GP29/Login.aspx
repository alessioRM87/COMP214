<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Dorknozzle Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Login</h1>
  
    <span class="widelabel">User Name:</span>
    <asp:TextBox ID="txtUser" runat="server" />  
    <br />
    <span class="widelabel">Password:</span>
    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />  
    <br />
    <asp:Button Text="Login" ID="btnLogin" runat="server" OnClick="btnLogin_Click" />

</asp:Content>

