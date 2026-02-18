<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Buffet.aspx.cs" Inherits="Dining.Buffet" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>D&M | Dine & Meet</title>
    
    <style>
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

   body {
    font-family: "Poppins", sans-serif;
    background-color: #fff;
   
}

    /* 🌐 Navbar Styling */
    .navbar {
    background-color: #fff !important;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    position: fixed!important;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
}

    .navbar-nav .nav-link {
        font-weight: 500;
        color: #333;
        transition: color 0.3s ease;
    }

    .navbar-nav .nav-link:hover {
        color: #d9534f;
    }

    .navbar .form-control {
        width: 250px;
        border-radius: 20px;
    }

    /* 🖼 Hero Banner */
    .hero-banner img {
        width: 100%;
        height: auto;
        border-bottom: 3px solid #d9534f;
    }

    /* 🍽 Dining Section */
.dining-list {
    padding: 50px; /* increased from 40px */
    background-color: #fafafa;
}

.dining-list h1 {
    color: #d9534f;
    margin-bottom: 25px; /* slightly more spacing */
    font-weight: 600;
}

.dining-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* exactly 3 items per row */
    gap: 30px; /* increased gap for larger images */
    justify-items: center;
}

.dining-item {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
    padding-bottom: 20px; /* more padding */
    width: 100%;
    max-width: 350px; /* increased from 280px */
}

.dining-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

.dining-item img {
    width: 100%;
    height: 250px; /* increased from 200px */
    object-fit: cover;
    border-bottom: 2px solid #eee;
}

.dining-item h3 {
    font-size: 20px; /* slightly larger */
    margin: 12px 0 6px;
    color: #333;
    font-weight: 600;
}

.dining-item h6 {
    font-size: 15px; /* slightly larger */
    color: #777;
    margin-bottom: 4px;
}


    /* 🧾 Book Table Button */
    .book-btn {
        display: inline-block;
        background-color: #d9534f;
        color: #fff;
        padding: 8px 18px;
        border-radius: 20px;
        text-decoration: none;
        margin-top: 10px;
        font-weight: 500;
        transition: background-color 0.3s ease;
    }

    .book-btn:hover {
        background-color: #c9302c;
        color: #fff;
    }

    /* 📱 Responsive */
    @media (max-width: 768px) {
        .navbar .form-control {
            width: 180px;
        }

        .dining-item img {
            height: 180px;
        }

        .dining-list {
            padding: 20px;
        }
    }
      .footer {
  background: #222;
  color: #ccc;
  text-align: center;
  padding: 15px 10px;
  font-size: 14px;
  width: 100%;
  margin-top: 40px; /* adds spacing above */
  position: relative; /* ✅ not fixed anymore */
  left: 0;
  right: 0;
}

.footer a {
  color: #d9534f;
  text-decoration: none;
  margin: 0 5px;
}

.footer a:hover {
  text-decoration: underline;
}

/* 🔵 Circular logo styling */
.logo-circle {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid #d9534f; /* red border for accent */
  background-color: white;
}

.logo-circle img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* ✨ Navbar enhancement */
.navbar {
  background-color: #ffffff !important;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.navbar-brand {
  font-size: 1.3rem;
  color: #d9534f !important;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.brand-name {
  color: #d9534f;
}

.navbar-nav .nav-link {
  color: #555 !important;
  font-weight: 500;
  margin: 0 8px;
  transition: color 0.3s ease, transform 0.2s ease;
}

.navbar-nav .nav-link:hover,
.navbar-nav .nav-link.active {
  color: #d9534f !important;
  transform: translateY(-2px);
}

.navbar-toggler {
  border-color: #d9534f;
}

/* 🔍 Search box styling */
#searchBox {
  border-radius: 25px;
  padding-left: 15px;
}

.btn-outline-danger {
  border-radius: 25px;
  font-weight: 500;
}

/* 📱 Responsive brand adjustments */
@media (max-width: 768px) {
  .brand-name {
    font-size: 1.1rem;
  }
}


