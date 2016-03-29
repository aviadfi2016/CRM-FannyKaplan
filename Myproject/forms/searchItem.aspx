<%@ Page Title="חיפוש משתמש" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" Codefile="searchItem.aspx.cs" Inherits="Myproject.forms.searchItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body dir="rtl">
    <h2 ><%: Title %></h2>
    
    <br />
          חיפוש משתמש
        
<br />

    <div>  
   <table dir="rtl">
    <tr>
    <td> 
      חיפוש משתמש
        </td>
        <td>
        <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
        </td>
        <td> 
       <asp:Button Text="חיפוש" runat="server" OnClick="Search" />
        </td>
        
        </tr>
 
</table>
<table><tr><td><p><asp:Label ID="Label1" runat="server" Text="label"></asp:Label>  </p></td></tr></table>
 
<asp:GridView ID="GridView1" runat="server" >
    </asp:GridView> 
    </div>
























        </asp:Content>