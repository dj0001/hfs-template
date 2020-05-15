[+]
<script>  //create thumbs on upload
function sendFilez(filesArray) {
if(!thumbsize || location.search=='?nothumb') return
if(!document.querySelector('a[href="thumb/"]')) if(filesArray[0].type.match(/image.*/)) fetch("/~mkdir?name="+folder+'thumb')  //return
for (var i=0; i<filesArray.length; i++) {
 if (!filesArray[i].type.match(/image.*|video.*/)) continue
 GetThumbnail(filesArray[i]) 
 }
}

function GetThumbnail(file) {  //Copyright 2019 dj  ,License BSD 2-Clause
var myCan = document.createElement('canvas');
var img = (file.type||'').match(/video.*/)? document.createElement("video") : new Image()
var filename=file.name||decodeURI(file)
 img.onloadeddata = img.onload = function () {
  myCan.width = myCan.height = thumbsize;
  var a=img.videoWidth/img.videoHeight || img.width/img.height
  if(a<1) myCan.height/=a; else myCan.width*=a
  myCan.getContext("2d").drawImage(img, 0, 0, myCan.width, myCan.height)
  URL.revokeObjectURL(img.src)
  myCan.toBlob(function(blob) {
 //send thumbnail
 var xhr=new XMLHttpRequest(), fd = new FormData()
 fd.append("image", blob, filename);
 xhr.open("POST", folder+"thumb/", true)
 xhr.send(fd)
 }, "image/png");
 }
img.src = file.name? URL.createObjectURL(file):file
}

var ref=document.querySelector('input[type=file]')  //mobil-light5
if (ref) ref.addEventListener("change", function(){sendFilez(this.files)})
tn=/\.jpg|\.png|\.gif|\.mp4/  //edit here

if(location.search==atob('P2F1dG8='))  //auto creates thumbs from all pics
document.addEventListener('render', function (){
document.querySelectorAll('#files a').forEach(item => {if(!(['.jpg','.png','.gif'].indexOf(item.href.slice(-4))+1)) return; GetThumbnail(item.getAttribute('href'))})
})
</script>