</style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
    <form id="form1" runat="server">
        <!-- 🧭 HEADER / NAVBAR -->
         <header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm px-4 py-2">
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
      <ul class="navbar-nav ms-auto align-items-center">
        <li class="nav-item"><a class="nav-link active" href="Home.aspx">All</a></li>
        <li class="nav-item"><a class="nav-link" href="Family.aspx">Family Dining</a></li>
        <li class="nav-item"><a class="nav-link" href="Cozy.aspx">Cozy Cafes</a></li>
        <li class="nav-item"><a class="nav-link" href="Drink.aspx">Drink & Dine</a></li>
        <li class="nav-item"><a class="nav-link" href="Buffet.aspx">Buffet</a></li>
        <li class="nav-item"><a class="nav-link" href="Party.aspx">Party Vibes</a></li>
        <li class="nav-item"><a class="nav-link" href="Admin.aspx">Admin Login</a></li>  
      </ul>

      <!-- 🔍 Search box -->
      <form class="d-flex ms-3">
        <input id="searchBox" class="form-control me-2" type="search" placeholder="Search entire site" aria-label="Search">
        <button class="btn btn-outline-danger" type="submit">Search</button>
      </form>
    </div>
  </nav>
</header>
         <<div class="hero-banner">
            <img src="Images\Rst.jpg" alt="Dining Banner" style="width:100%;">
            
        </div>

<!-- 🍽 MAIN CONTENT -->
<main class="dining-list">
    <center><h1><i>Buffet</i></h1></center>

    <div class="dining-container"> <!-- ✅ Wrap all items here -->
        <div class="dining-item">
            <img src="Images/d9.jpg" alt="Quattro">
            <h3>Quattro - The Leela Bhartiya City Bangalore</h3>
            <h6>North Indian</h6>
            <h6>The Leela Bhartiya City, Bangalore</h6>
            <a href="#" class="book-btn" onclick="bookNow('Quattro', '74525')">Book Table</a>
        </div>

        <div class="dining-item">
            <img src="Images/d10.jpg" alt="F5 - Hilton Embassy">
            <h3>F5 - Hilton Embassy Manyata Business Park</h3>
            <h6>North Indian</h6>
            <h6>Kalyan Nagar, Bangalore</h6>
            <a href="#" class="book-btn" onclick="bookNow('F5 Hilton Embassy', '39500')">Book Table</a>
        </div>

        <div class="dining-item">
            <img src="Images/d11.jpg" alt="Feast - Sheraton Grand">
            <h3>Feast - Sheraton Grand</h3>
            <h6>North Indian</h6>
            <h6>Feast - Sheraton Grand, Bangalore</h6>
            <a href="#" class="book-btn" onclick="bookNow('Feast Sheraton Grand', '30060')">Book Table</a>
        </div>
    </div>
</main>

    </form>
    <footer class="footer">
  <div class="footer-content">
    <p>© 2025 Dine & Meet | Designed by D&M</p>
    <p>
      <a href="#">About</a> · 
      <a href="#">Contact</a> · 
      <a href="#">Privacy Policy</a>
    </p>
  </div>
</footer>
   
    <!-- 🧠 JavaScript for filtering and search -->
    <script>
        function bookNow(restaurantName) {
            window.location.href = "Book.aspx?restaurant=" + encodeURIComponent(restaurantName);
        }

        const searchBox = document.getElementById('searchBox');
        const categoryLinks = document.querySelectorAll('.category-link');
        const diningItems = document.querySelectorAll('.dining-item');

        categoryLinks.forEach(link => {
            link.addEventListener('click', e => {
                e.preventDefault();
                const category = e.target.textContent.trim().toLowerCase();
                searchBox.value = category;
                diningItems.forEach(item => {
                    const text = item.textContent.toLowerCase();
                    item.style.display = (category === 'all' || text.includes(category)) ? 'block' : 'none';
                });
            });
        });

        searchBox.addEventListener('keyup', () => {
            const query = searchBox.value.toLowerCase();
            diningItems.forEach(item => {
                const text = item.textContent.toLowerCase();
                item.style.display = text.includes(query) ? 'block' : 'none';
            });
        });
    </script>
</body>

</html>
