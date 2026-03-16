<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | Retrofy</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Space+Mono:wght@400;700&family=Syne:wght@400;600;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
    background-color: var(--dark);
    font-family: 'Space Mono', monospace;
    min-height: 100vh;
    overflow-x: hidden;
  }

  /* Grain overlay */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
    pointer-events: none;
    z-index: 9999;
    opacity: 0.6;
  }

  /* Horizontal rule lines */
  body::after {
    content: '';
    position: fixed;
    inset: 0;
    background-image: repeating-linear-gradient(
      0deg,
      transparent,
      transparent 60px,
      rgba(232,160,32,0.04) 60px,
      rgba(232,160,32,0.04) 61px
    );
    pointer-events: none;
    z-index: 0;
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
    transition: color 0.2s;
    position: relative;
  }

  .retro-nav .nav-link:hover { color: var(--amber) !important; }

  .retro-nav .nav-link::after {
    content: '';
    position: absolute;
    bottom: 0; left: 50%;
    transform: translateX(-50%);
    width: 0; height: 3px;
    background: var(--amber);
    transition: width 0.3s;
  }

  .retro-nav .nav-link:hover::after { width: 100%; }

  /* ====== BG TEXT ====== */
  .bg-text {
    position: fixed;
    bottom: -40px;
    right: -30px;
    font-family: 'Bebas Neue', sans-serif;
    font-size: 20vw;
    color: rgba(232,160,32,0.04);
    pointer-events: none;
    line-height: 1;
    z-index: 0;
    user-select: none;
    letter-spacing: 10px;
  }

  /* ====== PAGE WRAPPER ====== */
  .page-wrapper {
    position: relative;
    z-index: 1;
    display: flex;
    align-items: flex-start;
    justify-content: center;
    padding: 3rem 1rem 4rem;
    gap: 3rem;
    flex-wrap: wrap;
  }

  /* ====== LEFT PANEL ====== */
  .left-panel {
    width: 260px;
    flex-shrink: 0;
    padding-top: 1rem;
    animation: fadeInLeft 0.6s ease forwards;
  }

  @keyframes fadeInLeft {
    from { opacity: 0; transform: translateX(-20px); }
    to   { opacity: 1; transform: translateX(0); }
  }

  .panel-brand {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 3.5rem;
    letter-spacing: 4px;
    color: var(--amber);
    text-shadow: 4px 4px 0 var(--rust);
    line-height: 1;
    margin-bottom: 0.5rem;
  }

  .panel-sub {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    letter-spacing: 4px;
    color: var(--tan);
    text-transform: uppercase;
    margin-bottom: 2rem;
  }

  .panel-divider {
    height: 3px;
    width: 60px;
    background: var(--amber);
    margin-bottom: 1.5rem;
  }

  .panel-desc {
    font-family: 'Syne', sans-serif;
    font-size: 0.82rem;
    color: rgba(200,169,110,0.7);
    line-height: 1.8;
    margin-bottom: 2rem;
  }

  .panel-perks {
    list-style: none;
    padding: 0;
    display: flex;
    flex-direction: column;
    gap: 0.7rem;
  }

  .panel-perks li {
    font-family: 'Space Mono', monospace;
    font-size: 0.62rem;
    color: var(--tan);
    letter-spacing: 1.5px;
    display: flex;
    align-items: center;
    gap: 0.6rem;
  }

  .perk-dot {
    width: 8px;
    height: 8px;
    background: var(--amber);
    flex-shrink: 0;
  }

  /* ====== REGISTER CARD ====== */
  .register-wrap {
    width: 100%;
    max-width: 480px;
    position: relative;
    z-index: 2;
    animation: fadeInUp 0.6s ease forwards;
  }

  @keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* Stamp corner */
  .stamp-corner {
    position: absolute;
    top: -14px;
    right: -14px;
    width: 70px;
    height: 70px;
    border: 3px solid var(--rust);
    background: var(--dark);
    display: flex;
    align-items: center;
    justify-content: center;
    transform: rotate(12deg);
    z-index: 3;
  }

  .stamp-corner span {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 0.72rem;
    letter-spacing: 2px;
    color: var(--rust);
    text-align: center;
    line-height: 1.2;
  }

  .register-card {
    background: var(--cream);
    border: 3px solid var(--amber);
    padding: 2.5rem;
    position: relative;
  }

  .register-card::before {
    content: '';
    position: absolute;
    inset: 8px;
    border: 1px dashed rgba(200,169,110,0.4);
    pointer-events: none;
  }

  /* ====== CARD HEADER ====== */
  .card-eyebrow {
    font-family: 'Space Mono', monospace;
    font-size: 0.6rem;
    letter-spacing: 4px;
    color: var(--rust);
    text-transform: uppercase;
    margin-bottom: 4px;
  }

  .card-title {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 2.6rem;
    letter-spacing: 4px;
    color: var(--dark);
    line-height: 1;
    margin-bottom: 0.2rem;
  }

  .card-title span { color: var(--amber); }

  .card-subtitle {
    font-family: 'Space Mono', monospace;
    font-size: 0.62rem;
    color: #8a7a5a;
    letter-spacing: 2px;
    margin-bottom: 1.8rem;
  }

  .divider-line {
    height: 2px;
    background: linear-gradient(to right, var(--amber), transparent);
    margin-bottom: 1.8rem;
  }

  /* Step indicator */
  .step-row {
    display: flex;
    gap: 0.4rem;
    margin-bottom: 1.8rem;
  }

  .step-dot {
    height: 4px;
    flex: 1;
    background: var(--tan);
    opacity: 0.3;
    transition: opacity 0.3s, background 0.3s;
  }

  .step-dot.active {
    background: var(--amber);
    opacity: 1;
  }

  /* ====== FORM ELEMENTS ====== */
  .form-row-two {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }

  .form-group { margin-bottom: 1.1rem; }

  .retro-label {
    font-family: 'Space Mono', monospace;
    font-size: 0.58rem;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--dark);
    margin-bottom: 5px;
    display: block;
    font-weight: 700;
  }

  .retro-input,
  .retro-select {
    width: 100%;
    background: var(--paper);
    border: 2px solid var(--dark);
    border-radius: 0;
    color: var(--dark);
    font-family: 'Space Mono', monospace;
    font-size: 0.75rem;
    padding: 0.55rem 0.85rem;
    outline: none;
    transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
    appearance: none;
    -webkit-appearance: none;
  }

  .retro-input:focus,
  .retro-select:focus {
    border-color: var(--amber);
    background: var(--cream);
    box-shadow: 4px 4px 0px var(--amber);
  }

  .retro-input::placeholder { color: #b0a080; }

  /* Icon input */
  .input-icon-row { position: relative; }

  .input-icon-row .retro-input,
  .input-icon-row .retro-select {
    padding-left: 2.3rem;
  }

  .input-icon {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 0.85rem;
    color: var(--tan);
    pointer-events: none;
    z-index: 1;
  }

  /* Custom select */
  .select-wrap { position: relative; }

  .select-wrap::after {
    content: '▼';
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 0.6rem;
    color: var(--amber);
    pointer-events: none;
  }

  .retro-select option { background: var(--cream); color: var(--dark); }

  /* ====== SUBMIT BUTTON ====== */
  .btn-retro-submit {
    width: 100%;
    background: var(--dark);
    color: var(--amber);
    border: 2px solid var(--dark);
    font-family: 'Bebas Neue', sans-serif;
    font-size: 1.3rem;
    letter-spacing: 5px;
    padding: 0.75rem;
    cursor: pointer;
    transition: color 0.2s, transform 0.1s;
    margin-top: 0.4rem;
    position: relative;
    overflow: hidden;
  }

  .btn-retro-submit::before {
    content: '';
    position: absolute;
    inset: 0;
    background: var(--amber);
    transform: translateX(-101%);
    transition: transform 0.3s ease;
    z-index: 0;
  }

  .btn-retro-submit:hover::before { transform: translateX(0); }
  .btn-retro-submit span { position: relative; z-index: 1; }
  .btn-retro-submit:hover span { color: var(--dark); }
  .btn-retro-submit:active { transform: scale(0.98); }

  /* ====== FOOTER LINK ====== */
  .login-line {
    font-family: 'Space Mono', monospace;
    font-size: 0.65rem;
    color: #8a7a5a;
    letter-spacing: 1px;
    text-align: center;
    margin-top: 1.4rem;
    padding-top: 1.2rem;
    border-top: 1px dashed var(--tan);
  }

  .login-line a {
    color: var(--rust);
    text-decoration: none;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    transition: color 0.2s;
  }

  .login-line a:hover { color: var(--amber); }

  .register-footer-tag {
    text-align: center;
    margin-top: 1.2rem;
    font-family: 'Space Mono', monospace;
    font-size: 0.55rem;
    letter-spacing: 3px;
    color: rgba(200,169,110,0.3);
    text-transform: uppercase;
  }

  /* ====== RESPONSIVE ====== */
  @media (max-width: 640px) {
    .left-panel { display: none; }
    .form-row-two { grid-template-columns: 1fr; }
    .register-card { padding: 1.8rem; }
  }
</style>
</head>
<body>

<!-- ====== NAVBAR ====== -->
<nav class="retro-nav navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand d-flex flex-column" href="home.jsp">
      RETROFY
      <span class="nav-tagline">Est. 2024 · Buy &amp; Sell Old Gadgets</span>
    </a>
    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span style="color:var(--amber); font-size:1.4rem;">&#9776;</span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto gap-1">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="sell-phone.jsp">Sell Phone</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Buy Refurbished</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- BG decorative text -->
<div class="bg-text">JOIN</div>

<!-- ====== PAGE WRAPPER ====== -->
<div class="page-wrapper">

  <!-- Left Panel -->
  <div class="left-panel">
    <div class="panel-brand">RETRO<br>FY</div>
    <div class="panel-sub">// New Member</div>
    <div class="panel-divider"></div>
    <p class="panel-desc">
      Join thousands of users buying and selling old gadgets at the best prices. Fast. Simple. Trustworthy.
    </p>
    <ul class="panel-perks">
      <li><span class="perk-dot"></span> Instant Cash for Old Devices</li>
      <li><span class="perk-dot"></span> Certified Refurbished Products</li>
      <li><span class="perk-dot"></span> Free Doorstep Pickup</li>
      <li><span class="perk-dot"></span> 6-Month Warranty</li>
      <li><span class="perk-dot"></span> 50 Lac+ Happy Users</li>
      <li><span class="perk-dot"></span> Secure Payments</li>
    </ul>
  </div>

  <!-- Register Card -->
  <div class="register-wrap">

    <!-- Stamp -->
    <div class="stamp-corner">
      <span>NEW<br>USER</span>
    </div>

    <div class="register-card">

      <div class="card-eyebrow">// Create Account</div>
      <div class="card-title">Join<br><span>Retrofy</span></div>
      <div class="card-subtitle">Fill in your details to get started</div>
      <div class="divider-line"></div>

      <!-- Progress dots -->
      <div class="step-row">
        <div class="step-dot active"></div>
        <div class="step-dot active"></div>
        <div class="step-dot active"></div>
        <div class="step-dot"></div>
      </div>

      <form action="register" method="post">

        <!-- ID + Name side by side -->
        <div class="form-row-two">
          <div class="form-group">
            <label class="retro-label" for="id">User ID</label>
            <div class="input-icon-row">
              <span class="input-icon">#</span>
              <input
                type="text"
                class="retro-input"
                id="id"
                name="id"
                placeholder="e.g. USR001"
                required
              >
            </div>
          </div>

          <div class="form-group">
            <label class="retro-label" for="name">Full Name</label>
            <div class="input-icon-row">
              <span class="input-icon">✦</span>
              <input
                type="text"
                class="retro-input"
                id="name"
                name="name"
                placeholder="Your name"
                required
              >
            </div>
          </div>
        </div>

        <!-- Email -->
        <div class="form-group">
          <label class="retro-label" for="email">Email Address</label>
          <div class="input-icon-row">
            <span class="input-icon">@</span>
            <input
              type="email"
              class="retro-input"
              id="email"
              name="email"
              placeholder="you@example.com"
              required
            >
          </div>
        </div>

        <!-- Password + Phone side by side -->
        <div class="form-row-two">
          <div class="form-group">
            <label class="retro-label" for="password">Password</label>
            <div class="input-icon-row">
              <span class="input-icon">&#9679;</span>
              <input
                type="password"
                class="retro-input"
                id="password"
                name="password"
                placeholder="••••••••"
                required
              >
            </div>
          </div>

          <div class="form-group">
            <label class="retro-label" for="phone">Phone No.</label>
            <div class="input-icon-row">
              <span class="input-icon">☎</span>
              <input
                type="text"
                class="retro-input"
                id="phone"
                name="phone"
                placeholder="+91 XXXXX"
                required
              >
            </div>
          </div>
        </div>

        <!-- Role -->
        <div class="form-group">
          <label class="retro-label" for="role">Register As</label>
          <div class="select-wrap input-icon-row">
            <span class="input-icon">⬡</span>
            <select class="retro-select" id="role" name="role" required>
              <option value="">— Select Your Role —</option>
              <option value="user">User</option>
              <option value="delivery-person">Delivery Person</option>
              <option value="seller">Seller</option>
            </select>
          </div>
        </div>

        <!-- Submit -->
        <button type="submit" class="btn-retro-submit">
          <span>Create Account →</span>
        </button>

      </form>

      <!-- Login link -->
      <div class="login-line">
        Already a member? &nbsp;<a href="login.jsp">Sign In</a>
      </div>

    </div><!-- /register-card -->

    <div class="register-footer-tag">Retrofy · Secure Registration · 2024</div>

  </div><!-- /register-wrap -->

</div><!-- /page-wrapper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
