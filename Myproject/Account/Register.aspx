<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Myproject.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <body dir="rtl">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div dir="rtl" class="form-horizontal">
        <h4>יצירת חשבון חדש</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div dir="rtl" class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" dir="rtl">דואר אלקטרוני</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="נא הזן דואר אלקטרוני" />
            </div>
        </div>
        <div dir="rtl" class="form-group">
            <asp:Label dir="rtl" runat="server" AssociatedControlID="Password" >סיסמא</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="נא הזן סיסמא" />
            </div>
        </div>
        <div dir="rtl" class="form-group">
            <asp:Label dir="rtl" runat="server" AssociatedControlID="ConfirmPassword" >סיסמא שנית</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="השדה חובה " />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="הסיסמא לא זהה" />
            </div>
        </div>
        <div dir="rtl" class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="הירשם" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
        </body>
</asp:Content>
