[+]
<script>  //txteditV2  disable Numberfiles
var ext='.comment'  //edit here '.m3u'
var folder,get; folder=folder||%folder%; get=get||function(){location.reload()}  //hfs2.4, takeback

document.querySelector('#files').addEventListener('click', function(e){
if(!e.target.href||(!e.target.href.endsWith('.txt')&&!e.target.href.endsWith(ext))) return;  //disable single commentfile
if(e.target.parentNode.parentNode.lastChild.isContentEditable) return;
e.preventDefault()  //
var el=document.createElement('div')
fetch(e.target.href,{cache:"no-cache"}).then(res => {
 res.text() .then(txt => {el.innerHTML=txt; if(txt.startsWith('http')) e.target.href=txt})  //always UTF-8  ; el.disabled=upload.disabled
 el.onblur=function(){
 fetch(e.target.href,{cache:"no-cache",method:'HEAD'}).then(resp => {
 if(resp.headers.get('Last-Modified')==res.headers.get('Last-Modified'))  //
 newtxt(el.innerHTML,e.target.text.trim());
 else {fetch(e.target.href,{cache:"no-cache"}).then(resp => {resp.text().then(txt => newtxt(el.innerHTML.match(/.*/)[0]+'\n'+txt,e.target.text.trim()) )}) }  //add first (.*$ last) line
 })
 };  //editor
el.onkeydown=function(e){if(!document.getSelection().toString()) return;  let cn={b:'bold', i:'italic', u:'underline'}; return !document.execCommand(cn[e.key]);  }  //select+b
})
el.style='width:100%; resize:both; overflow:auto; white-space:pre; border:1px solid gray; display:block'
el.setAttribute('contenteditable','true')  //if(%user%')   //if(!upload.disabled)
e.target.parentNode.parentNode.style.display='block'
//e.target.parentNode.style.display='none'
e.target.parentNode.parentNode.append(el)
})
function newtxt(txt,name){
 //txt=txt.replace(/^:/,'%timestamp% %user%:')  //: groupchat
 //txt=txt.replace('<3','❤').replace(':)','☺').replace(':(','☹')
 txt=txt.replace(/(?<!")(https?:\/\/)([^ <]+)/g,'<a href="$1$2">$2<\/a>')
 txt=txt.replace(/&lt;(\/)?([bisu])&gt;/g,'<$1$2>')  //<b>x</b>
 var fd = new FormData(), item = new Blob([txt],{type:'text/plain'})
 fd.append('myFile', item, name)
 fetch(folder,{method:'POST',body:fd}).then(response => get(folder));
}
document.addEventListener('render', function(){document.querySelectorAll('a[href$="'+ext+'"]').forEach(el => el.click())})  //mobil-light_V5.4
//Delete.oncontextmenu=function(){var ref=document.querySelector('.checked'), tmp=prompt("new file",(ref?ref.firstChild.text:'new')+'.txt');if(tmp) newtxt('',tmp);return false}
//Delete.title='\u2196\u2261 +'
</script>
