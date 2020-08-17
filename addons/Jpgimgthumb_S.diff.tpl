[+]
<script>
var jpgimgth=true  //edit here
var thumbsize=0  //mobillightV5

function imgth(){
let b=document.querySelectorAll('a[href$=".jpg"]')
b.forEach(item => {
 var vid=document.createElement("img")
 vid.style='object-fit:scale-down'  //cover
 vid.height='64'; vid.width='64' ;vid.loading='lazy'
 vid.alt='nothumb'
 vid.src=item.href+(jpgimgth?'?mode=thumb':'');  //item.href.replace(/(.*\/)(.*)/,'$1thumb/$2')
 //vid.onerror=function(){this.onerror=null; this.src=item.href}
 let ref=item.parentNode
 ref=ref.parentNode  //uncommend for takeback (and hfs2.4)
 ref.prepend(vid)
 })

}; if(!document.querySelector('main')) imgth()  //hfs2.4
else document.addEventListener('render', imgth)  //mobil-light_V5.5

</script>
