<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="Dining.Book" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Table - Dining District</title>

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
        /* 🌐 Navbar Styling */
.navbar {
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    display: flex;
    align-items: center;
    padding: 10px 20px;
}

.navbar-brand {
    font-size: 1.3rem;
    color: #d9534f;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.logo-circle {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid #d9534f;
    background-color: white;
}

.logo-circle img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.navbar-nav .nav-link {
    color: #555;
    font-weight: 500;
    margin: 0 8px;
    transition: color 0.3s ease, transform 0.2s ease;
}

.navbar-nav .nav-link:hover,
.navbar-nav .nav-link.active {
    color: #d9534f;
    transform: translateY(-2px);
}

.navbar-toggler {
    border-color: #d9534f;
}

/* 🔍 Search box styling (optional) */
#searchBox {
    border-radius: 25px;
    padding-left: 15px;
}

.btn-outline-danger {
    border-radius: 25px;
    font-weight: 500;
}

/* 📱 Responsive adjustments */
@media (max-width: 768px) {
    .brand-name {
        font-size: 1.1rem;
    }

    #searchBox {
        width: 150px;
    }
}

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fafafa;
        }

        .booking-container {
            max-width: 500px;
            background: #fff;
            padding: 25px;
            margin: 60px auto;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .booking-container h3 {
            color: #d9534f;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .form-row label {
            width: 140px;
            font-weight: 500;
            color: #333;
        }

        .form-row input {
            flex: 1;
        }

        .error {
            color: red;
            font-size: 13px;
            margin-left: 140px;
            margin-top: -5px;
            margin-bottom: 8px;
            display: block;
        }

        .btn-custom {
            background-color: #d9534f;
            color: #fff;
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }

        .btn-custom:hover {
            background-color: #c9302c;
        }

        footer {
            background-color: #222;
            color: #ccc;
            padding: 8px 0;
            text-align: center;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light px-4">
        
         <a class="navbar-brand d-flex align-items-center" href="#">
      <div class="logo-circle">
        <img src="Images\D&M Logo.jpg" alt="D&M Logo">
      </div>
      <span class="brand-name ms-2 fw-bold">D&M | Dine & Meet</span>
    </a>


        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link category-link" href="Home.aspx">All</a></li>
                <li class="nav-item"><a class="nav-link category-link" href="Family.aspx">Family Dining</a></li>
                <li class="nav-item"><a class="nav-link category-link" href="Cozy.aspx">Cozy Cafes</a></li>
                <li class="nav-item"><a class="nav-link category-link" href="Drink.aspx">Drink & Dine</a></li>
                <li class="nav-item"><a class="nav-link category-link" href="Buffet.aspx">Buffet</a></li>
                <li class="nav-item"><a class="nav-link category-link" href="Party.aspx">Party Vibes</a></li>
            </ul>

            <!-- 🔍 Search box aligned -->
            <div class="d-flex ms-3" style="width: 250px;">
                <input id="searchBox" class="form-control" type="search" placeholder="Search entire site" aria-label="Search">
                <button class="btn btn-outline-danger" type="submit">Search</button>
            </div>
        </div>
    </nav>
</header> 

    <br>

    <br>
    <br>
    <div class="booking-container">
        <h3>Book Your Table</h3>

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

        

        <div class="form-row">
            <label>Name:</label>
            <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Enter Name" runat="server"></asp:TextBox>
        </div>
        <span id="nameError" class="error"></span>

        <div class="form-row">
            <label>Phone:</label>
            <asp:TextBox ID="txtPhone" CssClass="form-control" Placeholder="Enter Phone" runat="server"></asp:TextBox>
        </div>
        <span id="phoneError" class="error"></span>
       
    <div style="display:flex; align-items:center; gap:10px; margin-bottom:15px;">
    <label style="width:120px; font-weight:500;">Restaurant:</label>
    <asp:TextBox 
        ID="txtRestaurant" 
        runat="server" 
        ReadOnly="true"
        Style="flex:1; background-color:#fff3cd; border:1px solid #ffc107; 
               font-weight:600; color:#333; padding:6px 10px; 
               border-radius:5px; box-shadow:0 0 3px #ffd966;">
    </asp:TextBox>
</div>


        <div class="form-row">
            <label>Guests:</label>
            <asp:TextBox ID="txtGuests" CssClass="form-control" TextMode="Number" Placeholder="e.g. 2" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Date:</label>
            <asp:TextBox ID="txtDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
    <label>Time (7 AM – 12 PM):</label>
    <div style="display:flex; align-items:center; gap:6px; flex:1;">
        <asp:TextBox ID="txtTime" CssClass="form-control" TextMode="Time" runat="server"></asp:TextBox>
        <span id="ampmLabel" style="font-weight:500; color:#555;">AM</span>
    </div>
</div>
<span id="timeError" class="error"></span>


        <asp:Button ID="btnBook" CssClass="btn-custom mt-2" Text="Confirm Booking"
            runat="server" OnClick="btnBook_Click" OnClientClick="return validateForm();" />
    </div>

    <footer>
        © 2025 Dining District | Designed by Daphiny and Madiha
    </footer>
</form>

<script>
    // ✅ Validation Script
    function validateForm() {
        let valid = true;
        const name = document.getElementById("<%= txtName.ClientID %>").value.trim();
        const phone = document.getElementById("<%= txtPhone.ClientID %>").value.trim();
        const time = document.getElementById("<%= txtTime.ClientID %>").value;

        document.getElementById("nameError").textContent = "";
        document.getElementById("phoneError").textContent = "";
        document.getElementById("timeError").textContent = "";

        if (!/^[A-Za-z ]+$/.test(name)) {
            document.getElementById("nameError").textContent = "Only letters allowed.";
            valid = false;
        }

        if (!/^[0-9]{10}$/.test(phone)) {
            document.getElementById("phoneError").textContent = "Enter valid 10-digit phone number.";
            valid = false;
        }

        return valid;
    }

    // ✅ Auto-fill restaurant name from query string
    window.onload = function () {
        const params = new URLSearchParams(window.location.search);
        const rest = params.get("restaurant");
        const txt = document.getElementById("<%= txtRestaurant.ClientID %>");
        txt.value = rest ? decodeURIComponent(rest) : "No restaurant selected";
    };
    // Update AM/PM label dynamically
    document.getElementById("<%= txtTime.ClientID %>").addEventListener("input", function () {
        const val = this.value;
        if (val) {
            const [h] = val.split(":").map(Number);
            document.getElementById("ampmLabel").textContent = (h >= 12) ? "PM" : "AM";
        } else {
            document.getElementById("ampmLabel").textContent = "AM";
        }
    });

</script>
</body>
</html>