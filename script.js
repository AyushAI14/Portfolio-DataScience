// smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(a=>{
  a.onclick=e=>{
    e.preventDefault();
    document.querySelector(a.getAttribute("href"))
            .scrollIntoView({behavior:"smooth"});
  };
});

// subtle card animation setup
document.querySelectorAll(".project-card").forEach(card => {
    card.onmousemove = e => {
        const x = e.offsetX;
        const y = e.offsetY;
        const xc = card.clientWidth / 2;
        const yc = card.clientHeight / 2;
        const dx = (x - xc) / 18;
        const dy = (y - yc) / 18;
        card.style.transform = `rotateX(${dy}deg) rotateY(${dx}deg)`;
    }
    card.onmouseleave = () => card.style.transform = "rotateX(0deg)";
});

// ML Training Loop Simulator
let currentEpoch = 42;
let currentLoss = 0.4321;

function simulateTrainingLoop() {
    // 1. Epoch (slowly increment to 100, then reset)
    if (Math.random() > 0.8) {
        currentEpoch++;
        if (currentEpoch > 100) {
            currentEpoch = 1;
            currentLoss = Math.random() * 0.5 + 0.5; // Reset loss high
        }
    }
    document.getElementById('epoch-val').textContent = `${currentEpoch}/100`;

    // 2. Loss (slowly decrease, with minor fluctuations)
    let lossChange = (Math.random() * 0.005) - 0.001; // mostly goes down
    currentLoss = Math.max(0.0100, currentLoss - lossChange);
    document.getElementById('loss-val').textContent = currentLoss.toFixed(4);

    // 3. VRAM (fluctuate slightly)
    const vramBase = 18.2;
    const vramFluctuation = (Math.random() * 0.6 - 0.3); // -0.3 to +0.3
    const vramTotal = (vramBase + vramFluctuation).toFixed(1);
    document.getElementById('vram-val').textContent = vramTotal + 'G';
}

document.addEventListener('DOMContentLoaded', () => {
    // Start training loop telemetry
    simulateTrainingLoop();
    setInterval(simulateTrainingLoop, 800);
});