var timeInSeconds = 60 * 25;

let ctx = document.getElementById("timer").getContext('2d');

function draw(i){
  ctx.fillStyle = `rgb(${i*(255/360)}, ${255-(i*(255/360)/5)}, 0)`;
  ctx.fillRect(i/5 - 5, 20, 5, 100);
}


var timer = document.querySelector("#timer")
timer.addEventListener('click', function() {
  let i = 0;
  var interval = setInterval(function(){
    if (i < timeInSeconds) {
      draw(i);
      console.log(i);
      i++;
    } else {
      ctx.clearRect(0, 0, 800, 120);
      m = i / 60;
      // alert(i/60 + "minutes passed. take a break");
      var randomTime = Math.round(Math.random()*60*60);
      musicPlayer.innerHTML = `<iframe src="https://www.youtube.com/embed/NQI1r3J9Scs?start=${randomTime}" id="now-playing" frameborder="0" allowfullscreen draggable="true"></iframe>`;
      clearInterval(interval);
    }
  }, 1000);
});
