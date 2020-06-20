[+]
<script>  //Copyright 2019 dj  ,License BSD 2-Clause
var thumbsize=0  //mobillightV5

function imgth(){
let b=document.querySelectorAll('a[href$=".jpg"]')
b.forEach(item => {
 var vid=document.createElement("img")
 vid.style='object-fit:scale-down'
 vid.height='64'; vid.width='64'  //;vid.loading='lazy'
 vid.alt='nothumb'
 thumb(item)
 item.parentNode.parentNode.prepend(vid)
})

function thumb(item) {
fetch(item,{method:'GET',headers:{"Range":"bytes=0-65536"}}).then(response => response.arrayBuffer()).then(data =>
 {var array=new Uint8Array(data), start, end;
 for (var i = 2; i < array.length; i++) {if (array[i] == 0xFF) {if (!start) {if (array[i+1] == 0xD8) start=i} else {if (array[i+1] == 0xD9) {end=i;break}}}}
 var blob=new Blob([array.subarray(start||0, end||array.length)], {type:"image/jpeg"});  //0 progressive
 item.parentNode.parentNode.firstChild.src=window.URL.createObjectURL(blob);
 })
}

}; if(!document.querySelector('main')) imgth()  //hfs2.4
else document.addEventListener('render', imgth)  //mobil-light_V5.4

</script>