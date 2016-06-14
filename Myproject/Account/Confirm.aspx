<%@ Page Title="אישור חשבון" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="FannyKaplanCrm.Account.Confirm" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <p>
                תודה על אישור החשבון, לחץ <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">כאן</asp:HyperLink>  להתחברות             
            </p>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
            <p class="text-danger">
               חלה טעות.
            </p>
        </asp:PlaceHolder>
    </div>
</asp:Content>
