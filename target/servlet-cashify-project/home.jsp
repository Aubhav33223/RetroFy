<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ====== @Aurthor Anubhav Srivastva ====== -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Retrofy - Buy & Sell Old Gadgets</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Space+Mono:wght@400;700&family=Syne:wght@400;600;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
<style>
  :root {
    --cream: #F5EFE0;
    --dark: #1A1208;
    --amber: #E8A020;
    --rust: #C0401A;
    --forest: #2A4A2E;
    --tan: #C8A96E;
    --paper: #EDE5CC;
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background-color: var(--cream);
    font-family: 'Space Mono', monospace;
    color: var(--dark);
    overflow-x: hidden;
  }

  /* ====== GRAIN OVERLAY ====== */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
    pointer-events: none;
    z-index: 9999;
    opacity: 0.6;
  }

  /* ====== NAVBAR ====== */
  .retro-nav {
    background: var(--dark);
    border-bottom: 3px solid var(--amber);
    padding: 0 2rem;
    position: sticky;
    top: 0;
    z-index: 1000;
  }

  .retro-nav .navbar-brand {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 2.4rem;
    letter-spacing: 3px;
    color: var(--amber) !important;
    text-shadow: 3px 3px 0px var(--rust);
    line-height: 1;
  }

  .retro-nav .navbar-brand span {
    color: var(--cream);
  }

  .nav-tagline {
    font-family: 'Space Mono', monospace;
    font-size: 0.55rem;
    color: var(--tan);
    letter-spacing: 4px;
    text-transform: uppercase;
    display: block;
    margin-top: -6px;
  }

  .retro-nav .nav-link {
    color: var(--cream) !important;
    font-family: 'Space Mono', monospace;
    font-size: 0.72rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    padding: 1.2rem 1rem !important;
    position: relative;
    transition: color 0.2s;
  }

  .retro-nav .nav-link:hover { color: var(--amber) !important; }

  .retro-nav .nav-link::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 3px;
    background: var(--amber);
    transition: width 0.3s;
  }

  .retro-nav .nav-link:hover::after { width: 100%; }

  .nav-search {
    background: transparent;
    border: 1px solid var(--tan);
    color: var(--cream);
    font-family: 'Space Mono', monospace;
    font-size: 0.72rem;
    padding: 0.4rem 1rem;
    width: 220px;
    outline: none;
    transition: border-color 0.2s;
  }

  .nav-search::placeholder { color: #7a6a4a; }
  .nav-search:focus { border-color: var(--amber); }

  .btn-login {
    background: var(--amber);
    color: var(--dark);
    border: none;
    font-family: 'Bebas Neue', sans-serif;
    letter-spacing: 2px;
    font-size: 1rem;
    padding: 0.35rem 1.2rem;
    transition: background 0.2s, transform 0.1s;
  }

  .btn-login:hover {
    background: var(--rust);
    color: var(--cream);
    transform: translateY(-1px);
  }

  /* ====== TICKER TAPE ====== */
  .ticker-wrap {
    background: var(--amber);
    overflow: hidden;
    white-space: nowrap;
    padding: 6px 0;
    border-bottom: 2px solid var(--rust);
  }

  .ticker-inner {
    display: inline-block;
    animation: ticker 25s linear infinite;
    font-family: 'Space Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 2px;
    color: var(--dark);
    font-weight: 700;
  }

  @keyframes ticker {
    0% { transform: translateX(100vw); }
    100% { transform: translateX(-100%); }
  }

  .ticker-inner span { margin: 0 3rem; }
  .ticker-inner .dot { color: var(--rust); }

  /* ====== HERO CAROUSEL ====== */
  .hero-section {
    padding: 2rem 2rem 0;
  }

  .carousel-inner img {
    height: 420px;
    object-fit: cover;
    filter: sepia(20%) contrast(1.05);
    border: 3px solid var(--dark);
  }

  .carousel-caption {
    background: rgba(26,18,8,0.82);
    padding: 1rem 1.5rem;
    bottom: 1.5rem;
    left: 10%;
    right: auto;
    text-align: left;
    border-left: 4px solid var(--amber);
  }

  .carousel-caption h5 {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 1.8rem;
    letter-spacing: 3px;
    color: var(--amber);
    margin-bottom: 0.2rem;
  }

  .carousel-caption p {
    font-size: 0.7rem;
    color: var(--cream);
    letter-spacing: 1px;
    margin: 0;
  }

  .carousel-control-prev-icon,
  .carousel-control-next-icon {
    background-color: var(--amber);
    border-radius: 0;
    padding: 18px;
    background-size: 60%;
  }

  .carousel-indicators [data-bs-slide-to] {
    background-color: var(--tan);
    width: 30px;
    height: 3px;
  }

  .carousel-indicators .active { background-color: var(--amber); }

  /* ====== SECTION TITLES ====== */
  .section-title {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 2.2rem;
    letter-spacing: 5px;
    color: var(--dark);
    position: relative;
    display: inline-block;
    margin-bottom: 1.5rem;
  }

  .section-title::after {
    content: '';
    position: absolute;
    bottom: -4px;
    left: 0;
    width: 100%;
    height: 3px;
    background: var(--amber);
  }

  .section-title .title-num {
    font-size: 0.7rem;
    color: var(--rust);
    font-family: 'Space Mono', monospace;
    letter-spacing: 3px;
    display: block;
    margin-bottom: -8px;
  }

  /* ====== OUR SERVICES ====== */
  .services-section {
    padding: 3rem 2rem;
    background: var(--paper);
    border-top: 3px solid var(--dark);
    border-bottom: 3px solid var(--dark);
  }

  .service-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.6rem;
    cursor: pointer;
    transition: transform 0.25s;
    text-decoration: none;
    color: var(--dark);
  }

  .service-card:hover { transform: translateY(-6px); color: var(--dark); }

  .service-icon-wrap {
    width: 72px;
    height: 72px;
    border: 2px solid var(--dark);
    background: var(--cream);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    transition: background 0.2s, border-color 0.2s;
  }

  .service-card:hover .service-icon-wrap {
    background: var(--amber);
    border-color: var(--rust);
  }

  .service-icon-wrap::before {
    content: '';
    position: absolute;
    inset: 3px;
    border: 1px dashed var(--tan);
    pointer-events: none;
  }

  .service-icon-wrap img {
    width: 40px;
    height: 40px;
    object-fit: contain;
    filter: grayscale(30%);
  }

  .service-label {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-align: center;
    color: var(--dark);
    line-height: 1.4;
  }

  /* ====== SELL YOUR DEVICE ====== */
  .sell-section {
    padding: 3rem 2rem;
  }

  .sell-card {
    border: 2px solid var(--dark);
    background: var(--dark);
    padding: 2rem;
    position: relative;
    overflow: hidden;
  }

  .sell-card::before {
    content: 'SELL';
    position: absolute;
    top: -10px;
    right: -10px;
    font-family: 'Bebas Neue', sans-serif;
    font-size: 8rem;
    color: rgba(255,255,255,0.04);
    pointer-events: none;
    line-height: 1;
  }

  .sell-title {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 2rem;
    letter-spacing: 4px;
    color: var(--amber);
    margin-bottom: 1.2rem;
  }

  .sell-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    text-decoration: none;
    transition: transform 0.2s;
  }

  .sell-item:hover { transform: scale(1.06); }

  .sell-icon-box {
    width: 80px;
    height: 80px;
    border: 2px solid var(--tan);
    background: rgba(255,255,255,0.05);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: border-color 0.2s, background 0.2s;
  }

  .sell-item:hover .sell-icon-box {
    border-color: var(--amber);
    background: rgba(232,160,32,0.12);
  }

  .sell-icon-box img {
    width: 48px;
    height: 48px;
    object-fit: contain;
    filter: brightness(0.9) sepia(10%);
  }

  .sell-label {
    font-family: 'Space Mono', monospace;
    font-size: 0.58rem;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--tan);
    text-align: center;
  }

  /* ====== REFURBISHED PRODUCTS ====== */
  .refurb-section {
    padding: 2rem 2rem 3rem;
    background: var(--paper);
    border-top: 3px solid var(--dark);
    border-bottom: 3px solid var(--dark);
  }

  .product-card {
    border: 2px solid var(--dark);
    background: var(--cream);
    position: relative;
    overflow: hidden;
    transition: transform 0.25s, box-shadow 0.25s;
    cursor: pointer;
  }

  .product-card:hover {
    transform: translateY(-4px);
    box-shadow: 6px 6px 0px var(--dark);
  }

  .product-badge {
    position: absolute;
    top: 10px;
    left: 0;
    background: var(--rust);
    color: var(--cream);
    font-family: 'Space Mono', monospace;
    font-size: 0.55rem;
    letter-spacing: 2px;
    padding: 2px 10px;
    text-transform: uppercase;
    font-weight: 700;
  }

  .product-img-wrap {
    height: 160px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-bottom: 2px solid var(--dark);
    background: var(--paper);
    padding: 1rem;
  }

  .product-img-wrap img {
    max-height: 130px;
    max-width: 100%;
    object-fit: contain;
    filter: sepia(10%);
    transition: filter 0.2s;
  }

  .product-card:hover .product-img-wrap img { filter: sepia(0%); }

  .product-body {
    padding: 0.8rem;
  }

  .product-name {
    font-family: 'Syne', sans-serif;
    font-size: 0.78rem;
    font-weight: 600;
    color: var(--dark);
    margin-bottom: 0.3rem;
    line-height: 1.3;
  }

  .product-price {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 1.3rem;
    letter-spacing: 2px;
    color: var(--rust);
  }

  .product-old-price {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    color: #999;
    text-decoration: line-through;
    margin-left: 6px;
  }

  .product-discount {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    color: var(--forest);
    font-weight: 700;
    margin-left: 4px;
  }

  .product-condition {
    font-size: 0.6rem;
    color: var(--forest);
    letter-spacing: 1px;
    font-weight: 700;
    text-transform: uppercase;
    margin-top: 0.3rem;
  }

  .btn-view-all {
    background: transparent;
    border: 2px solid var(--dark);
    color: var(--dark);
    font-family: 'Space Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    padding: 0.5rem 1.5rem;
    transition: background 0.2s, color 0.2s;
    text-decoration: none;
    display: inline-block;
  }

  .btn-view-all:hover {
    background: var(--dark);
    color: var(--amber);
  }

  /* ====== STATS BANNER ====== */
  .stats-banner {
    background: var(--dark);
    border-top: 3px solid var(--amber);
    border-bottom: 3px solid var(--amber);
    padding: 2.5rem 2rem;
  }

  .stat-item { text-align: center; }

  .stat-num {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 3rem;
    letter-spacing: 4px;
    color: var(--amber);
    line-height: 1;
    display: block;
  }

  .stat-label {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    color: var(--tan);
    letter-spacing: 3px;
    text-transform: uppercase;
    margin-top: 4px;
  }

  .stat-divider {
    width: 1px;
    background: var(--tan);
    opacity: 0.3;
    align-self: stretch;
  }

  /* ====== TESTIMONIALS ====== */
  .testimonials-section {
    padding: 3rem 2rem;
    background: var(--cream);
  }

  .testimonial-card {
    border: 2px solid var(--dark);
    background: var(--paper);
    padding: 1.5rem;
    position: relative;
  }

  .testimonial-card::before {
    content: '\201C';
    font-family: 'Bebas Neue', sans-serif;
    font-size: 5rem;
    color: var(--amber);
    opacity: 0.4;
    position: absolute;
    top: -10px;
    left: 10px;
    line-height: 1;
    pointer-events: none;
  }

  .testimonial-text {
    font-family: 'Syne', sans-serif;
    font-size: 0.82rem;
    line-height: 1.6;
    color: var(--dark);
    margin-bottom: 1rem;
    position: relative;
    z-index: 1;
  }

  .testimonial-author {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    border-top: 1px solid var(--tan);
    padding-top: 0.8rem;
  }

  .author-avatar {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    border: 2px solid var(--amber);
    background: var(--dark);
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Bebas Neue', sans-serif;
    color: var(--amber);
    font-size: 1rem;
  }

  .author-name {
    font-family: 'Syne', sans-serif;
    font-size: 0.75rem;
    font-weight: 700;
    color: var(--dark);
  }

  .author-date {
    font-family: 'Space Mono', monospace;
    font-size: 0.55rem;
    color: #888;
    letter-spacing: 1px;
  }

  .star { color: var(--amber); font-size: 0.7rem; }

  /* ====== BRAND PARTNERS ====== */
  .brands-section {
    background: var(--dark);
    padding: 1.5rem 2rem;
    border-top: 2px solid var(--tan);
  }

  .brands-label {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    color: var(--tan);
    letter-spacing: 3px;
    text-transform: uppercase;
    white-space: nowrap;
    margin-right: 2rem;
    opacity: 0.7;
  }

  .brand-logos-wrap {
    display: flex;
    align-items: center;
    gap: 2.5rem;
    flex-wrap: wrap;
    opacity: 0.5;
    filter: brightness(0) invert(1);
  }

  .brand-logo {
    height: 22px;
    object-fit: contain;
    transition: opacity 0.2s;
  }

  .brand-logo:hover { opacity: 1; }

  /* ====== FOOTER ====== */
  .retro-footer {
    background: var(--dark);
    border-top: 3px solid var(--amber);
    padding: 3rem 2rem 1.5rem;
    color: var(--tan);
  }

  .footer-brand {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 3rem;
    letter-spacing: 4px;
    color: var(--amber);
    text-shadow: 3px 3px 0 var(--rust);
    line-height: 1;
  }

  .footer-tagline {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    letter-spacing: 4px;
    color: var(--tan);
    text-transform: uppercase;
    margin-top: 4px;
  }

  .footer-heading {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 1.1rem;
    letter-spacing: 3px;
    color: var(--amber);
    margin-bottom: 1rem;
  }

  .footer-links { list-style: none; padding: 0; }

  .footer-links li {
    margin-bottom: 0.4rem;
  }

  .footer-links a {
    font-family: 'Space Mono', monospace;
    font-size: 0.65rem;
    color: var(--tan);
    text-decoration: none;
    letter-spacing: 1px;
    transition: color 0.2s;
  }

  .footer-links a:hover { color: var(--amber); }

  .footer-bottom {
    border-top: 1px solid rgba(200,169,110,0.2);
    margin-top: 2rem;
    padding-top: 1rem;
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    color: rgba(200,169,110,0.4);
    letter-spacing: 2px;
    text-align: center;
  }

  /* ====== ANIMATIONS ====== */
  @keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .fade-up { animation: fadeInUp 0.6s ease forwards; }
  .delay-1 { animation-delay: 0.1s; }
  .delay-2 { animation-delay: 0.2s; }
  .delay-3 { animation-delay: 0.3s; }

  /* ====== RESPONSIVE ====== */
  @media (max-width: 768px) {
    .carousel-inner img { height: 220px; }
    .section-title { font-size: 1.6rem; }
    .stat-num { font-size: 2rem; }
  }
