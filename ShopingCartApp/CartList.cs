using System.Collections.Generic;
using ShopingCartApp.Model;

namespace ShopingCartApp
{
    public class CartList
    {
        private AddToCart _addToCart;

        public CartList(AddToCart addToCart)
        {
            _addToCart = addToCart;
        }

        public List<SaleDetail> CartListDetails
        {
            get
            {
                if (_addToCart.Session["CartList"] != null)
                {
                    return (List<SaleDetail>) _addToCart.Session["CartList"];
                }
                else
                {
                    _addToCart.Session["CartList"] = new List<SaleDetail>();
                    return (List<SaleDetail>) _addToCart.Session["CartList"];
                }
            }
            set
            {
                _addToCart.Session["CartList"] = value;
            }
        }
    }
}