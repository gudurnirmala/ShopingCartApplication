<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ShopingCartApp.ProductList" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCardView ID="CardView" ClientInstanceName="cardView" runat="server" EnableCardsCache="False"
        Width="100%" KeyFieldName="Product_Id" AutoGenerateColumns="False">
        <ClientSideEvents FocusedCardChanged="OnFocusedCardChanged" />
        <SettingsBehavior AllowFocusedCard="true" />
        <SettingsPager EnableAdaptivity="true" EndlessPagingMode="OnScroll" Mode="ShowAllRecords">
            <SettingsTableLayout ColumnCount="4" RowsPerPage="1" />
        </SettingsPager>

        <Columns>
            <dx:CardViewTextColumn FieldName="Product_Id" ReadOnly="True" Visible="False" VisibleIndex="0">
            </dx:CardViewTextColumn>
            <dx:CardViewHyperLinkColumn ReadOnly="True" VisibleIndex="1">
                <DataItemTemplate>
                    <a href="AddToCart.aspx?Product_Id=<%# Container.KeyValue%>">
                        <dx:ASPxImage runat="server" ID="Imagectrl" ImageUrl='<%#Eval("Product_Image_Path")%>' Height="200px" Width="200px"></dx:ASPxImage>
                    </a>
                </DataItemTemplate>
            </dx:CardViewHyperLinkColumn>
            <dx:CardViewHyperLinkColumn ReadOnly="True" VisibleIndex="1">
                <DataItemTemplate>
                    <a href="AddToCart.aspx?Product_Id=<%# Container.KeyValue%>"><%#Eval("Product_Name")%></a>
                </DataItemTemplate>
            </dx:CardViewHyperLinkColumn>
        <%--    <dx:CardViewHyperLinkColumn ReadOnly="True" VisibleIndex="1">
                <DataItemTemplate>
                    <a href="AddToCart.aspx?Product_Id=<%# Container.KeyValue%>"><%#Eval("Product_Description")%></a>
                </DataItemTemplate>
            </dx:CardViewHyperLinkColumn>--%>

            <dx:CardViewTextColumn VisibleIndex="4">
                <DataItemTemplate>
                    <dx:ASPxLabel runat="server" Text='<%# string.Format("{0:c}", Eval("Product_Price")) %>' OnLoad="OnLoad"></dx:ASPxLabel>
                </DataItemTemplate>
            </dx:CardViewTextColumn>
        </Columns>
    </dx:ASPxCardView>
    <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
</asp:Content>
