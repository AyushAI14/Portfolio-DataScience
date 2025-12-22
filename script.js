// smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(a=>{
  a.onclick=e=>{
    e.preventDefault();
    document.querySelector(a.getAttribute("href"))
            .scrollIntoView({behavior:"smooth"});
  };
});


// typing animation
const el = document.querySelector(".typewrite");
const words = JSON.parse(el.getAttribute("data-words"));
let i = 0, index = 0, deleting = false;

function tick(){
  const word = words[index];

  if(!deleting){
    el.textContent = word.substring(0,i++);
    if(i === word.length){ deleting = true; setTimeout(tick,900); return;}
  }
  else {
    el.textContent = word.substring(0,i--);
    if(i === 0){ deleting = false; index = (index+1)%words.length; }
  }

  setTimeout(tick, deleting?40:80);
}
tick();

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

// cursor water drop animation
document.addEventListener("mousemove", function(e){

    const drop = document.createElement("span");
    drop.classList.add("ripple");

    const wrapperOffset = document.querySelector(".page-wrapper")
                                .getBoundingClientRect();

    drop.style.left = (e.clientX - wrapperOffset.left) + "px";
    drop.style.top  = (e.clientY - wrapperOffset.top) + "px";

    document.getElementById("ripple-container").appendChild(drop);

    setTimeout(()=> drop.remove(), 700);

});

document.querySelector(".page-wrapper").addEventListener("mousemove", e => {
    const area = document.getElementById("cursor-ripple");

    const d = document.createElement("div");
    d.className = "dot";

    const box = area.getBoundingClientRect();

    d.style.left = `${e.clientX - box.left}px`;
    d.style.top  = `${e.clientY - box.top}px`;

    area.appendChild(d);

    setTimeout(()=> d.remove(),600);
});

async function getSpotify() {
    const userId = "1292745882990673940"; 
    try {
        const response = await fetch(`https://api.lanyard.rest/v1/users/${userId}`);
        const data = await response.json();

        // Check if listening_to_spotify is true
        if (data.success && data.data.listening_to_spotify) {
            const spotify = data.data.spotify;
            
            // FIX: Changed .track to .song
            document.getElementById('track-name').textContent = spotify.song;
            document.getElementById('artist-name').textContent = spotify.artist;
            
            // Update UI
            document.getElementById('spotify-card').classList.add('is-playing');
            document.querySelector('.spotify-icon i').classList.add('fa-spin');
        } else {
            document.getElementById('track-name').textContent = "Not Listening";
            document.getElementById('artist-name').textContent = "Spotify";
            document.getElementById('spotify-card').classList.remove('is-playing');
            document.querySelector('.spotify-icon i').classList.remove('fa-spin');
        }
    } catch (error) {
        console.error("Error fetching Spotify data", error);
    }
}

// THIS IS VITAL: Ensures the elements exist before the script tries to find them
document.addEventListener('DOMContentLoaded', () => {
    getSpotify();
    setInterval(getSpotify, 15000);
});