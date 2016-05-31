<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup   ="true" CodeBehind="loginPage.aspx.cs" Inherits="Myproject.loginPage" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<body>
    
    <div align="center">
    <fieldset style ="width:200px;">
    <legend>Login page </legend>
        <asp:TextBox ID="txtusername" placeholder="username" runat="server"
            Width="180px"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtpassword" placeholder="password" runat="server"
            Width="180px" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnsubmit" runat="server" Text="Submit"
           Width="81px" onclick="btnsubmit_Click" />
            <br />
           
    </fieldset>
    </div>

    
</body>
</html>
    </asp:Content>