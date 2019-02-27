var musicPlayer = document.getElementById("music-player");
musicPlayer.innerHTML = `<iframe src="${localStorage.getItem("now-playing")}" id="now-playing" frameborder="0" allowfullscreen draggable="true"></iframe>`;

var toggleButton = document.getElementById("toggle");
var nowPlaying = document.getElementById("now-playing");
var lowerFrame = document.getElementById("lowerFrame");
var body = document.querySelector("body");

var hidden = false;
toggleButton.addEventListener('click', function(){
  if (hidden == false) {
    nowPlaying.style.height = "0px";
    musicPlayer.style.height = "0px";
    body.style.bottom = "50px";
    toggleButton.style.top = "10px";
    lowerFrame.style.bottom = "50px";
    hidden = true;
    toggleButton.innerHTML = "Show Music Player";
  } else {
    nowPlaying.style.height = "100px";
    musicPlayer.style.height = "50px";
    body.style.bottom = "0px";
    toggleButton.style.top = "-40px";
    hidden = false;
    toggleButton.innerHTML = "Hide Music Player";
  }
});
