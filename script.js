// smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.onclick = e => {
        e.preventDefault();
        document.querySelector(a.getAttribute("href"))
            .scrollIntoView({ behavior: "smooth" });
    };
});

// scroll progress bar
const progressBar = document.getElementById('scroll-progress');
window.addEventListener('scroll', () => {
    const scrollTop = window.scrollY;
    const docHeight = document.documentElement.scrollHeight - window.innerHeight;
    const progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;
    progressBar.style.width = progress + '%';
});

// scroll-reveal observer
const revealElements = document.querySelectorAll('.reveal');
const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('revealed');
            revealObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.15, rootMargin: '0px 0px -40px 0px' });
revealElements.forEach(el => revealObserver.observe(el));

// typing effect for subtitle
const typedSub = document.getElementById('typed-sub');
const text = 'Data Science | ML | NLP | Agentic AI | MLOps';
let i = 0;

function typeWriter() {
    if (i < text.length) {
        typedSub.textContent += text.charAt(i);
        i++;
        setTimeout(typeWriter, 45 + Math.random() * 55);
    }
}
setTimeout(typeWriter, 400);

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
    };
    card.onmouseleave = () => card.style.transform = "rotateX(0deg)";
});

// ML Training Loop Simulator
let currentEpoch = 42;
let currentLoss = 0.4321;

function simulateTrainingLoop() {
    if (Math.random() > 0.8) {
        currentEpoch++;
        if (currentEpoch > 100) {
            currentEpoch = 1;
            currentLoss = Math.random() * 0.5 + 0.5;
        }
    }
    document.getElementById('epoch-val').textContent = `${currentEpoch}/100`;

    let lossChange = (Math.random() * 0.005) - 0.001;
    currentLoss = Math.max(0.0100, currentLoss - lossChange);
    document.getElementById('loss-val').textContent = currentLoss.toFixed(4);

    const vramBase = 18.2;
    const vramFluctuation = (Math.random() * 0.6 - 0.3);
    const vramTotal = (vramBase + vramFluctuation).toFixed(1);
    document.getElementById('vram-val').textContent = vramTotal + 'G';
}

document.addEventListener('DOMContentLoaded', () => {
    simulateTrainingLoop();
    setInterval(simulateTrainingLoop, 800);
});
