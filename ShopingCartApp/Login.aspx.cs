using ShopingCartApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class Login : System.Web.UI.Page
    {
        ShoppingCartEntities _db = new ShoppingCartEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session["UserId"] = null;

        }

        ///
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var result = _db.AspNetUsers.FirstOrDefault(p => (p.Username == tbUserName.Text ) && p.PasswordHash == tbPassword.Text);
            if (result != null)
            {
                Session["UserId"] = result.Id;
                Response.Redirect("~/ProductList.aspx");
            }
            else
            {
                Session["UserId"] = null;
                ErrorMessage.Text = "Username and Password doesn't exists!";
            }
        }
        
    }
}