</style>
</head>
<body>

<!-- ====== NAVBAR ====== -->
<nav class="retro-nav navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand d-flex flex-column" href="#">
      RETROFY
      <span class="nav-tagline">Est. 2024 · Buy &amp; Sell Old Gadgets</span>
    </a>

    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span style="color:var(--amber); font-size:1.4rem;">&#9776;</span>
    </button>

    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav mx-auto gap-1">
        <li class="nav-item"><a class="nav-link" href="#">All</a></li>
        <li class="nav-item"><a class="nav-link" href="sell-phone.jsp">Sell Phone</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Sell Gadgets</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Buy Refurbished</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Find New Gadget</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Retrofy Store</a></li>
        <li class="nav-item"><a class="nav-link" href="#">More</a></li>
      </ul>
      <div class="d-flex align-items-center gap-2 mt-2 mt-lg-0">
        <input type="text" class="nav-search" placeholder="Search mobiles, accessories…">
        <a href="login.jsp"><button class="btn-login">Login</button></a>
      </div>
    </div>
  </div>
</nav>

<!-- ====== TICKER ====== -->
<div class="ticker-wrap">
  <div class="ticker-inner">
    <span>★ SELL YOUR OLD PHONE IN 60 SECONDS</span>
    <span class="dot">◆</span>
    <span>FREE DOORSTEP PICKUP</span>
    <span class="dot">◆</span>
    <span>INSTANT CASH PAYMENT</span>
    <span class="dot">◆</span>
    <span>CERTIFIED REFURBISHED DEVICES</span>
    <span class="dot">◆</span>
    <span>6-MONTH WARRANTY ON ALL PRODUCTS</span>
    <span class="dot">◆</span>
    <span>TRUSTED BY 50 LAC+ USERS SINCE 2024</span>
    <span class="dot">◆</span>
    <span>★ SELL YOUR OLD PHONE IN 60 SECONDS</span>
    <span class="dot">◆</span>
    <span>FREE DOORSTEP PICKUP</span>
    <span class="dot">◆</span>
    <span>INSTANT CASH PAYMENT</span>
  </div>
