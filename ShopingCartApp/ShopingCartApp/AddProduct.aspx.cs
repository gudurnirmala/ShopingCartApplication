using System;
using ShopingCartApp.Model;
namespace ShopingCartApp
{
    public partial class AddProduct : System.Web.UI.Page
    {
        ShoppingCartEntities _db = new ShoppingCartEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            var product = new Products();
            product.Product_Description = tbProductDesc.Text;
            product.Product_Price = Convert.ToDecimal(tbPrice.Text);
            product.Product_Name = tbItemName.Text;
            if (FileUpload.HasFile)
            {
                var str = FileUpload.FileName;
                FileUpload.PostedFile.SaveAs(Server.MapPath("~/ItemImages/" + str));
                var image = "~/ItemImages/" + str;
                product.Product_Image_Path = image;
            }
            _db.Products1.Add(product);
            _db.SaveChanges();
            Response.Redirect("~/ProductList.aspx");
        }
    }
}