using System;
using System.Linq;
using ShopingCartApp.Model;
namespace ShopingCartApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Creates a new user
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                var entities = new ShoppingCartEntities();
                var userExists = (from c in entities.AspNetUsers
                    where c.Username == tbUserName.Text && c.Email == tbEmail.Text
                    select new
                    {
                        c.Id
                    }).ToList();
                if (userExists.Count == 0)
                {
                    var newUser = new AspNetUser
                    {
                        Email = tbEmail.Text,
                        First_Name = tbFirstName.Text,
                        Last_Name = tbLastName.Text,
                        PasswordHash = tbPassword.Text,
                        Username = tbUserName.Text,
                    };
                    entities.AspNetUsers.Add(newUser);
                    entities.SaveChanges();
                    errormessageP.Style.Add("color", "green");
                    ErrorMessage.Text = "Registered Successfully! Please login";
                }
                else
                {
                    ErrorMessage.Text = "User is already registered with this email. Please try log in with your account or click on forgot password!";
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                ErrorMessage.Text = exception.InnerException.Message;
            }
        }
    }
}