<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="AdminTools.aspx.cs" Inherits="AdminTools" Title="Dorknozzle Admin Tools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Admin Tools</h1>

    <div>
      <div id="btnUpdate" style="background-color: blue; width:80px;text-align: center;cursor: pointer;">Update<br />employee</div>
        <br />
      <div id="btnAddNew" style="background-color: blue; width:80px;text-align: center;cursor: pointer;">Add new<br />employee</div>
    </div>

  <div style="float:none">
      <p class="pUpdate">
        <asp:Label ID="dbErrorLabel" ForeColor="Red" runat="server" />
        Select an employee to update:<br />
        <asp:DropDownList ID="employeesList" runat="server" />
        <asp:Button ID="selectButton" Text="Select" runat="server" 
          onclick="selectButton_Click" />
      </p>
      <p class="pAddNew">
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
  </p>
  <p class="pUpdate">
    <asp:Button ID="updateButton" Text="Update Employee" 
                Width="200" Enabled="False" runat="server" 
      onclick="updateButton_Click" />
    <asp:Button ID="deleteButton" Text="Delete Employee"
      Enabled="False" runat="server" onclick="deleteButton_Click" />
  </p>

    <p class="pAddNew">
        <asp:Button ID="btnAdd" Text="Add Employee" runat="server" OnClick="btnAdd_Click" />
        <asp:Label ID="LabelMessage" runat="server" Text="Label"></asp:Label>
  </p>

    <script type="text/javascript">
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
    </script>

</asp:Content>

