﻿

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Myproject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<br>
         <div class="row">
     
      <h2  dir= "rtl">כאן תוכלו לנהל את המידע של לקוחותיכם -להוסיף,למחוק, לחדש ולחפש כל מידע רלוונטי לגבי הלקוחות שלכם </h2>
 </div>
  

    <div class="jumbotron"  >
        
      <p  dir="rtl">

       <a href="logoutPage.aspx" ><asp:Label ID="Label1" runat="server" Text="ברוכים הבאים"></asp:Label></a>

        </p>
        <p class="lead" dir="rtl"><a href="/forms/searchItem.aspx" class="btn btn-primary btn-lg"> חיפוש לקוח קיים  &raquo;</a></p>
        <p class="lead" dir="rtl"> <a href="/forms/Child.aspx" class="btn btn-primary btn-lg"> לקוח-ילד &raquo;</a></p>
        <p class="lead" dir="rtl"><a href="/forms/adult.aspx" class="btn btn-primary btn-lg"> לקוח-מבוגר &raquo;</a></p>
        <p class="lead" dir="rtl"><a href="/forms/Interest.aspx" class="btn btn-primary btn-lg"> לקוח חדש מתעניין &raquo;</a></p>
        
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <h2 dir="rtl">הדרכה</h2>
            <p dir="rtl">
                סירטון הדרכה למשתמש
            </p>
            <p dir="rtl">
                <a class="btn btn-default" href="">למד עוד &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2 dir="rtl">לקבלת עידכונים שוטפים </h2>
            <p>
               
            </p>
            <p dir="rtl">
                <a class="btn btn-default" href="https://www.facebook.com/matnaspat/">דף הפייסבוק &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2 dir="rtl">אתר המתנ"ס</h2>
            <p>
               
            </p>
            <p dir="rtl">
                <a class="btn btn-default"  href="http://fannykaplan.org/page.php?page=1&&cntr=heb">פאני קפלן &raquo;</a>
            </p>
        </div>
    </div>
    </br>
</asp:Content>
