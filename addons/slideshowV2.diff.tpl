[+]
<script>  //rightclick for play, pagedown(space) for next
var t
document.querySelector('#files').addEventListener("contextmenu", function(e){if(e.target.tagName=='IMG') {e.preventDefault();play()}});

function play(){ const reload=true, dur=5  //edit here ?dur in s
 if(t) {clearInterval(t);t=0;document.documentElement.style=''} else {document.documentElement.style.scrollPaddingTop='0px';
 t=setInterval(function(){if((window.innerHeight+window.scrollY)>=document.body.offsetHeight) {if(reload) get(folder);window.scrollTo(0,60)} else window.scrollBy({left:0,top:window.innerHeight,behavior:'smooth'})},dur*1000) } 
}

document.querySelector('#files').addEventListener("click", function(e){if(t) play()})
</script>