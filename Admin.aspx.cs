using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Dining
{
    public partial class Admin : System.Web.UI.Page
    {
        // ✅ Update with your SQL Server name and DB
        private string connStr = @"Server=LAPTOP-1IGN0H5C\SQLEXPRESS;Database=Dining;Trusted_Connection=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string restaurant = ddlRestaurant.SelectedValue.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(restaurant) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "⚠️ Please select a restaurant and enter password!";
                return;
            }

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM AdminLogin WHERE RestaurantName=@restaurant AND Password=@password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@restaurant", restaurant);
                    cmd.Parameters.AddWithValue("@password", password);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        Session["RestaurantName"] = restaurant;
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "❌ Invalid Restaurant Name or Password!";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                }
            }
        }
    }
}
