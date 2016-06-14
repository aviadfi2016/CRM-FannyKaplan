<%@ Page Title="מס' טלפון" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPhoneNumber.aspx.cs" Inherits="FannyKaplanCrm.Account.AddPhoneNumber" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3 dir="rtl"><%: Title %></h3>

    <div class="form-horizontal">
        <h4 dir="rtl">הוסף מס' טלפון</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <p class="text-danger" dir="rtl">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <div class="form-group" dir="rtl">
            <a  dir="rtl"><asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label" dir="rtl">מס' טלפון</asp:Label></a>
            <div class="col-md-10" dir="rtl">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                    CssClass="text-danger" ErrorMessage="חובה לציין מס' טלפון" />
            </div>
        </div>
        <div class="form-group" dir="rtl">
            <div class="col-md-offset-2 col-md-10" dir="rtl">
                <asp:Button runat="server" OnClick="PhoneNumber_Click"
                    Text="אישור" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
