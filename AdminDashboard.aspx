<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Dining.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Admin Dashboard</h2>

            <!-- Restaurant Name -->
            <asp:Label ID="lblRestaurant" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="DarkBlue"></asp:Label>
            <hr />

            <!-- Bookings Grid -->
            <asp:GridView 
                ID="gvBookings" 
                runat="server" 
                AutoGenerateColumns="true"
                CssClass="table table-bordered table-striped text-center"
                EmptyDataText="No bookings found for this restaurant.">
            </asp:GridView>

            <!-- Logout Button -->
            <div class="text-center mt-4">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click" />
            </div>
        </div>
    </form>
</body>
</html>
