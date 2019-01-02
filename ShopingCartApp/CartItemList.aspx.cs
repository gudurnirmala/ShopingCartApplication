using ShopingCartApp.Model;
using System;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

namespace ShopingCartApp
{
    public partial class CartItemList : System.Web.UI.Page
    {
        #region Global Declarations

        ShoppingCartEntities _db = new ShoppingCartEntities();
        AddToCart _ac = new AddToCart();

        #endregion

        #region Private Methods
        /// <summary>
        /// Sets the total cart value and total number of items in the cart
        /// </summary>
        private void SetFooter()
        {
            cartGrid.FooterRow.Cells[2].Text = _ac.CartListDetails.Sum(p => p.Quantity).ToString();
            cartGrid.FooterRow.Cells[3].Text = _ac.CartListDetails.Sum(p => p.Price).ToString(CultureInfo.InvariantCulture);
            cartGrid.FooterRow.Visible = true;
        }

        #endregion

        #region Protected Methods
        /// <summary>
        /// Bind the data source to grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (_ac.CartListDetails.Count > 0)
                {
                    foreach (var item in _ac.CartListDetails)
                    {
                        var products = _db.Products1.Find(item.ProductId);
                        if (products != null)
                            item.ProductName = products.Product_Name;
                        var find = _db.Products1.Find(item.ProductId);
                        if (find != null)
                            item.Price = decimal.Round(find.Product_Price * item.Quantity, 2);
                    }

                    cartGrid.DataSource = _ac.CartListDetails;
                    cartGrid.DataBind();
                    cartGrid.FooterRow.Cells[0].Text = "Total";
                    cartGrid.FooterRow.Cells[2].Font.Bold = true;
                    cartGrid.FooterRow.Cells[3].Font.Bold = true;
                    SetFooter();
                }
            }
        }

        /// <summary>
        /// Calculates the total value when the qunatity is changed.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TxtQty_TextChanged(object sender, EventArgs e)
        {
            var currentRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;
            var txt = (TextBox)currentRow.FindControl("TxtQty");
            var qty = Convert.ToInt32(txt.Text);
            var txtId = (TextBox)currentRow.FindControl("TxtProductId");
            var itemId = Convert.ToInt32(txtId.Text);
            var existingCart = _ac.CartListDetails.FirstOrDefault(p => p.ProductId == itemId);
            if (existingCart != null)
            {
                existingCart.Quantity = (int)Convert.ToDecimal(qty);
                var products = _db.Products1.Find(itemId);
                if (products != null)
                    currentRow.Cells[3].Text = (products.Product_Price * existingCart.Quantity)
                        .ToString(CultureInfo.InvariantCulture);
            }
            SetFooter();
            Response.Redirect("CartItemList.aspx");

        }

        /// <summary>
        /// Redrirects to Billing and shipping Page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("BillingAndShippment.aspx");
        }

        #endregion


        protected void cartGrid_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           // var row = cartGrid.Rows[e.RowIndex];
           _ac.CartListDetails.RemoveAt(e.RowIndex);
            
            cartGrid.DataSource = _ac.CartListDetails;
            cartGrid.DataBind();
            SetFooter();
        }
    }
}