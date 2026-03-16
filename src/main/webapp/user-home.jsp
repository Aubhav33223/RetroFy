<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>PHONEIFY - Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    
    <style>
        :root {
            --spotify-green: #1ed760;
        }
        
        body {
            background-color: #121212;
            color: #fff;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        /* Navbar will inherit dark theme from user-navbar.jsp (if not, add bg-dark there) */

        /* HERO CAROUSEL - Spotify style */
        #heroCarousel {
            height: 520px;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
        }
        
        .carousel-item img {
            height: 520px;
            object-fit: cover;
        }
        
        .carousel-caption {
            background: linear-gradient(transparent, rgba(0,0,0,0.85));
            bottom: 0;
            padding-bottom: 50px;
            text-align: left;
            left: 8%;
            right: 8%;
        }
        
        .carousel-caption h5 {
            font-size: 2.8rem;
            font-weight: 700;
            text-shadow: 0 2px 10px rgba(0,0,0,0.7);
        }

        /* SERVICES SECTION - Spotify Cards */
        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 30px;
            padding-left: 10px;
        }
        
        .services-container {
            display: flex;
            gap: 24px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .service-card {
            background: #181818;
            border-radius: 12px;
            width: 280px;
            overflow: hidden;
            transition: all 0.3s ease;
            text-decoration: none;
            color: white;
        }
        
        .service-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 20px 30px rgba(30, 215, 96, 0.25);
            background: #1f1f1f;
        }
        
        .service-card img {
            height: 280px;
            width: 100%;
            object-fit: cover;
        }
        
        .service-card-body {
            padding: 20px;
            text-align: center;
        }
        
        .service-card h4 {
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 8px;
        }
        
        .service-card p {
            color: #b3b3b3;
            font-size: 0.95rem;
        }
        
        /* Button inside card */
        .service-btn {
            background: var(--spotify-green);
            color: black;
            font-weight: 700;
            border: none;
            border-radius: 50px;
            padding: 10px 30px;
            margin-top: 15px;
            transition: all 0.3s;
        }
        
        .service-btn:hover {
            background: #1fdf64;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<jsp:include page="user-navbar.jsp"></jsp:include>

<div class="container mt-4">
    <!-- HERO CAROUSEL -->
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=1200" class="d-block w-100" alt="Sell Phone">
                <div class="carousel-caption">
                    <h5>Sell Your Phone in 60 Seconds</h5>
                    <p>Get instant cash at best price • Free pickup</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1592899677977-7c10d0aede3a?w=1200" class="d-block w-100" alt="Buy Phone">
                <div class="carousel-caption">
                    <h5>Premium Refurbished Phones</h5>
                    <p>Like new • 1 Year Warranty • Starting ₹4,999</p>
                </div>
            </div>
        </div>
        
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- SERVICES SECTION -->
    <div class="mt-5">
        <h2 class="section-title text-white">Our Services</h2>
        
        <div class="services-container">
            <!-- Sell Card -->
            <a href="sell-phone.jsp" class="service-card">
                <img src="https://s3n.cashify.in/cashify/store/product//122d9596dd4a4034a9192e5e8ba30c4f-box.jpg" alt="Sell Phone">
                <div class="service-card-body">
                    <h4>SELL PHONE</h4>
                    <p>Instant cash offer in 30 seconds</p>
                    <button class="service-btn">Sell Now →</button>
                </div>
            </a>

            <!-- Buy Card -->
            <a href="buy-phone.jsp" class="service-card">
                <img src="https://s3n.cashify.in/cashify/store/product//122d9596dd4a4034a9192e5e8ba30c4f-box.jpg" alt="Buy Phone">
                <div class="service-card-body">
                    <h4>BUY PHONE</h4>
                    <p>Best refurbished phones with warranty</p>
                    <button class="service-btn">Shop Now →</button>
                </div>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>