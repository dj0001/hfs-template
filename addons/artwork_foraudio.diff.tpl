[+]
<script>  //artwork must have same name and be in subfolder thumb
if ('mediaSession' in navigator) {  //chrome
audio.addEventListener("ended", art)
audio.addEventListener("play", art)
function art() {var tmp=decodeURI(audio.src).match(/.*\/(.*)\/([^-]+.)(.*)\./); navigator.mediaSession.metadata = new MediaMetadata({artist: tmp[3]?tmp[2]:tmp[1], title: tmp[3]||tmp[2] ,artwork: [{src: audio.src.replace(/.*\//,'$&thumb/'), sizes:'128x128', type:'image/png'}]})}  //128px
navigator.mediaSession.setActionHandler('previoustrack', function() {var tmp=b.findIndex(o => folder+o.url==audio.getAttribute("src")); audio.src=folder+b[tmp-1].url;audio.play()})
} else document.body.onkeydown=function(e) {if(e.key=='MediaPlayPause') if(audio.paused) audio.play(); else audio.pause()}
tn=/\.jpg|\.png|\.gif|\.mp3|\.ogg/
</script>