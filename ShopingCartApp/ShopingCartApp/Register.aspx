<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShopingCartApp.Register" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div class="accountHeader">
            <h2>Create a New Account</h2>
            <p>Use the form below to create a new account.</p><br/>
            <p style="color:red" id="errormessageP" runat="server">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
        </div>
        <dx:ASPxTextBox ID="tbFirstName" runat="server" Width="200px" Caption="First Name">
            <CaptionSettings Position="Top" />
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="First Name is required." IsRequired="true" />
            </ValidationSettings>
        </dx:ASPxTextBox>

        <dx:ASPxTextBox ID="tbLastName" runat="server" Width="200px" Caption="Last Name">
            <CaptionSettings Position="Top" />
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="Last Name is required." IsRequired="true" />
            </ValidationSettings>
        </dx:ASPxTextBox>

        <dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px" Caption="User Name">
            <CaptionSettings Position="Top" />
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="User Name is required." IsRequired="true" />
            </ValidationSettings>
        </dx:ASPxTextBox>
        <dx:ASPxTextBox ID="tbEmail" runat="server" Width="200px" Caption="E-mail">
            <CaptionSettings Position="Top" />
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="E-mail is required." IsRequired="true" />
                <RegularExpression ErrorText="Email validation failed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
            </ValidationSettings>
        </dx:ASPxTextBox>
        <dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server" Width="200px" Caption="Password">
            <CaptionSettings Position="Top" />
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="Password is required." IsRequired="true" />
            </ValidationSettings>
        </dx:ASPxTextBox>
        <dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px" Caption="Confirm password">
            <CaptionSettings Position="Top" />
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="Confirm Password is required." IsRequired="true" />
            </ValidationSettings>
            <ClientSideEvents Validation="function(s, e) {
            var originalPasswd = Password.GetText();
            var currentPasswd = s.GetText();
            e.isValid = (originalPasswd  == currentPasswd );
            e.errorText = 'The Password and Confirmation Password must match.';
        }" />
        </dx:ASPxTextBox>
        <br />
        <dx:ASPxButton ID="btnCreateUser" runat="server" Text="Create User" ValidationGroup="RegisterUserValidationGroup"
                       OnClick="btnRegister_Click" Theme="BlackGlass">
        </dx:ASPxButton>
    </div>

  
</asp:Content>
