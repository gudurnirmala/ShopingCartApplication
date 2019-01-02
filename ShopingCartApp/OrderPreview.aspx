<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPreview.aspx.cs" Inherits="ShopingCartApp.OrderPreview" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="margin-top: 50px">


        <br />
        <table style="border-collapse: collapse" width="100%">
            <tr style="border-bottom: 1px solid #000;">
                <td style="height: 140px">
                    <dx:ASPxLabel ID="lblShippingDetails" runat="server" Text="Shipping Details" Font-Bold="True" Font-Size="Medium" Theme="BlackGlass"></dx:ASPxLabel>
                </td>
                <td style="margin: 20px;line-height: 5px">
                    <dx:ASPxLabel ID="Fullname" runat="server" Font-Size="18px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="Address" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="City" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="State" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="Country" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="Zip" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="Phone" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                </td>
            </tr>

            <tr style="border-bottom: 1px solid #000;">
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Card Details" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
                </td>
                <td style="line-height: 10px;padding-top: 20px">
                    <dx:ASPxLabel ID="CardNumber" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="NameOnCard" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <br />
                    <br />
                    <dx:ASPxLabel ID="ExpDate" runat="server" Font-Size="15px"></dx:ASPxLabel>
                    <%-- <span><b>Card number:</b>&nbsp;<asp:Label ID="lblCardno" runat="server"></asp:Label></span>
                        <br />
                        <span><b>Name on card:</b>&nbsp;<asp:Label ID="lblNameonCard" runat="server" ></asp:Label></span>
                        <br />--%>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding-top: 20px;text-align: left">
                    <dx:ASPxLabel ID="lblCardDetails" runat="server" Font-Size="Medium" Text="Cart Details" Font-Bold="True"></dx:ASPxLabel>
                    </td></tr>
                <tr>
                <td  colspan="3" style="padding-top: 20px;">
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="True" CssClass="mydatagrid"
                                  HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                        <Columns>
                            <%--<asp:BoundField DataField="ProductId" HeaderText="Item Id" Visible="False"/>--%>
                            <asp:TemplateField HeaderText="Item id">

                                <ItemTemplate>
                                    <asp:UpdatePanel runat="server" ID="PId" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <asp:TextBox ID="TxtProductId" runat="server" ReadOnly="True"
                                                         Text='<%#Bind("ProductId") %>'
                                                         AutoPostBack="true"></asp:TextBox>
                                        </ContentTemplate>

                                    </asp:UpdatePanel>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:BoundField DataField="ProductName" HeaderText="Item name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

                            <asp:BoundField DataField="Price" HeaderText="Amount" />

                        </Columns>

                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding-top: 20px;text-align: center">
                <dx:ASPxButton ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_OnClick" Theme="BlackGlass">
                </dx:ASPxButton></td>
            </tr>
        </table>
        <hr />
       

        <br />
    </div>
</asp:Content>
