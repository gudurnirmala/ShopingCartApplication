<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShopingCartApp.Login" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
    <div class="accountHeader">
    <h2>Log In</h2>
    <p>
        Please enter your username and password. <a href="Register.aspx">Register</a> if you don't have an account.
    </p>
    <p style="color:red">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    </div>
    
    <dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px" Caption="User Name">
        <CaptionSettings Position="Top" />
        <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
            <RequiredField ErrorText="User Name is required." IsRequired="true" />
        </ValidationSettings>
    </dx:ASPxTextBox>
    <dx:ASPxTextBox ID="tbPassword" runat="server" Password="true" Width="200px" Caption="Password">
        <CaptionSettings Position="Top" />
        <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
            <RequiredField ErrorText="Password is required." IsRequired="true" />
        </ValidationSettings>
    </dx:ASPxTextBox>
    <br />
    <dx:ASPxButton ID="btnLogin" runat="server" Text="Log In" ValidationGroup="LoginUserValidationGroup"
                   OnClick="btnLogin_Click" Theme="BlackGlass">
    </dx:ASPxButton>
 
    </div>
</asp:Content>
