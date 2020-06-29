[+]
<script>
//bgimage must have same name as folder and be in subfolder thumb; opt. add  |\/ to var tn
function bgimg(){
var ref = document.body  //document.querySelector('aside')
ref.style.background='top/cover no-repeat url("'+folder.replace(/(.*\/)(.*)\//,'$1thumb/$2')+'") fixed, url("/icon.png") no-repeat'
ref.style.backdropFilter='brightness(80%)' /* */
var tmp=folder.match(/(.*\/)(.*)\//); if(tmp) console.log('looking for "'+tmp[2]+'" image in "'+tmp[1]+'thumb/"')  //
}
document.addEventListener('render', bgimg)
</script>

[+]
<style>
/*main {background:#fff}*/
/*main a[href="thumb/"], main a[href="thumb/"]~* {display:none}*/
/*body.dark {background-color:#555 !important}*/
</style>