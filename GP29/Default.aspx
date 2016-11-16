<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Welcome to Dorknozzle!" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<h1>Company News</h1>
  <p>We'll add some news later.</p>
  <h1>Company Events</h1>
  <p>We'll add company events later.</p>--%>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDPRODUCT" DataSourceID="oracleTestDS" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="IDPRODUCT" HeaderText="IDPRODUCT" ReadOnly="True" SortExpression="IDPRODUCT" />
        <asp:BoundField DataField="PRODUCTNAME" HeaderText="PRODUCTNAME" SortExpression="PRODUCTNAME" />
        <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
        <asp:BoundField DataField="PRODUCTIMAGE" HeaderText="PRODUCTIMAGE" SortExpression="PRODUCTIMAGE" />
        <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
        <asp:BoundField DataField="SALESTART" HeaderText="SALESTART" SortExpression="SALESTART" />
        <asp:BoundField DataField="SALEEND" HeaderText="SALEEND" SortExpression="SALEEND" />
        <asp:BoundField DataField="SALEPRICE" HeaderText="SALEPRICE" SortExpression="SALEPRICE" />
        <asp:BoundField DataField="ACTIVE" HeaderText="ACTIVE" SortExpression="ACTIVE" />
        <asp:BoundField DataField="FEATURED" HeaderText="FEATURED" SortExpression="FEATURED" />
        <asp:BoundField DataField="FEATURESTART" HeaderText="FEATURESTART" SortExpression="FEATURESTART" />
        <asp:BoundField DataField="FEATUREEND" HeaderText="FEATUREEND" SortExpression="FEATUREEND" />
        <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
        <asp:BoundField DataField="IDDEPARTMENT" HeaderText="IDDEPARTMENT" SortExpression="IDDEPARTMENT" />
        <asp:BoundField DataField="STOCK" HeaderText="STOCK" SortExpression="STOCK" />
        <asp:BoundField DataField="ORDERED" HeaderText="ORDERED" SortExpression="ORDERED" />
        <asp:BoundField DataField="REORDER" HeaderText="REORDER" SortExpression="REORDER" />
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
</asp:GridView>

<asp:SqlDataSource ID="oracleTestDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;BB_PRODUCT&quot;"></asp:SqlDataSource>

</asp:Content>

