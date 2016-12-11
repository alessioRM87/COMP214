<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="AdminTools.aspx.cs" Inherits="AdminTools" Title="Dorknozzle Admin Tools" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Admin Tools</h1>

    <div> 
      <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-default" Text="Update Employee" OnClick="btnUpdate_Click" />
      <br />
        <br />
      <asp:Button ID="btnAddNew" runat="server" CssClass="btn btn-default" Text="Add new Employee" OnClick="btnAddNew_Click" />
          
    </div>
    <br />

  <div style="float:none">
      <p id="pUpdate" runat="server">
        <asp:Label ID="dbErrorLabel" ForeColor="Red" runat="server" />
        Select an employee to update:<br />
        <asp:DropDownList ID="employeesList" runat="server" />
        <asp:Button ID="selectButton" Text="Select" runat="server" 
          onclick="selectButton_Click" />
      </p>
      <p id="pAddNew" runat="server">
          Enter new employee details:   
      </p>
  </div>
  <p>
    <span class="widelabel">First Name:</span>
    <asp:TextBox ID="txtFirstName" runat="server" />
    <br />
    <span class="widelabel">Last Name:</span>
    <asp:TextBox ID="txtLastName" runat="server" />
    <br />
    <span class="widelabel">User Name:</span>
    <asp:TextBox ID="userNameTextBox" runat="server" />
    <br />
     <span class="widelabel">Password:</span>
    <asp:TextBox ID="txtBoxPassword" runat="server" />
    <br />
    <span class="widelabel">Address:</span>
    <asp:TextBox ID="addressTextBox" runat="server" />
    <br />
    <span class="widelabel">City:</span>
    <asp:TextBox ID="cityTextBox" runat="server" />
    <br />
    <span class="widelabel">State:</span>
    <asp:TextBox ID="stateTextBox" runat="server" />
    <br />
    <span class="widelabel">Zip:</span>
    <asp:TextBox ID="zipTextBox" runat="server" />
    <br />
    <span class="widelabel">Home Phone:</span>
    <asp:TextBox ID="homePhoneTextBox" runat="server" />
    <br />
    <span class="widelabel">Extension:</span>
    <asp:TextBox ID="extensionTextBox" runat="server" />
    <br />
    <span class="widelabel">Mobile Phone:</span>
    <asp:TextBox ID="mobilePhoneTextBox" runat="server" />
    <br />
    <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>

  </p>
  <p id="pUpdateBottom" runat="server">
    <asp:Button ID="updateButton" Text="Update Employee" runat="server" onclick="updateButton_Click" />
    <asp:Button ID="deleteButton" Text="Delete Employee" runat="server" onclick="deleteButton_Click" />
  </p>

    <p id="pAddNewBottom" runat="server">
        <asp:Button ID="btnAdd" Text="Add Employee" runat="server" OnClick="btnAdd_Click" />
  </p>

    <%--<script type="text/javascript">
        $(function () {
            
            $(".pUpdate").css("visibility", "visible");
            $(".pAddNew").css("visibility", "hidden");

            $("#btnUpdate").click(function () {
                $(".pUpdate").css("visibility", "visible");
                $(".pAddNew").css("visibility", "collapse");
            });

            $("#btnAddNew").click(function () {
                $(".pUpdate").css("visibility", "collapse");
                $(".pAddNew").css("visibility", "visible");
            });
        });
    </script>--%>

</asp:Content>

