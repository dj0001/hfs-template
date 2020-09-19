[+]
<script>  //txtedit  disable Numberfiles
var ext='.comment'  //edit here '.m3u'
document.querySelector('#files').addEventListener('click', function(e){
if(!e.target.href||(!e.target.href.endsWith('.txt')&&!e.target.href.endsWith(ext))) return;  //disable single commentfile
if(e.target.parentNode.parentNode.lastChild.tagName=='TEXTAREA') return;
e.preventDefault()  //
var el=document.createElement('textarea')
fetch(e.target.href,{cache:"no-cache"}).then(res => {
 res.text() .then(txt => {el.value=txt; el.disabled=upload.disabled; if(txt.startsWith('http')) e.target.href=txt})  //always UTF-8
 el.onchange=function(){
 fetch(e.target.href,{cache:"no-cache",method:'HEAD'}).then(resp => {
 if(resp.headers.get('Last-Modified')==res.headers.get('Last-Modified'))  //
 newtxt(el.value,e.target.text);
 else {fetch(e.target.href,{cache:"no-cache"}).then(resp => {resp.text().then(txt => newtxt(el.value.match(/.*/)[0]+'\n'+txt,e.target.text) )}) }  //add first (.*$ last) line
 })
 };  //editor
})
el.style.width='100%'
e.target.parentNode.parentNode.style.display='block'
//e.target.parentNode.style.display='none'
e.target.parentNode.parentNode.append(el)

})

function newtxt(txt,name){
 //txt=txt.replace(/^:/,'%timestamp% %user%:')  //: groupchat
 var fd = new FormData(), item = new Blob([txt],{type:'text/plain'})
 fd.append('myFile', item, name)
 fetch(folder,{method:'POST',body:fd}).then(response => get(folder));
}

document.addEventListener('render', function(){document.querySelectorAll('a[href$="'+ext+'"]').forEach(el => el.click())})  //mobil-light_V5.4

//Delete.oncontextmenu=function(){var ref=document.querySelector('.checked'), tmp=prompt("new file",(ref?ref.firstChild.text:'new')+'.txt');if(tmp) newtxt('',tmp);return false}
//Delete.title='\u2196\u2261 +'
</script>
