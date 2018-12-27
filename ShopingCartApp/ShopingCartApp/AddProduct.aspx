<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ShopingCartApp.AddProduct" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="margin: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="tbItemName" runat="server" Width="200px" Caption="Product Name">
                        <CaptionSettings Position="Top" />
                        <ValidationSettings ValidationGroup="ProductValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                            <RequiredField ErrorText="Product Name is required." IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                 <%--   <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="tbProductDesc" runat="server" Width="200px" Caption="Product Description">
                        <CaptionSettings Position="Top" />
                        <ValidationSettings ValidationGroup="ProductValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                            <RequiredField ErrorText="Product Description is required." IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="tbPrice" runat="server" Width="200px" Caption="Product Price">
                        <CaptionSettings Position="Top" />
                        <ValidationSettings ValidationGroup="ProductValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                            <RequiredField ErrorText="Product Price is required." IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 20px">
                    <asp:FileUpload ID="FileUpload" runat="server" style="margin-right: 0" />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxButton ID="btnAdd" runat="server" Text="Add Product" ValidationGroup="ProductValidationGroup"
                                   OnClick="btnSave_Click" Theme="BlackGlass">
                    </dx:ASPxButton>

                </td>
            </tr>
        </table>
<%--    Item name:<br>
    Description:<asp:TextBox ID="txtDescription" runat="server"></asp:TextBox><br>
    Price:<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox><br />
    Upload image:<asp:FileUpload ID="FileUpload1" runat="server" /> <br />
    
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    <br />--%>
    </div>
</asp:Content>
