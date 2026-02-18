<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Dining.Admin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Login - Dining District</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
   <style>
    body {
      /* use forward slashes, not backslashes */
      background-image: url('Images/bg6.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed; /* optional: makes it non-scrolling */
      margin: 0;
      min-height: 100vh; /* use min-height rather than height if you have scrolling content */
      background-color: #222; /* fallback color while image loads or if it's missing */
    }
  </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container mt-5">
            <h1 class="text-center mb-4">Admin Login</h1>


            <asp:Label ID="lblMessage" runat="server" ForeColor="White" CssClass="fw-bold d-block text-center mb-3"></asp:Label>

            <asp:Panel runat="server" CssClass="card shadow p-4 mx-auto" Style="max-width:400px;">
                <!-- Restaurant DropDown -->
                <div class="mb-3">
                    <label class="form-label">Select Restaurant</label>
                    <asp:DropDownList ID="ddlRestaurant" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select Restaurant --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Bombay Brasserie" Value="Bombay Brasserie"></asp:ListItem>
                        <asp:ListItem Text="Absolute Barbecues" Value="Absolute Barbecues"></asp:ListItem>
                        <asp:ListItem Text="The Great Indian Diner" Value="The Great Indian Diner"></asp:ListItem>
                        <asp:ListItem Text="Theo Cafe" Value="Theo Cafe"></asp:ListItem>
                        <asp:ListItem Text="Dolci" Value="Dolci"></asp:ListItem>
                        <asp:ListItem Text="The Brown Table" Value="The Brown Table"></asp:ListItem>
                        <asp:ListItem Text="Over Coffee Cafe and Wine" Value="Over Coffee Cafe and Wine"></asp:ListItem>
                        <asp:ListItem Text="The Peak" Value="The Peak"></asp:ListItem>
                        <asp:ListItem Text="Parka Resto Bar" Value="Parka Resto Bar"></asp:ListItem>
                        <asp:ListItem Text="Quattro - The Leela Bhartiya City Bangalore" Value="Quattro - The Leela Bhartiya City Bangalore"></asp:ListItem>
                        
                    </asp:DropDownList>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                        CssClass="form-control" Placeholder="Enter Password"></asp:TextBox>
                </div>

                <!-- Login Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Login"
                    CssClass="btn btn-danger w-100" OnClick="btnLogin_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
