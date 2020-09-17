[+]
<script>  //txtedit  disable Numberfiles
var ext='.comment'  //edit here '.m3u'
document.querySelector('#files').addEventListener('click', function(e){
if(!e.target.href||(!e.target.href.endsWith('.txt')&&!e.target.href.endsWith(ext))) return;  //disable single commentfile
if(e.target.parentNode.parentNode.lastChild.tagName=='TEXTAREA') return;
e.preventDefault()  //
var el=document.createElement('textarea')
fetch(e.target.href,{cache:"no-cache"}).then(res => {e.target.title=res.headers.get('Last-Modified'); res.text().then(txt => {el.value=txt; el.disabled=upload.disabled; if(txt.startsWith('http')) e.target.href=txt})})  //always UTF-8
el.style.width='100%'
e.target.parentNode.parentNode.style.display='block'
//e.target.parentNode.style.display='none'
e.target.parentNode.parentNode.append(el)

el.onchange=function(){fetch(e.target.href,{cache:"no-cache",method:'HEAD'}).then(res => {if(res.headers.get('Last-Modified')==e.target.title) newtxt(el.value,e.target.text); else console.log('another user has changed the file')})}  //editor

})

function newtxt(txt,name){
 var fd = new FormData(), item = new Blob([txt],{type:'text/plain'})
 fd.append('myFile', item, name)
 fetch(folder,{method:'POST',body:fd}).then(response => get(folder));
}

document.addEventListener('render', function(){document.querySelectorAll('a[href$="'+ext+'"]').forEach(el => el.click())})  //mobil-light_V5.4

//Delete.oncontextmenu=function(){var ref=document.querySelector('.checked'), tmp=prompt("new file",(ref?ref.firstChild.text:'new')+'.txt');if(tmp) newtxt('',tmp);return false}
//Delete.title='\u2196\u2261 +'
</script>
