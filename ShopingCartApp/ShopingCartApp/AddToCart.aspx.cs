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
    public partial class AddToCart : System.Web.UI.Page
    {
        int _itemId=0;

    

        ShoppingCartEntities db = new ShoppingCartEntities();
        

        public List<SaleDetail> CartListDetails
        {
            get
            {
                if (Session["CartList"] != null)
                {
                    return (List<SaleDetail>)Session["CartList"];
                }
                else
                {
                    Session["CartList"] = new List<SaleDetail>();
                    return (List<SaleDetail>)Session["CartList"];
                }
            }
            set
            {
                Session["CartList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _itemId = Convert.ToInt32(Request.QueryString["Product_Id"]);
            if (_itemId != 0)
            {
                var product = db.Products1.Find(_itemId);
                if (product != null)
                {
                    ProductName.Text = product.Product_Name;
                    ProductDescription.Text = product.Product_Description;
                    tbPrice.Text = product.Product_Price.ToString(CultureInfo.InvariantCulture);
                    Image1.ImageUrl = product.Product_Image_Path;
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var existingCart = CartListDetails.FirstOrDefault(p => p.ProductId == _itemId);
            if (existingCart == null)
            {
                var saleDet = new SaleDetail
                {
                    ProductId = _itemId,
                    Quantity = Convert.ToInt32(spQty.Text)
                };
                CartListDetails.Add(saleDet);
            }
            else
            {
                existingCart.ProductId = _itemId;
                existingCart.Quantity = existingCart.Quantity + Convert.ToInt32(spQty.Text);
            }
            Response.Redirect("~/ProductList.aspx");
        }
    }
}