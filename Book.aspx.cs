using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Dining
{
    public partial class Book : System.Web.UI.Page
    {
        // Hardcoded connection string (for testing/local use)
        private string connStr = @"Server=LAPTOP-1IGN0H5C\SQLEXPRESS;Database=Dining;Trusted_Connection=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rest = Request.QueryString["restaurant"];
                txtRestaurant.Text = !string.IsNullOrEmpty(rest) ? rest : "No restaurant selected";
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            // Basic validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtGuests.Text) ||
                string.IsNullOrWhiteSpace(txtDate.Text) ||
                string.IsNullOrWhiteSpace(txtTime.Text))
            {
                lblMsg.Text = "Please fill all fields!";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string query = @"INSERT INTO Bookings 
                                     (RestaurantName, CustomerName, NoOfPeople, BookingDate, BookingTime)
                                     VALUES (@RestaurantName, @CustomerName, @NoOfPeople, @BookingDate, @BookingTime)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@RestaurantName", txtRestaurant.Text.Trim());
                        cmd.Parameters.AddWithValue("@CustomerName", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@NoOfPeople", Convert.ToInt32(txtGuests.Text.Trim()));
                        cmd.Parameters.AddWithValue("@BookingDate", Convert.ToDateTime(txtDate.Text));
                        cmd.Parameters.AddWithValue("@BookingTime", TimeSpan.Parse(txtTime.Text));
                        

                        cmd.ExecuteNonQuery();
                    }
                }

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Booking confirmed successfully!";

                // Clear form
                txtName.Text = "";
                txtPhone.Text = "";
                txtGuests.Text = "";
                txtDate.Text = "";
                txtTime.Text = "";
            }
            catch (Exception ex)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}
