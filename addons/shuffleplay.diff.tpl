[+]
<script>
audio.onended = function() {
let B=[...document.querySelectorAll('.checked a:not([href$="/"])')], tmp=B.findIndex(o => o.href==audio.src); 
B[tmp].parentElement.classList.remove('checked')
B.splice(tmp, 1)
audio.src=B[Math.floor(Math.random()*B.length)].href; audio.play()
}

audio.onerror=function() {if(audio.getAttribute("src").slice(-4)=='.m3u') fetch(audio.getAttribute("src")).then(res => res.text().then(txt => {audio.src=txt; audio.play()}));
 else audio.onended()}

audio.onloadedmetadata=function() {document.querySelector('a[href="'+this.getAttribute("src")+'"]').title=new Date(audio.duration*1000).toJSON().slice(14,-5)}
</script>
