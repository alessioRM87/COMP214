<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList id="dataListEmployees" runat="server" DataKeyField="EmployeeID" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <b>Name:</b> <%# Eval("Name") %>
                <br />
                <b>Username:</b> <%# Eval("Username") %>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
