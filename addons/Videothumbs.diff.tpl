[+]
<script>
function videoth(){
let b=document.querySelectorAll('a[href$=".mp4"]')
b.forEach(item => {
 var vid=document.createElement("video")
 vid.style='object-fit:scale-down'  //cover
 vid.preload='metadata'
 vid.src=item.href
 vid.height='64'; vid.width='64'  //;vid.loading='lazy'
 vid.onloadedmetadata=function(){item.title =new Date(Math.ceil((this.duration-15)/60)*60000).toJSON().slice(12,-8)}  //14,-5  //this.title
 let ref=item.parentNode
 ref=ref.parentNode  //uncommend for takeback and V5.6
 ref.prepend(vid)
})
}; if(!document.querySelector('main')) videoth()  //hfs2.4
else document.addEventListener('render', videoth)  //mobil-light_V5.4

document.querySelector('#files').addEventListener("click", function(e){if(e.target.tagName=='VIDEO') {e.target.requestPictureInPicture();  //click icon
 var video=e.target
 video.onended = function() {let B=[...document.querySelectorAll('.checked a:not([href$="/"])')], tmp=B.findIndex(o => o.href==video.src); video.src=B[(tmp+1)%B.length].href;video.play()}
 if ('mediaSession' in navigator) navigator.mediaSession.setActionHandler('nexttrack', video.onended)
}})
</script>

[+]
<style>
/*
a[href$=".mp4"]::before {content:attr(title) ' '}
a[title='0:00']::before {content:"🎬 "} /*short clips (Reels)*/
*/
</style>
