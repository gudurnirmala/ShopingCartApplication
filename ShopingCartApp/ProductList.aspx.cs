using ShopingCartApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class ProductList : System.Web.UI.Page
    {
        
        ShoppingCartEntities db = new ShoppingCartEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var result = db.Products1.ToList();
                var result1 = new List<string>();

                CardView.DataSource = result;
                CardView.DataBind();
             //   DataList1.DataSource = result;
              //  DataList1.DataBind();
            }
        }
        protected void CustomersGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
        {

            //// If multiple ButtonField column fields are used, use the
            //// CommandName property to determine which button was clicked.
            //if (e.CommandName == "Select")
            //{
            //    // Convert the row index stored in the CommandArgument
            //    // property to an Integer.
            //    int index = Convert.ToInt32(e.CommandArgument);

            //    // Get the last name of the selected author from the appropriate
            //    // cell in the GridView control.
            //    GridViewRow selectedRow = CardView.Rows[index];
            //    int ItemId = Convert.ToInt32(selectedRow.Cells[0].Text);
            //    Response.Redirect("AddToCart.aspx?id=" + ItemId);
            //}
        }
        protected void CustomersDataList_RowCommand(Object sender, DataListCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                //DataList1.SelectedIndex = e.Item.ItemIndex;
                //int ItemId = Convert.ToInt32(((Label)DataList1.SelectedItem.FindControl("ProductId")).Text);
                //Response.Redirect("AddToCart.aspx?id=" + ItemId);
            }
        }

        protected void OnLoad(object sender, EventArgs e)
        {
       
        }
    }
}