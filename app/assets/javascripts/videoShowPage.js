function saveVideoAddress(address){
  videos = localStorage.setItem("video", address);
}

var vids = document.getElementsByClassName('video');

document.querySelector('#down').addEventListener('click', function(){
  for (var i=0; i< vids.length; i++) {
    let currentWidth = parseInt(vids[i].style.width.split("px")[0]);
    let currentHeight = parseInt(vids[i].style.height.split("px")[0]);

    newWidth = `${currentWidth + 50}`;
    newHeight = `${currentHeight + 20}`;

    vids[i].style.width = `${newWidth}px`;
    vids[i].style.height = `${newHeight}px`;
  }
});

document.querySelector('#up').addEventListener('click', function(){
  for (var i=0; i< vids.length; i++) {
    let currentWidth = parseInt(vids[i].style.width.split("px")[0]);
    let currentHeight = parseInt(vids[i].style.height.split("px")[0]);

    newWidth = `${currentWidth - 50}`;
    newHeight = `${currentHeight - 20}`;

    vids[i].style.width = `${newWidth}px`;
    vids[i].style.height = `${newHeight}px`;
  }
});

document.querySelector('#reset').addEventListener('click', function(){
  for (var i=0; i< vids.length; i++) {
    vids[i].style.width = "323px";
    vids[i].style.height = "200px";
  }
});