</div>

<!-- ====== HERO CAROUSEL ====== -->
<div class="hero-section">
  <div id="retroCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#retroCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#retroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#retroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://i.ytimg.com/vi/Ti9HmxSoBWA/maxresdefault.jpg" class="d-block w-100" alt="Sell Old Phone">
        <div class="carousel-caption">
          <h5>Sell Your Old Phone Today</h5>
          <p>Get the best price — instant cash, zero hassle.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="https://shoppinggreedy.com/wp-content/uploads/2025/04/Cashify-Banner-SG.jpg" class="d-block w-100" alt="Refurbished Deals">
        <div class="carousel-caption">
          <h5>Top Refurbished Deals</h5>
          <p>Certified devices at up to 70% off the original price.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ1UyWgChqRFHraiXAhq6CgVQhmIvW8p3U0g&s" class="d-block w-100" alt="Gadgets Exchange">
        <div class="carousel-caption">
          <h5>Exchange &amp; Upgrade</h5>
          <p>Trade in any gadget, get bonus exchange value instantly.</p>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#retroCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#retroCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>
</div>

<!-- ====== OUR SERVICES ====== -->
<div class="services-section fade-up">
  <div class="container-fluid">
    <div class="section-title">
      <span class="title-num">01 /</span>
      Our Services
    </div>
    <div class="row row-cols-3 row-cols-sm-4 row-cols-md-6 row-cols-lg-8 g-3 justify-content-center">

      <div class="col text-center">
        <a href="sell-phone.jsp" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/0/191.png" alt="Sell Phone">
          </div>
          <span class="service-label">Sell Phone</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/2910/2910768.png" alt="Buy Gadgets">
          </div>
          <span class="service-label">Buy Gadgets</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/3659/3659897.png" alt="Buy iPhone">
          </div>
          <span class="service-label">Buy iPhone</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/3659/3659898.png" alt="Buy Laptop">
          </div>
          <span class="service-label">Buy Laptop</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/1156/1156950.png" alt="Repair Phone">
          </div>
          <span class="service-label">Repair Phone</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/900/900618.png" alt="Repair Laptop">
          </div>
          <span class="service-label">Repair Laptop</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/2271/2271083.png" alt="Find New Phone">
          </div>
          <span class="service-label">Find New Phone</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/684/684908.png" alt="Nearby Stores">
          </div>
          <span class="service-label">Nearby Stores</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/2621/2621199.png" alt="Accessories">
          </div>
          <span class="service-label">Accessories</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/3659/3659899.png" alt="Smartphones">
          </div>
          <span class="service-label">Buy Smartphones</span>
        </a>
      </div>

      <div class="col text-center">
        <a href="#" class="service-card">
          <div class="service-icon-wrap">
            <img src="https://cdn-icons-png.flaticon.com/512/3097/3097245.png" alt="Recycle">
          </div>
          <span class="service-label">Recycle</span>
        </a>
      </div>

    </div>
  </div>
