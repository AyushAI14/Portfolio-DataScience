<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Marc Lou's Solopreneur Diary — 27 Startups Later</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Serif+Display:ital@0;1&family=JetBrains+Mono:wght@300;400;600&display=swap" rel="stylesheet">
<style>
  :root {
    --cream: #f5f0e8;
    --ink: #1a1209;
    --amber: #e8930a;
    --rust: #c0390b;
    --sage: #3d6b4f;
    --gold: #d4a017;
    --paper: #ede8dc;
    --shadow: rgba(26,18,9,0.15);
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  html { scroll-behavior: smooth; }

  body {
    background: var(--ink);
    color: var(--cream);
    font-family: 'JetBrains Mono', monospace;
    overflow-x: hidden;
  }

  /* ── HERO ── */
  .hero {
    position: relative;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    padding: 2rem;
  }

  /* Collage background */
  .thumb-grid {
    position: absolute;
    inset: 0;

  /* Overlay gradient */
  .hero::after {
    content: '';
    position: absolute;
    inset: 0;
    background:
      radial-gradient(ellipse 70% 60% at 50% 50%, rgba(26,18,9,0.55) 0%, rgba(26,18,9,0.92) 100%),
      repeating-linear-gradient(
        0deg,
        transparent,
        transparent 2px,
        rgba(26,18,9,0.06) 2px,
        rgba(26,18,9,0.06) 4px
      );
    pointer-events: none;
    z-index: 1;
  }

  .hero-content {
    position: relative;
    z-index: 2;
    text-align: center;
    max-width: 900px;
  }

  .overline {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.72rem;
    font-weight: 300;
    letter-spacing: 0.35em;
    text-transform: uppercase;
    color: var(--amber);
    margin-bottom: 1.2rem;
    opacity: 0;
    animation: fadeUp 0.8s 0.2s ease forwards;
  }

  .hero-title {
    font-family: 'Bebas Neue', sans-serif;
    font-size: clamp(4.5rem, 12vw, 10rem);
    line-height: 0.9;
    letter-spacing: 0.02em;
    color: var(--cream);
    text-shadow: 0 4px 40px rgba(232,147,10,0.25);
    opacity: 0;
    animation: fadeUp 0.8s 0.4s ease forwards;
  }

  .hero-title span {
    color: var(--amber);
    display: block;
  }

  .hero-sub {
    font-family: 'DM Serif Display', serif;
    font-style: italic;
    font-size: clamp(1rem, 2.5vw, 1.4rem);
    color: rgba(245,240,232,0.7);
    margin-top: 1.4rem;
    opacity: 0;
    animation: fadeUp 0.8s 0.6s ease forwards;
  }

  .hero-stat {
    display: inline-flex;
    gap: 2.5rem;
    margin-top: 2.5rem;
    opacity: 0;
    animation: fadeUp 0.8s 0.8s ease forwards;
  }

  .stat-pill {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.2rem;
    border: 1px solid rgba(232,147,10,0.3);
    border-radius: 2px;
    padding: 0.7rem 1.4rem;
    background: rgba(232,147,10,0.05);
    backdrop-filter: blur(8px);
  }

  .stat-num {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 2.2rem;
    color: var(--amber);
    line-height: 1;
  }

  .stat-label {
    font-size: 0.6rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: rgba(245,240,232,0.5);
  }

  .scroll-cue {
    position: absolute;
    bottom: 2rem;
    left: 50%;
    transform: translateX(-50%);
    z-index: 2;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.4rem;
    font-size: 0.58rem;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: rgba(245,240,232,0.35);
    animation: bobble 2s ease-in-out infinite;
  }

  .scroll-cue::after {
    content: '↓';
    font-size: 1.2rem;
    color: var(--amber);
    opacity: 0.6;
  }

  /* ── SECTION WRAPPER ── */
  .section {
    position: relative;
    padding: 5rem 1.5rem;
    max-width: 1100px;
    margin: 0 auto;
  }

  .section-tag {
    font-size: 0.62rem;
    letter-spacing: 0.4em;
    text-transform: uppercase;
    color: var(--amber);
    margin-bottom: 0.8rem;
    display: flex;
    align-items: center;
    gap: 0.8rem;
  }

  .section-tag::before {
    content: '';
    display: inline-block;
    width: 2rem;
    height: 1px;
    background: var(--amber);
  }

  .section-title {
    font-family: 'Bebas Neue', sans-serif;
    font-size: clamp(2.5rem, 6vw, 5rem);
    line-height: 0.95;
    letter-spacing: 0.04em;
    color: var(--cream);
    margin-bottom: 3.5rem;
  }

  /* ── LESSON CARDS ── */
  .lessons-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 1.5px;
  }

  .lesson-card {
    position: relative;
    background: rgba(245,240,232,0.03);
    border: 1px solid rgba(245,240,232,0.07);
    padding: 2rem 1.8rem;
    transition: background 0.3s, border-color 0.3s, transform 0.3s;
    overflow: hidden;
    cursor: default;
  }

  .lesson-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, var(--amber), transparent);
    transform: scaleX(0);
    transition: transform 0.4s ease;
  }

  .lesson-card:hover {
    background: rgba(232,147,10,0.06);
    border-color: rgba(232,147,10,0.25);
    transform: translateY(-2px);
  }

  .lesson-card:hover::before {
    transform: scaleX(1);
  }

  .card-number {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 4rem;
    color: rgba(232,147,10,0.12);
    line-height: 1;
    position: absolute;
    top: 1rem;
    right: 1.2rem;
    user-select: none;
  }

  .card-category {
    font-size: 0.55rem;
    letter-spacing: 0.35em;
    text-transform: uppercase;
    color: var(--amber);
    margin-bottom: 0.7rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .card-title {
    font-family: 'DM Serif Display', serif;
    font-size: 1.25rem;
    color: var(--cream);
    margin-bottom: 0.9rem;
    line-height: 1.25;
  }

  .card-body {
    font-size: 0.78rem;
    line-height: 1.75;
    color: rgba(245,240,232,0.6);
    font-weight: 300;
  }

  .card-body strong {
    color: var(--cream);
    font-weight: 600;
  }

  /* ── CATEGORY COLORS ── */
  .cat-product .card-category { color: #4ec9b0; }
  .cat-product .lesson-card::before { background: linear-gradient(90deg, transparent, #4ec9b0, transparent); }
  .cat-product:hover { background: rgba(78,201,176,0.05) !important; border-color: rgba(78,201,176,0.25) !important; }

  .cat-marketing .card-category { color: var(--amber); }

  .cat-pricing .card-category { color: #c586c0; }
  .cat-pricing .lesson-card::before { background: linear-gradient(90deg, transparent, #c586c0, transparent); }
  .cat-pricing:hover { background: rgba(197,134,192,0.05) !important; border-color: rgba(197,134,192,0.25) !important; }

  .cat-feedback .card-category { color: #ce9178; }
  .cat-feedback .lesson-card::before { background: linear-gradient(90deg, transparent, #ce9178, transparent); }
  .cat-feedback:hover { background: rgba(206,145,120,0.05) !important; border-color: rgba(206,145,120,0.25) !important; }

  .cat-mindset .card-category { color: #9cdcfe; }
  .cat-mindset .lesson-card::before { background: linear-gradient(90deg, transparent, #9cdcfe, transparent); }
  .cat-mindset:hover { background: rgba(156,220,254,0.05) !important; border-color: rgba(156,220,254,0.25) !important; }

  /* ── DIVIDER ── */
  .divider {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 1.5rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    color: rgba(245,240,232,0.12);
    font-size: 0.65rem;
    letter-spacing: 0.3em;
    text-transform: uppercase;
  }

  .divider::before,
  .divider::after {
    content: '';
    flex: 1;
    height: 1px;
    background: rgba(245,240,232,0.08);
  }

  /* ── VIDEO ROW ── */
  .video-strip {
    padding: 3rem 1.5rem;
    max-width: 1100px;
    margin: 0 auto;
  }

  .video-scroll {
    display: flex;
    gap: 1rem;
    overflow-x: auto;
    padding-bottom: 1rem;
    scrollbar-width: thin;
    scrollbar-color: var(--amber) transparent;
  }

  .video-thumb {
    flex-shrink: 0;
    width: 200px;
    height: 113px;
    border-radius: 2px;
    overflow: hidden;
    position: relative;
    border: 1px solid rgba(245,240,232,0.08);
    transition: transform 0.3s, border-color 0.3s;
  }

  .video-thumb:hover {
    transform: scale(1.04);
    border-color: var(--amber);
  }

  .video-thumb img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    filter: saturate(0.8) sepia(0.15);
    transition: filter 0.3s;
  }

  .video-thumb:hover img { filter: saturate(1) sepia(0); }

  .video-thumb a {
    position: absolute;
    inset: 0;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .play-btn {
    width: 36px;
    height: 36px;
    background: rgba(232,147,10,0.85);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(4px);
    opacity: 0;
    transition: opacity 0.3s;
  }

  .video-thumb:hover .play-btn { opacity: 1; }

  .play-btn svg { fill: white; margin-left: 2px; }

  /* ── FOOTER ── */
  footer {
    border-top: 1px solid rgba(245,240,232,0.08);
    padding: 2.5rem 1.5rem;
    max-width: 1100px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
  }

  .footer-brand {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 1.4rem;
    color: var(--amber);
    letter-spacing: 0.05em;
  }

  .footer-note {
    font-size: 0.62rem;
    color: rgba(245,240,232,0.3);
    letter-spacing: 0.1em;
  }

  /* ── ANIMATIONS ── */
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @keyframes bobble {
    0%, 100% { transform: translateX(-50%) translateY(0); }
    50%       { transform: translateX(-50%) translateY(6px); }
  }

  /* Intersection observer fade */
  .reveal {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.7s ease, transform 0.7s ease;
  }
  .reveal.visible {
    opacity: 1;
    transform: translateY(0);
  }

  /* staggered children */
  .lesson-card { opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease, transform 0.5s ease, background 0.3s, border-color 0.3s; }
  .lesson-card.visible { opacity: 1; transform: translateY(0); }

  /* Noise overlay */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='1'/%3E%3C/svg%3E");
    opacity: 0.025;
    pointer-events: none;
    z-index: 9999;
  }

  @media (max-width: 600px) {
    .stat-pill { padding: 0.5rem 0.9rem; }
    .hero-stat { gap: 1rem; }
    .lessons-grid { grid-template-columns: 1fr; }
    footer { flex-direction: column; text-align: center; }
  }
</style>
</head>
<body>

<!-- ─── HERO ─── -->
<section class="hero">

  <!-- Faded thumbnail mosaic -->
  <div class="thumb-grid"></div>

  <div class="hero-content">
    <p class="overline">Solopreneur Diary · 27 Startups · Hard-Won Lessons</p>
    <h1 class="hero-title">
      Marc Lou<span>After 27</span>
    </h1>
    <p class="hero-sub">Everything he learned shipping startups, distilled.</p>

    <div class="hero-stat">
      <div class="stat-pill">
        <span class="stat-num">27</span>
        <span class="stat-label">Startups Built</span>
      </div>
      <div class="stat-pill">
        <span class="stat-num">10</span>
        <span class="stat-label">Made Money</span>
      </div>
      <div class="stat-pill">
        <span class="stat-num">95%</span>
        <span class="stat-label">Profit Margin</span>
      </div>
      <div class="stat-pill">
        <span class="stat-num">∞</span>
        <span class="stat-label">Lessons</span>
      </div>
    </div>
  </div>

  <div class="scroll-cue">Scroll to learn</div>
</section>

<!-- ─── PRODUCT SECTION ─── -->
<div class="divider">Product Strategy & Execution</div>

<section class="section">
  <p class="section-tag reveal">Chapter 01</p>
  <h2 class="section-title reveal">Build Fast.<br>Bet Often.</h2>

  <div class="lessons-grid">

    <div class="cat-product lesson-card">
      <span class="card-number">01</span>
      <p class="card-category">⚡ Strategy</p>
      <h3 class="card-title">Ship Fast & Place Multiple Bets</h3>
      <p class="card-body">Focus is overrated at the start. Obsessing over a single project for months creates dangerous expectations — and brutal burnout when it flops. <strong>Treat your projects like a portfolio.</strong> Out of 27, only 10 made money. That's the game.</p>
    </div>

    <div class="cat-product lesson-card">
      <span class="card-number">02</span>
      <p class="card-category">🎯 Validation</p>
      <h3 class="card-title">Solve Your Own Problems</h3>
      <p class="card-body">The best product-market fit guarantee: <strong>build for your own pain.</strong> You validate demand instantly, stay motivated naturally, and never run out of feedback. You are customer zero.</p>
    </div>

    <div class="cat-product lesson-card">
      <span class="card-number">03</span>
      <p class="card-category">🔁 Ideation</p>
      <h3 class="card-title">Replicate What Works</h3>
      <p class="card-body">No ideas? Find markets where people already spend money. You don't need a breakthrough — <strong>inject your own twist, design signature, or playful voice</strong> into an existing solution. Done beats original.</p>
    </div>

    <div class="cat-product lesson-card">
      <span class="card-number">04</span>
      <p class="card-category">🤖 AI</p>
      <h3 class="card-title">Leverage AI for Maximum Speed</h3>
      <p class="card-body">The gap between idea and reality has collapsed. <strong>Use AI agents — Claude, Cursor — to write code, design UI, and build entire apps in hours.</strong> No-code excuse exists anymore.</p>
    </div>

    <div class="cat-product lesson-card">
      <span class="card-number">05</span>
      <p class="card-category">💰 Economics</p>
      <h3 class="card-title">Digital Margins Are Unmatched</h3>
      <p class="card-body">A $1.5M digital SaaS can run at <strong>80–95% profit margin</strong>. A restaurant needs $20M revenue to net $1M profit. The math is not even close. Software is the greatest business model ever invented.</p>
    </div>

    <div class="cat-product lesson-card">
      <span class="card-number">06</span>
      <p class="card-category">⚖️ Balance</p>
      <h3 class="card-title">The 50/50 Feature Split</h3>
      <p class="card-body">Divide dev time equally: <strong>50% on product features</strong> (user requests → reduce churn) and <strong>50% on growth features</strong> (your ideas → virality, new users). Skew either way and you stagnate.</p>
    </div>

  </div>
</section>

<!-- ─── MARKETING SECTION ─── -->
<div class="divider">Marketing & Sales</div>

<section class="section">
  <p class="section-tag reveal">Chapter 02</p>
  <h2 class="section-title reveal">Market Like<br>a Hacker.</h2>

  <div class="lessons-grid">

    <div class="cat-marketing lesson-card">
      <span class="card-number">07</span>
      <p class="card-category">🛠️ Growth</p>
      <h3 class="card-title">Build Free Side Projects as Marketing</h3>
      <p class="card-body">Hate marketing? Build <strong>100% free, single-feature tools</strong> with obvious names ("Logo Fast"). No signups. Let them spread virally. Place a quiet ad that funnels high-quality traffic to your paid product. Marketing that doesn't feel like marketing.</p>
    </div>

    <div class="cat-marketing lesson-card">
      <span class="card-number">08</span>
      <p class="card-category">📧 Sales</p>
      <h3 class="card-title">Sell It Before You Make It</h3>
      <p class="card-body">Cold email a precise target audience with your solution. <strong>Ask for payment upfront.</strong> If they pay → validated market. If they don't → you saved months of useless building. Validation costs an email, not a year.</p>
    </div>

    <div class="cat-marketing lesson-card">
      <span class="card-number">09</span>
      <p class="card-category">🌍 Virality</p>
      <h3 class="card-title">Bake Viral Features Into the Product</h3>
      <p class="card-body">Build features that are <strong>inherently shareable</strong> — think real-time 3D globes of live visitors. When users post it on social, they become your marketing team. Your product IS the campaign.</p>
    </div>

    <div class="cat-marketing lesson-card">
      <span class="card-number">10</span>
      <p class="card-category">🔗 SEO</p>
      <h3 class="card-title">Programmatic SEO Cross-Linking</h3>
      <p class="card-body">Every new startup gets a backlink in the footer of all your older sites. <strong>Domain trust transfers instantly.</strong> New project ranks on Google in days, not months. Stack your authority network over time.</p>
    </div>

  </div>
</section>

<!-- ─── PRICING SECTION ─── -->
<div class="divider">Pricing & Landing Page Psychology</div>

<section class="section">
  <p class="section-tag reveal">Chapter 03</p>
  <h2 class="section-title reveal">Price Like<br>a Pro.</h2>

  <div class="lessons-grid">

    <div class="cat-pricing lesson-card">
      <span class="card-number">11</span>
      <p class="card-category">💊 Positioning</p>
      <h3 class="card-title">Painkiller, Not a Vitamin</h3>
      <p class="card-body">Rewrite your copy to frame your product as a <strong>cure for pain, not a nice-to-have feature</strong>. People spend to eliminate hurt, not to gain a marginal benefit. Change the framing, multiply revenue per visitor dramatically.</p>
    </div>

    <div class="cat-pricing lesson-card">
      <span class="card-number">12</span>
      <p class="card-category">🏷️ Pricing</p>
      <h3 class="card-title">Too Cheap Signals Low Quality</h3>
      <p class="card-body">Paradoxically, <strong>raising prices increases perceived value</strong> and can accelerate revenue. Cheap prices trigger doubt. Premium prices trigger trust. Test upward, not downward.</p>
    </div>

    <div class="cat-pricing lesson-card">
      <span class="card-number">13</span>
      <p class="card-category">💳 Model</p>
      <h3 class="card-title">One-Time vs Subscription</h3>
      <p class="card-body"><strong>One-time payments</strong> are easier to sell — ideal for validating fast and generating cash flow. <strong>Subscriptions</strong> require commitment to community and long-term dev, but compound. Pick based on your readiness, not your greed.</p>
    </div>

    <div class="cat-pricing lesson-card">
      <span class="card-number">14</span>
      <p class="card-category">📄 Copy</p>
      <h3 class="card-title">Landing Page Structure That Converts</h3>
      <p class="card-body">Lead with a bold promise that sounds <strong>"almost too good to be true."</strong> Then dedicate every remaining inch of the page to dismantling objections and proving that promise holds. Headline sells; page closes.</p>
    </div>

    <div class="cat-pricing lesson-card">
      <span class="card-number">15</span>
      <p class="card-category">🎁 Promos</p>
      <h3 class="card-title">Bundle, Don't Discount</h3>
      <p class="card-body">On Black Friday: <strong>never cut your price.</strong> Discounts train customers to wait and cheapen your brand. Instead, keep price fixed — bundle it with courses, templates, extras. Perceived value spikes. Brand stays intact.</p>
    </div>

  </div>
</section>

<!-- ─── FEEDBACK SECTION ─── -->
<div class="divider">Customer Feedback & Iteration</div>

<section class="section">
  <p class="section-tag reveal">Chapter 04</p>
  <h2 class="section-title reveal">Listen to<br>the Silence.</h2>

  <div class="lessons-grid">

    <div class="cat-feedback lesson-card">
      <span class="card-number">16</span>
      <p class="card-category">🗣️ Feedback</p>
      <h3 class="card-title">Chase the People Who Didn't Buy</h3>
      <p class="card-body">Track visitors who left without purchasing and ask them to be <strong>"brutal and blunt"</strong> about why. Politeness hides truth. Raw objections reveal exactly what to fix on your page. Non-buyers are your best consultants.</p>
    </div>

    <div class="cat-feedback lesson-card">
      <span class="card-number">17</span>
      <p class="card-category">📬 Automation</p>
      <h3 class="card-title">Automate Churn Recovery Emails</h3>
      <p class="card-body">Wire Stripe webhooks to fire personalized emails when users abandon checkout or cancel. <strong>Open a dialogue instantly.</strong> These emails reveal your biggest product gaps — and sometimes recover customers you thought were gone.</p>
    </div>

    <div class="cat-feedback lesson-card">
      <span class="card-number">18</span>
      <p class="card-category">📊 Focus</p>
      <h3 class="card-title">Track Revenue Per Visitor</h3>
      <p class="card-body">Divide total revenue by unique visitors for each project. <strong>Go deep on the highest ratio.</strong> Most founders optimize for traffic. The real metric is efficiency: how much does each eyeball actually earn you?</p>
    </div>

  </div>
</section>

<!-- ─── MINDSET SECTION ─── -->
<div class="divider">Mindset, Health & Productivity</div>

<section class="section">
  <p class="section-tag reveal">Chapter 05</p>
  <h2 class="section-title reveal">The Inner<br>Game.</h2>

  <div class="lessons-grid">

    <div class="cat-mindset lesson-card">
      <span class="card-number">19</span>
      <p class="card-category">🌑 Resilience</p>
      <h3 class="card-title">Embrace the Nothingness</h3>
      <p class="card-body">Most of the journey is long stretches of silence — <strong>no revenue, no audience, no validation.</strong> Get comfortable with uncomfortable nothingness. Luck can't find you unless you're still standing when it arrives.</p>
    </div>

    <div class="cat-mindset lesson-card">
      <span class="card-number">20</span>
      <p class="card-category">⏰ Deadlines</p>
      <h3 class="card-title">Set Strict, Short Deadlines</h3>
      <p class="card-body">A year-long project creates year-sized expectations — and devastating crashes. <strong>Short deadlines force fast launches</strong> and cap emotional investment. If it flops, you shrug and ship the next one. Protect your spirit.</p>
    </div>

    <div class="cat-mindset lesson-card">
      <span class="card-number">21</span>
      <p class="card-category">💪 Health</p>
      <h3 class="card-title">Health Is the Foundation of Hustle</h3>
      <p class="card-body">Toxic hustle culture burns founders out. His rules: <strong>8–9 hrs sleep, no screens before bed, low sugar / high protein, one intense daily workout.</strong> You cannot build a business from the ruins of a broken body.</p>
    </div>

    <div class="cat-mindset lesson-card">
      <span class="card-number">22</span>
      <p class="card-category">🎯 Focus</p>
      <h3 class="card-title">Constraint Breeds Creativity</h3>
      <p class="card-body">Don't grind 12-hour days. <strong>Cap deep work at 4–5 hours of total disconnection</strong> — no phone, no internet. Scarcity forces your brain to be creative and precise. More hours rarely means more output.</p>
    </div>

  </div>
</section>

<!-- ─── VIDEOS ─── -->
<div class="divider">The Diary — All 27 Videos</div>

<div class="video-strip">
  <p class="section-tag reveal" style="margin-bottom: 1.5rem;">Watch the Full Journey</p>
  <div class="video-scroll" id="videoRow"></div>
</div>

<!-- ─── FOOTER ─── -->
<footer>
  <div class="footer-brand">Marc Lou's Diary</div>
  <p class="footer-note">27 startups · 10 profitable · 1 solopreneur · All lessons earned.</p>
</footer>

<script>
// ── Video IDs
const videoIds = [
  '98Mh_6cKedc','uAdaHO7D4xw','hXuu1jjYsjo','fhCzzZHjr6o',
  'B7EHdqms3hU','kim2qKeAFlI','6RXIjzRm-60','SexBiCtI_Qg',
  'uEc1jcmTzZU','bVbnNEYqDwQ','C2Bs_Zu103U','-Jl9l3O9Hm8',
  'QLE5SGu0ID4','J-QF8Y1G-CE','TXla9Zq3Iqc','BHshHvKmJYQ',
  'KJb_nfR6gJk','Qmgcaz-kuVE','Vdd_9NlXxYY','apO6jhHNpWU',
  'LRMTfhUM81I','agSU33udQCY','cQeP7NveEEI','ZeE0T1TxpfU',
  'oeEijU5l2Ec','aGyaL-AyDkQ','Fi5vN8BXF9Y'
];

// ── Populate video row
const row = document.getElementById('videoRow');
videoIds.forEach((id, idx) => {
  const card = document.createElement('div');
  card.className = 'video-thumb';
  card.innerHTML = `
    <img src="https://img.youtube.com/vi/${id}/mqdefault.jpg" alt="Video ${idx+1}" loading="lazy">
    <a href="https://www.youtube.com/watch?v=${id}" target="_blank" rel="noopener">
      <div class="play-btn">
        <svg viewBox="0 0 24 24" width="14" height="14"><polygon points="5,3 19,12 5,21"/></svg>
      </div>
    </a>
  `;
  row.appendChild(card);
});

// ── Intersection Observer for reveals
const io = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.classList.add('visible');
    }
  });
}, { threshold: 0.12 });

document.querySelectorAll('.reveal').forEach(el => io.observe(el));

// Staggered cards
document.querySelectorAll('.lesson-card').forEach((el, i) => {
  el.style.transitionDelay = `${(i % 6) * 70}ms`;
  io.observe(el);
});
</script>
</body>
</html>