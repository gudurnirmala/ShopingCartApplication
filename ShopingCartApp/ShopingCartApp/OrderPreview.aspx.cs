using ShopingCartApp.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class OrderPreview : System.Web.UI.Page
    {
        ShoppingCartEntities _db = new ShoppingCartEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var saleId = Convert.ToInt32(Request.QueryString["Id"]);
            if (saleId != 0)
            {
                var sale = _db.Sales.Find(saleId);
                if (sale != null)
                {
                    Fullname.Text = sale.FullName;
                    Address.Text = sale.Address;
                    City.Text = sale.City;
                    State.Text = sale.State;
                    Country.Text = sale.Country;
                    Phone.Text = sale.Phone;
                    CardNumber.Text = sale.CardNumber;
                    NameOnCard.Text = sale.NameOnCard;
                    ExpDate.Text = sale.ExpiryDate.ToString(CultureInfo.InvariantCulture);
                    var saledetails = _db.SaleDetails.Where(p => p.SaleId == sale.Id).ToList();
                    if (saledetails.Count > 0)
                    {
                        foreach (var item in saledetails)
                        {
                            var products = _db.Products1.Find(item.ProductId);
                            if (products != null)
                                item.ProductName = products.Product_Name;
                            var find = _db.Products1.Find(item.ProductId);
                            if (find != null)
                                item.Price =
                                    decimal.Round(find.Product_Price * item.Quantity, 2);
                        }

                        GridView1.DataSource = saledetails;

                        GridView1.DataBind();
                        GridView1.FooterRow.Cells[0].Text = "Total";
                        GridView1.FooterRow.Cells[2].Font.Bold = true;
                        GridView1.FooterRow.Cells[3].Font.Bold = true;
                        GridView1.FooterRow.Cells[2].Text = saledetails.Sum(p => p.Quantity).ToString();
                        GridView1.FooterRow.Cells[3].Text = saledetails.Sum(p => p.Price).ToString(CultureInfo.InvariantCulture);
                    }
                }
            }
          
        }

        protected void btnPlaceOrder_OnClick(object sender, EventArgs e)
        {
          Response.Redirect("OrderConfirmation.aspx");
        }
    }
}