</div>

<!-- ====== @Aurthor Anubhav Srivastva ====== -->

<div class="sell-section">
  <div class="container-fluid">
    <div class="sell-card fade-up delay-1">
      <div class="sell-title">— Sell Your Old Device Now</div>
      <div class="row row-cols-3 row-cols-sm-4 row-cols-md-6 row-cols-lg-9 g-3">

        <div class="col">
          <a href="sell-phone.jsp" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/0/191.png" alt="Sell Phone">
            </div>
            <span class="sell-label">Sell Phone</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/900/900618.png" alt="Sell Laptop">
            </div>
            <span class="sell-label">Sell Laptop</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/1682/1682316.png" alt="Sell TV">
            </div>
            <span class="sell-label">Sell TV</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/3659/3659896.png" alt="Sell Tablet">
            </div>
            <span class="sell-label">Sell Tablet</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/2271/2271083.png" alt="Sell Gaming Console">
            </div>
            <span class="sell-label">Sell Console</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/3659/3659900.png" alt="Sell Smartwatch">
            </div>
            <span class="sell-label">Sell Smartwatch</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/2983/2983788.png" alt="Sell Speakers">
            </div>
            <span class="sell-label">Smart Speakers</span>
          </a>
        </div>

        <div class="col">
          <a href="#" class="sell-item">
            <div class="sell-icon-box">
              <img src="https://cdn-icons-png.flaticon.com/512/2910/2910768.png" alt="Sell More">
            </div>
            <span class="sell-label">Sell More</span>
          </a>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- ====== BUY REFURBISHED ====== -->
