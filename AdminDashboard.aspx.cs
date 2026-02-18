using System;
using System.Data;
using System.Data.SqlClient;

namespace Dining
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        // ✅ Make sure this matches your SQL Server setup
        private string connStr = @"Server=LAPTOP-1IGN0H5C\SQLEXPRESS;Database=Dining;Trusted_Connection=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["RestaurantName"] == null)
                {
                    Response.Redirect("Admin.aspx"); // Not logged in → back to login page
                }
                else
                {
                    lblRestaurant.Text = "Welcome, " + Session["RestaurantName"].ToString();
                    BindBookings();
                }
            }
        }

        private void BindBookings()
        {
            try
            {
                string restaurant = Session["RestaurantName"].ToString();

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // ✅ Make sure your table name and column names are correct
                    string query = "SELECT * FROM Bookings WHERE RestaurantName = @Restaurant";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Restaurant", restaurant);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvBookings.DataSource = dt;
                    gvBookings.DataBind();

                    if (dt.Rows.Count == 0)
                    {
                        lblRestaurant.Text += "<br/><span style='color:red;'>No bookings found.</span>";
                    }
                }
            }
            catch (Exception ex)
            {
                lblRestaurant.Text = "Error loading bookings: " + ex.Message;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Admin.aspx");
        }
    }
}
