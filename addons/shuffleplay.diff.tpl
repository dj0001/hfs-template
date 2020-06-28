[+]
<script>
audio.onended = function() {
let B=[...document.querySelectorAll('.checked a:not([href$="/"])')], tmp=B.findIndex(o => o.href==audio.src); 
B[tmp].parentElement.classList.remove('checked')
B.splice(tmp, 1)
audio.src=B[Math.floor(Math.random()*B.length)].href; audio.play()
}
</script>
