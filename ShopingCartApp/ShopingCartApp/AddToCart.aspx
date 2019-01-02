<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="ShopingCartApp.AddToCart" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <div style="padding-top:100px ">
    <table style="border-collapse: collapse;Padding-top:100px">
        <tr>
            <td rowspan="6" style="padding-right: 20px">
                <asp:Image ID="Image1" runat="server" Width="300px" Height="300px" />
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel runat="server"  ID="ProductName" Font-Bold="True" Font-Size="Medium" ></dx:ASPxLabel>
              <%--  <asp:Label ID="lblProductName" runat="server" ReadOnly="true"></asp:Label>--%>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server"  ID="ProductDescription" ></dx:ASPxLabel>
             <%--   <asp:Label ID="lblProductDescription" runat="server" ReadOnly="true"></asp:Label>--%>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel runat="server"  ID="lblPrice"></dx:ASPxLabel>
                 <%--  <dx:ASPxTextBox  runat="server" Width="200px" Caption="Price" ID="tbPrice" ReadOnly="True" Theme="BlackGlass"> 
                    <CaptionSettings Position="Top" />
                       <CaptionStyle Font-Bold="True">
                       </CaptionStyle>
                </dx:ASPxTextBox>--%>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxSpinEdit ID="spQty" runat="server" Number="1" Theme="BlackGlass" Caption="Quantity">
                    <CaptionSettings Position="Top" />
                    <CaptionStyle Font-Bold="True">
                    </CaptionStyle>
                </dx:ASPxSpinEdit>
           
             <%--   <dx:ASPxTextBox ID="tbQty" runat="server" Width="200px" Caption="Quantity">
                    <CaptionSettings Position="Top" />
                    <ValidationSettings ValidationGroup="ValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                        <RequiredField ErrorText="Quantity is required." IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>--%>
             <%--   <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>--%>

            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="AddToCartbtn" runat="server" Text="Add to cart" ValidationGroup="ValidationGroup"
                               OnClick="btnSave_Click" Theme="BlackGlass">
                </dx:ASPxButton>
           <%--     <asp:Button ID="btnSave" runat="server" Text="Add to cart" OnClick="btnSave_Click" />--%>
            </td>
        </tr>
    </table>

 </div>
 
</asp:Content>
