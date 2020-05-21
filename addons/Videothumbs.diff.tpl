[+]
<script>
function videoth(){
let b=document.querySelectorAll('a[href$=".mp4"]')
b.forEach(item => {
 var vid=document.createElement("video")
 vid.style='object-fit:scale-down'
 vid.preload='metadata'
 vid.src=item.href
 vid.height='64'; vid.width='64'  //;vid.loading='lazy'
 vid.onloadedmetadata=function(){this.title=new Date(this.duration*1000).toJSON().slice(14,-5)}  //
 item.parentNode.parentNode.prepend(vid)
})
}; if(!document.querySelector('main')) videoth()  //hfs2.4
else document.addEventListener('render', videoth)  //mobil-light_V5.4
</script>