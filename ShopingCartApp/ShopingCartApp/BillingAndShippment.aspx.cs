﻿using ShopingCartApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class BillingAndShippment : System.Web.UI.Page
    {
        ShoppingCartEntities db = new ShoppingCartEntities();
        AddToCart ac = new AddToCart();
        int userId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            userId = Convert.ToInt32(Session["UserId"]);
            var user = db.AspNetUsers.Find(userId);
            tbFullName.Text = user.First_Name + user.Last_Name;
            tbPhone.Text = user.Phone;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ac.CartListDetails.Count > 0)
            {
                decimal amount = 0;
                Sale sale = new Sale();
                sale.UserId = Convert.ToInt32(Session["UserId"]);
                sale.Address = tbAddress.Text;
                sale.CardNumber = tbCardNumber.Text;
                sale.City = tbCity.Text;
                sale.State = tbState.Text;
                sale.Country = tbCountry.Text;
                sale.ExpiryDate = Convert.ToDateTime(tbExpDate.Text);
                sale.FullName = tbFullName.Text;
                sale.NameOnCard = tbNameOnCard.Text;
                sale.Phone = tbPhone.Text;
                sale.Zip = tbZip.Text;
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
                Response.Redirect("OrderPreview.aspx?id=" + savedSale.Id);
            }
        }
    }
}