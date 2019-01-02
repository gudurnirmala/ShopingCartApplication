using ShopingCartApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class orderConfirmation : System.Web.UI.Page
    {
        ShoppingCartEntities _db = new ShoppingCartEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}