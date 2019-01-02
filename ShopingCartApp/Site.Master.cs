using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ac = new AddToCart();
            var count = 0;
            count = ac.CartListDetails.Count;
            aCart.InnerText ="Your Cart ("+ count + " items in cart.)";
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["UserId"] = null;
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}