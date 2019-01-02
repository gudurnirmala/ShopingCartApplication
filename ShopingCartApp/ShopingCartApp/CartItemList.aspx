<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartItemList.aspx.cs" Inherits="ShopingCartApp.CartItemList" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="margin-top: 100px;">
        <asp:GridView ID="cartGrid" runat="server" AutoGenerateColumns="False" ShowFooter="True" CssClass="mydatagrid"
            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" OnRowDeleting="cartGrid_OnRowDeleting" >
            <Columns>
                <%--<asp:BoundField DataField="ProductId" HeaderText="Item Id" Visible="False"/>--%>
                <asp:TemplateField HeaderText="Product Id">

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
                <asp:BoundField DataField="ProductName" HeaderText="Product name" />
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:UpdatePanel runat="server" ID="UpId" UpdateMode="Conditional" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <asp:TextBox ID="TxtQty" runat="server"
                                    Text='<%#Bind("Quantity") %>' OnTextChanged="TxtQty_TextChanged"
                                    AutoPostBack="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Price" HeaderText="Amount" />
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Remove">
                <ControlStyle BackColor="White" BorderColor="#999999" />
                </asp:ButtonField>
            </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>

        </asp:GridView>
   
    <br />
    <%if (cartGrid.Rows.Count > 0)
        { %>
    <dx:ASPxButton ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" Theme="BlackGlass">
    </dx:ASPxButton>
    <br />
    <%}
        else
        { %>
    <label>Your cart is empty</label>
    <%} %> </div>
</asp:Content>