<div class="refurb-section">
  <div class="container-fluid">
    <div class="d-flex justify-content-between align-items-end mb-3 flex-wrap gap-2">
      <div class="section-title">
        <span class="title-num">02 /</span>
        Buy Refurbished Devices
      </div>
      <a href="#" class="btn-view-all">View All →</a>
    </div>
    <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-xl-5 g-3">

      <div class="col">
        <div class="product-card fade-up delay-1">
          <span class="product-badge">35% OFF</span>
          <div class="product-img-wrap">
            <img src="https://fdn2.gsmarena.com/vv/pics/vivo/vivo-x90-pro-1.jpg" alt="Vivo X90 Pro">
          </div>
          <div class="product-body">
            <div class="product-name">Vivo X90 Pro - Refurbished</div>
            <div>
              <span class="product-price">₹38,199</span>
              <span class="product-old-price">₹58,999</span>
            </div>
            <div class="product-discount">Save ₹20,800</div>
            <div class="product-condition">★★★★☆ Good Condition</div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="product-card fade-up delay-2">
          <span class="product-badge">Sale</span>
          <div class="product-img-wrap">
            <img src="https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-s25-edge-1.jpg" alt="Samsung S25 Edge">
          </div>
          <div class="product-body">
            <div class="product-name">Samsung Galaxy S25 Edge Refurbished</div>
            <div>
              <span class="product-price">₹59,000</span>
              <span class="product-old-price">₹89,999</span>
            </div>
            <div class="product-discount">Save ₹30,999</div>
            <div class="product-condition">★★★★★ Like New</div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="product-card fade-up delay-3">
          <span class="product-badge">Hot</span>
          <div class="product-img-wrap">
            <img src="https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-redmi-note-11-pro-plus-01.jpg" alt="Redmi Note 11">
          </div>
          <div class="product-body">
            <div class="product-name">Xiaomi Redmi Note 11 Pro Plus Refurbished</div>
            <div>
              <span class="product-price">₹12,999</span>
              <span class="product-old-price">₹22,999</span>
            </div>
            <div class="product-discount">Save ₹10,000</div>
            <div class="product-condition">★★★★☆ Good Condition</div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="product-card fade-up delay-1">
          <span class="product-badge">New</span>
          <div class="product-img-wrap">
            <img src="https://fdn2.gsmarena.com/vv/pics/google/google-pixel-8-pro-1.jpg" alt="Google Pixel 8 Pro">
          </div>
          <div class="product-body">
            <div class="product-name">Google Pixel 8 Pro - Refurbished</div>
            <div>
              <span class="product-price">₹41,999</span>
              <span class="product-old-price">₹65,999</span>
            </div>
            <div class="product-discount">Save ₹24,000</div>
            <div class="product-condition">★★★★★ Excellent</div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="product-card fade-up delay-2">
          <span class="product-badge">25% OFF</span>
          <div class="product-img-wrap">
            <img src="https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-s20-fe-5g-1.jpg" alt="Samsung S20 FE">
          </div>
          <div class="product-body">
            <div class="product-name">Samsung Galaxy S20 FE 5G Refurbished</div>
            <div>
              <span class="product-price">₹14,999</span>
              <span class="product-old-price">₹19,999</span>
            </div>
            <div class="product-discount">Save ₹5,000</div>
            <div class="product-condition">★★★★☆ Good</div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<!-- ====== STATS BANNER ====== -->
