[+]
<style>
header {background:#1a73e9}
.checked {background:#e8f0fd}
.check main div span:last-child::after {content:"  ◯"}
.check .checked span:last-child::after {color: #fff;background: #1a73e9;border-radius: 50%;content: ' ✔'}
</style>

[+]
<script>
/*
//longtouch to select
document.querySelector('main').addEventListener('contextmenu', function(e){
 if(window.matchMedia("(min-width: 480px)").matches) return  //
 e.preventDefault(); e.target.parentElement.style.userSelect = "none"
 e.target.parentElement.querySelector('li span:last-child').click()
 document.body.classList.add("check")  //
})
*/
</script>
