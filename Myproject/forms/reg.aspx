<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup   ="true" CodeBehind="reg.aspx.cs" Inherits="FannyKaplanCrm.forms.reg" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<body>  
      
     <div align="center">
    <fieldset style ="width:200px;">
    <legend>דף הרשמה </legend>

        <asp:TextBox ID="TextBox1" placeholder="שם משתמש"  dir="rtl" runat="server"
            Width="180px"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox3" placeholder="סיסמא" dir="rtl" runat="server"
            Width="180px" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="אישור"
           Width="81px" onclick="Button1_Click" />
            <br />
           
    </fieldset>
    </div>




            
            
        
    </body>  
  
    </html>  

    </asp:Content>