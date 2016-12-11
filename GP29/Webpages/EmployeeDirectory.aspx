<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="EmployeeDirectory.aspx.cs" Inherits="EmployeeDirectory" Title="Dorknozzle Employee Directory" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Employee Directory</h1>

    <div>
        <span>Search for employee: </span><br />
        <span style="width: 80px; display:inline-block">First name: </span><asp:TextBox ID="txtFname" runat="server"/>
        <asp:Button ID="btnFirstName" Text="Search" runat="server" OnClick="btnFirstName_Click" /><br />
        <span style="width: 80px; display:inline-block">Last name: </span><asp:TextBox ID="txtLname" runat="server"/>
        <asp:Button ID="btnLastName" Text="Search" runat="server" OnClick="btnLastName_Click"  /><br />
        <span style="width: 80px; display:inline-block">Username: </span><asp:TextBox ID="txtUname" runat="server"/>
        <asp:Button ID="btnUsername" Text="Search" runat="server" OnClick="btnUsername_Click" /><br />
        <%--<asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click"  />--%>
    </div>

    <br />
    <br />


    <asp:DataList ID="employeesList" runat="server"
        OnItemCommand="employeesList_ItemCommand">
        <ItemTemplate>
            <asp:Literal ID="extraDetailsLiteral" runat="server"
                EnableViewState="false" />
            Name: <strong><%#Eval("Firstname")%> <%#Eval("Lastname")%></strong><br />
            Username: <strong><%#Eval("Username")%></strong><br />
            <asp:LinkButton ID="detailsButton" runat="server"
                Text='<%#"View more details about " + Eval("Firstname")%>'
                CommandName="MoreDetailsPlease"
                CommandArgument='<%#Eval("EmployeeID")%>' />
            <br />
            <asp:LinkButton ID="editButton" runat="server"
                Text='<%#"Edit employee " + Eval("Firstname")%>'
                CommandName="EditItem"
                CommandArgument='<%#Eval("EmployeeID")%>' />
        </ItemTemplate>
        <EditItemTemplate>
            Name:
            <asp:TextBox ID="nameTextBox" runat="server"
                Text='<%#Eval("Firstname")%>' /><br />
            Username:
            <asp:TextBox ID="usernameTextBox" runat="server"
                Text='<%#Eval("Username")%>' /><br />
            <asp:LinkButton ID="updateButton" runat="server"
                Text="Update Item" CommandName="UpdateItem"
                CommandArgument='<%#Eval("EmployeeID")%>' />
            or
      <asp:LinkButton ID="cancelButton" runat="server"
          Text="Cancel Editing" CommandName="CancelEditing"
          CommandArgument='<%#Eval("EmployeeID")%>' />
        </EditItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:DataList>
</asp:Content>

