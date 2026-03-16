<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Retrofy</title>
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
    color: var(--dark);
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

  /* Decorative background lines */
  body::after {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      repeating-linear-gradient(
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
    position: relative;
    transition: color 0.2s;
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

  /* ====== PAGE WRAPPER ====== */
  .page-wrapper {
    position: relative;
    z-index: 1;
    min-height: calc(100vh - 80px);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 3rem 1rem;
  }

  /* ====== BIG BG TEXT ====== */
  .bg-text {
    position: fixed;
    bottom: -40px;
    left: -20px;
    font-family: 'Bebas Neue', sans-serif;
    font-size: 22vw;
    color: rgba(232,160,32,0.04);
    pointer-events: none;
    line-height: 1;
    z-index: 0;
    user-select: none;
    letter-spacing: 10px;
  }

  /* ====== LOGIN CARD ====== */
  .login-wrap {
    width: 100%;
    max-width: 460px;
    position: relative;
    z-index: 2;
    animation: fadeInUp 0.6s ease forwards;
  }

  @keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* Stamp corner decoration */
  .stamp-corner {
    position: absolute;
    top: -14px;
    right: -14px;
    width: 70px;
    height: 70px;
    border: 3px solid var(--amber);
    background: var(--dark);
    display: flex;
    align-items: center;
    justify-content: center;
    transform: rotate(12deg);
    z-index: 3;
  }

  .stamp-corner span {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 0.75rem;
    letter-spacing: 2px;
    color: var(--amber);
    text-align: center;
    line-height: 1.2;
  }

  .login-card {
    background: var(--cream);
    border: 3px solid var(--amber);
    padding: 2.5rem;
    position: relative;
  }

  /* Dotted inner border */
  .login-card::before {
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
    font-size: 2.8rem;
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
    margin-bottom: 2rem;
  }

  .divider-line {
    height: 2px;
    background: linear-gradient(to right, var(--amber), transparent);
    margin-bottom: 2rem;
  }

  /* ====== FORM ELEMENTS ====== */
  .retro-label {
    font-family: 'Space Mono', monospace;
    font-size: 0.62rem;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--dark);
    margin-bottom: 6px;
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
    font-size: 0.78rem;
    padding: 0.6rem 0.9rem;
    outline: none;
    transition: border-color 0.2s, background 0.2s;
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

  /* Custom select arrow */
  .select-wrap {
    position: relative;
  }

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

  /* ====== ERROR MESSAGE ====== */
  .retro-error {
    background: rgba(192,64,26,0.1);
    border: 2px solid var(--rust);
    border-left: 6px solid var(--rust);
    padding: 0.7rem 1rem;
    font-family: 'Space Mono', monospace;
    font-size: 0.68rem;
    color: var(--rust);
    letter-spacing: 1px;
    margin-bottom: 1.2rem;
  }

  .retro-error::before {
    content: '⚠ ';
    font-weight: 700;
  }

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
    transition: background 0.2s, color 0.2s, transform 0.1s, box-shadow 0.2s;
    margin-top: 0.5rem;
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

  /* ====== REGISTER LINK ====== */
  .register-line {
    font-family: 'Space Mono', monospace;
    font-size: 0.65rem;
    color: #8a7a5a;
    letter-spacing: 1px;
    text-align: center;
    margin-top: 1.5rem;
    padding-top: 1.2rem;
    border-top: 1px dashed var(--tan);
  }

  .register-line a {
    color: var(--rust);
    text-decoration: none;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    transition: color 0.2s;
  }

  .register-line a:hover { color: var(--amber); }

  /* ====== FOOTER TAG ====== */
  .login-footer-tag {
    text-align: center;
    margin-top: 1.5rem;
    font-family: 'Space Mono', monospace;
    font-size: 0.55rem;
    letter-spacing: 3px;
    color: rgba(200,169,110,0.3);
    text-transform: uppercase;
  }

  /* ====== FORM GROUP SPACING ====== */
  .form-group { margin-bottom: 1.2rem; }

  /* ====== INPUT ICON ROW ====== */
  .input-icon-row {
    position: relative;
  }

  .input-icon-row .retro-input {
    padding-left: 2.5rem;
  }

  .input-icon {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 0.9rem;
    color: var(--tan);
    pointer-events: none;
    z-index: 1;
  }
</style>
</head>
<body>

<%
  String userSession = (String) session.getAttribute("userSession");
  if (userSession != null) {
    request.setAttribute("msg", "You have been logged out successfully.");
    session.invalidate();
  }
  String message = (String) request.getAttribute("msg");
%>

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
        <li class="nav-item"><a class="nav-link" href="registration.jsp">Register</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- BG decorative text -->
<div class="bg-text">RETRO</div>

<!-- ====== PAGE WRAPPER ====== -->
<div class="page-wrapper">
  <div class="login-wrap">

    <!-- Stamp corner -->
    <div class="stamp-corner">
      <span>LOG<br>IN</span>
    </div>

    <!-- Login Card -->
    <div class="login-card">

      <div class="card-eyebrow">// Member Access</div>
      <div class="card-title">Welcome<br>Back <span>.</span></div>
      <div class="card-subtitle">Sign in to your Retrofy account</div>
      <div class="divider-line"></div>

      <!-- Error / Success Message -->
      <% if (message != null) { %>
        <div class="retro-error"><%= message %></div>
      <% } %>

      <form action="login" method="post">

        <!-- Email / Username -->
        <div class="form-group">
          <label class="retro-label" for="username">Email / Username</label>
          <div class="input-icon-row">
            <span class="input-icon">@</span>
            <input
              type="text"
              class="retro-input"
              id="username"
              name="email"
              placeholder="you@example.com"
              required
            >
          </div>
        </div>

        <!-- Password -->
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

        <!-- Role -->
        <div class="form-group">
          <label class="retro-label" for="role">Login As</label>
          <div class="select-wrap">
            <select class="retro-select" id="role" name="role" required>
              <option value="">— Select Your Role —</option>
              <option value="user">User</option>
              <option value="deliveryperson">Delivery Person</option>
              <option value="seller">Seller</option>
              <option value="admin">Admin</option>
            </select>
          </div>
        </div>

        <!-- Submit -->
        <button type="submit" class="btn-retro-submit">
          <span>Enter Retrofy →</span>
        </button>

      </form>

      <!-- Register link -->
      <div class="register-line">
        New here? &nbsp;<a href="registration.jsp">Create an Account</a>
      </div>

    </div><!-- /login-card -->

    <div class="login-footer-tag">Retrofy · Secure Login · 2024</div>

  </div><!-- /login-wrap -->
</div><!-- /page-wrapper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