<div class="stats-banner">
  <div class="container-fluid">
    <div class="d-flex justify-content-around align-items-center flex-wrap gap-4">
      <div class="stat-item">
        <span class="stat-num">50 Lac+</span>
        <span class="stat-label">Happy Users</span>
      </div>
      <div class="stat-divider d-none d-md-block"></div>
      <div class="stat-item">
        <span class="stat-num">1 Crore+</span>
        <span class="stat-label">Devices Sold</span>
      </div>
      <div class="stat-divider d-none d-md-block"></div>
      <div class="stat-item">
        <span class="stat-num">200+</span>
        <span class="stat-label">Experience Centres</span>
      </div>
      <div class="stat-divider d-none d-md-block"></div>
      <div class="stat-item">
        <span class="stat-num">4.8★</span>
        <span class="stat-label">Average Rating</span>
      </div>
      <div class="stat-divider d-none d-md-block"></div>
      <div class="stat-item">
        <span class="stat-num">2024</span>
        <span class="stat-label">Est. Since</span>
      </div>
    </div>
  </div>
</div>

<!-- ====== TESTIMONIALS ====== -->
<div class="testimonials-section">
  <div class="container-fluid">
    <div class="section-title mb-4">
      <span class="title-num">03 /</span>
      What Our Users Say
    </div>
    <div class="row g-3">

      <div class="col-12 col-md-6 col-lg-3">
        <div class="testimonial-card">
          <p class="testimonial-text">Sold my phone very easily and got the payment on the spot. Best experience so far. Definitely worth it!</p>
          <div class="testimonial-author">
            <div class="author-avatar">T</div>
            <div>
              <div class="author-name">Tarun Singh Verma</div>
              <div class="author-date">Feb 2025</div>
              <div class="star">★★★★★</div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-6 col-lg-3">
        <div class="testimonial-card">
          <p class="testimonial-text">Well trained staff. Overall a positive experience in selling my phone via Retrofy.</p>
          <div class="testimonial-author">
            <div class="author-avatar">K</div>
            <div>
              <div class="author-name">Karan Sharma</div>
              <div class="author-date">Jan 2025</div>
              <div class="star">★★★★☆</div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-6 col-lg-3">
        <div class="testimonial-card">
          <p class="testimonial-text">No complaints, sold my phone very easily here. Definitely worth trying if you want quick cash.</p>
          <div class="testimonial-author">
            <div class="author-avatar">A</div>
            <div>
              <div class="author-name">Abhiyansh</div>
              <div class="author-date">Mar 2025</div>
              <div class="star">★★★★★</div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-6 col-lg-3">
        <div class="testimonial-card">
          <p class="testimonial-text">Payment was very instant and the process was quick. Will recommend Retrofy to all my friends.</p>
          <div class="testimonial-author">
            <div class="author-avatar">V</div>
            <div>
              <div class="author-name">Vinil Kumar</div>
              <div class="author-date">Apr 2025</div>
              <div class="star">★★★★★</div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<!-- ====== BRAND PARTNERS ====== -->
