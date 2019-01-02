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
        ShoppingCartEntities db = new ShoppingCartEntities();
        AddToCart ac = new AddToCart();

        protected void Page_Load(object sender, EventArgs e)
        {
            Sale sale = Session["Sale"] as Sale;
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

                GridView1.DataSource = ac.CartListDetails;

                GridView1.DataBind();
                GridView1.FooterRow.Cells[0].Text = "Total";
                GridView1.FooterRow.Cells[2].Font.Bold = true;
                GridView1.FooterRow.Cells[3].Font.Bold = true;
                GridView1.FooterRow.Cells[2].Text = ac.CartListDetails.Sum(p => p.Quantity).ToString();
                GridView1.FooterRow.Cells[3].Text = ac.CartListDetails.Sum(p => p.Price).ToString(CultureInfo.InvariantCulture);
            }
        }

        protected void btnPlaceOrder_OnClick(object sender, EventArgs e)
        {
            decimal amount = 0;
            Sale sale = Session["Sale"] as Sale;
            db.Sales.Add(sale);
            db.SaveChanges();
            foreach (var item in ac.CartListDetails)
            {
                item.SaleId = sale.Id;
                var products = db.Products1.Find(item.ProductId);
                if (products != null)
                    amount = amount + (products.Product_Price * item.Quantity);
                db.SaleDetails.Add(item);
                db.SaveChanges();
            }
            var savedSale = db.Sales.Find(sale.Id);
            savedSale.Amount = amount;
            db.SaveChanges();
            ac.CartListDetails.Clear();
            Response.Redirect("OrderConfirmation.aspx");
        }
    }
}