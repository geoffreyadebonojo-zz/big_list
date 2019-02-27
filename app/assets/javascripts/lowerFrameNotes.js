var lowerFrameNotes = document.querySelector("#lowerFrameNotes")
console.log(lowerFrameNotes);
lowerFrameNotes.style.width = "0px";
var expanded = false
collapseNotes.addEventListener('click', function(){
  if (expanded == false){
    lowerFrameNotes.style.width = "70%";
    expanded = true;
  } else{
    lowerFrameNotes.style.width = "0px";
    expanded = false;
  }
});
