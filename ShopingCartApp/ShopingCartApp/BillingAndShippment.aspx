<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BillingAndShippment.aspx.cs" Inherits="ShopingCartApp.BillingAndShippment" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="padding-left: 100px">
            <h2>Shipping Address details:</h2>
            <br />
            <dx:ASPxTextBox ID="tbFullName" runat="server" Width="200px" Caption="Full Name">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="Full Name is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbAddress" runat="server" Width="200px" Caption="Address">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="Address is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbCity" runat="server" Width="200px" Caption="City">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="City is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbState" runat="server" Width="200px" Caption="State">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="State is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbCountry" runat="server" Width="200px" Caption="Country">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="Country is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbZip" runat="server" Width="200px" Caption="Zip Code">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="Zip Code is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbPhone" runat="server" Width="200px" Caption="Phone">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="Phone number is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <hr />
 
   
            <h2>Debit/Credit card details:</h2>
            <br />
            <dx:ASPxTextBox ID="tbCardNumber" runat="server" Width="200px" Caption="Card Number">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                    <RequiredField ErrorText="Card Number is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbNameOnCard" runat="server" Width="200px" Caption="Name on Card">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" Display="Dynamic" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                    <RegularExpression ErrorText="Only Alphabets are allowed" />
                    <RequiredField ErrorText="Name on Card is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <dx:ASPxTextBox ID="tbExpDate" runat="server" Width="200px" Caption="Expiration Date">
                <CaptionSettings Position="Top" />
                <ValidationSettings ValidationGroup="ShippingValidationGroup" Display="Dynamic" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                    <RegularExpression ErrorText="Please enter proper date format!" />
                    <RequiredField ErrorText="Expiration Date is required." IsRequired="true" />
                </ValidationSettings>
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxTextBox>
            <br />
            <dx:ASPxButton ID="btnCompleteAndPreview" runat="server" Text="Preview Order" ValidationGroup="ShippingValidationGroup"
                OnClick="btnSave_Click" Theme="BlackGlass">
            </dx:ASPxButton>
    </div>
</asp:Content>