<div class="brands-section">
  <div class="container-fluid d-flex align-items-center flex-wrap gap-3">
    <span class="brands-label">Trusted Partners</span>
    <div class="brand-logos-wrap">
      <img class="brand-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Paytm_logo.png/320px-Paytm_logo.png" alt="Paytm">
      <img class="brand-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Nokia_wordmark.svg/320px-Nokia_wordmark.svg.png" alt="Nokia">
      <img class="brand-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Samsung_Logo.svg/320px-Samsung_Logo.svg.png" alt="Samsung">
      <img class="brand-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/OnePlus_Logo.svg/320px-OnePlus_Logo.svg.png" alt="OnePlus">
      <img class="brand-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Microsoft_logo_%282012%29.svg/320px-Microsoft_logo_%282012%29.svg.png" alt="Microsoft">
    </div>
  </div>
</div>

<!-- ====== FOOTER ====== -->
<footer class="retro-footer">
  <div class="container-fluid">
    <div class="row g-4">
      <div class="col-12 col-md-4 col-lg-3">
        <div class="footer-brand">RETROFY</div>
        <div class="footer-tagline">Buy &amp; Sell Old Gadgets · Est. 2024</div>
        <p style="font-family:'Space Mono',monospace; font-size:0.65rem; color:var(--tan); margin-top:1rem; line-height:1.7; opacity:0.8;">
          India's trusted platform for buying and selling old gadgets. Get the best price for your old devices instantly.
        </p>
      </div>
      <div class="col-6 col-md-2">
        <div class="footer-heading">Sell</div>
        <ul class="footer-links">
          <li><a href="sell-phone.jsp">Sell Phone</a></li>
          <li><a href="#">Sell Laptop</a></li>
          <li><a href="#">Sell Tablet</a></li>
          <li><a href="#">Sell Smartwatch</a></li>
          <li><a href="#">Sell TV</a></li>
        </ul>
      </div>
      <div class="col-6 col-md-2">
        <div class="footer-heading">Buy</div>
        <ul class="footer-links">
          <li><a href="#">Buy Phone</a></li>
          <li><a href="#">Buy Laptop</a></li>
          <li><a href="#">Buy iPhone</a></li>
          <li><a href="#">Buy Gadgets</a></li>
          <li><a href="#">View All</a></li>
        </ul>
      </div>
      <div class="col-6 col-md-2">
        <div class="footer-heading">Company</div>
        <ul class="footer-links">
          <li><a href="#">About Us</a></li>
          <li><a href="#">Careers</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">Press</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>
      <div class="col-6 col-md-2">
        <div class="footer-heading">Support</div>
        <ul class="footer-links">
          <li><a href="#">FAQ</a></li>
          <li><a href="#">Track Order</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Terms of Use</a></li>
          <li><a href="#">Warranty</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      © 2024 RETROFY · ALL RIGHTS RESERVED · MADE WITH ♥ IN INDIA
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
