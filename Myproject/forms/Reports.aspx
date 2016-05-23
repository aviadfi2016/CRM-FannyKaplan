
<%@ Page Title="הנפקת דוחות" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" Codefile="Reports.aspx.cs" Inherits="Myproject.forms.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body dir="rtl">
    <h2 ><%: Title %></h2>
    
    <br />
          דוחות
        
<br />

    <div>  
   <table dir="rtl">
    <tr>

       
        <td>
        <asp:DropDownList ID="DropDownList2" runat="server">
    
        <asp:ListItem>מבוגר</asp:ListItem>
        <asp:ListItem>ילד</asp:ListItem>            
        <asp:ListItem>מתעניין</asp:ListItem>
    </asp:DropDownList>     
            
   <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem >-- קטגוריה--</asp:ListItem> 
        <asp:ListItem>פעולה משרדית</asp:ListItem>
       <asp:ListItem>חוגים</asp:ListItem>
        <asp:ListItem>דואר אלקטרוני</asp:ListItem>            
        <asp:ListItem>טלפון נייד</asp:ListItem>
       <asp:ListItem>שכונה</asp:ListItem>
    </asp:DropDownList>

            

 









</body>

    </asp:Content>