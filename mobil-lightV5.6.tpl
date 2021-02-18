[|no list]
<!DOCTYPE html>
<html lang="en">
<head><meta charset=UTF-8 /><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Description" content="5.6.5">
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="/icon.png">
<title>HFS %version%</title>
<!-- <base target="l"> -->
<style>
nav a::after {content:"/"} /*" > "*/
aside span {margin-left:10px; cursor: default}
nav {margin-bottom:10px; display:inline-block}
.notaccess::after {content:" ⚿"} /*display:none*/
nav a[href$="/"]::before {content:""}
main div, nav {padding: .3em 0; transition: background .5s}
.checked {background:#f5f5f5}
.checked span:last-child::after {content:" ☑"}/**/
main span:last-child {cursor:default} /*main span:last-child::after {content:" ☐"}*/
img {height:72px}  /*max 288*/
/*button:disabled {display:none}*/
/*main a[href$="thumb/"], main a[href$="thumb/"]~* {display:none}*/
#upload {width:74px; background: no-repeat 0px linear-gradient(#cde,#cde), #f0f0f0}
nav+span:active::after {content:"🕒"}
aside span::before {content:attr(data-before)" "}

body {font-family:Helvetica; margin:8px 2%}
aside {display:flex; justify-content:space-between} /*main div, */
a {text-decoration: none}
header {position:sticky; top:0px; margin-bottom:4px}
.dark, .dark a {color:white} .dark {background:#555} .dark .checked, .dark.sticknav aside {background:#1a73e9}
a:focus {border:1px solid black} /*main a[href$="/"]::after {content:""; display: inline-block;} a[href$="/"]:focus::after {transform: rotate(360deg); transition:transform 60s linear; content:"🕛"}*/
button {background:#cde; border-radius:2px; border:0; margin:2px} button:hover {opacity:.9}
.grid main div {display:inline-grid;  margin:1%} .grid main a+span {grid-column:2}
.sticknav {display:flex; flex-direction:column} .sticknav aside {order:-1; position:sticky; top:0; background:#f5f5f5} .sticknav header {position:initial}

main div {display:grid; border-top: 1px solid #ddd}
img {grid-row: 1 / span 2}
main img+a {grid-column:2/span 2}
main a {grid-column:1/span 2; hyphens:auto}
main span:last-child {justify-self: end; margin-left:10px}

@media(min-width:1024px) { main a+span {grid-column:3} main a:first-child~span:last-child {grid-column:4} main div {grid-template-columns:auto auto auto max-content} main span {justify-self:end} }

a[href*="."]::before {content:"📄 "}
a[href*="://"]::before, a[href$=".htm"]::before, a[href$=".URL"]::before {content:"🌎  "}
a[href$="/"]::before {content:"📁\FE0E  "; color:orange}
a[href$=".png"]::before {content:"🌄 "}
a[href]:nth-child(2)::before {content:""}
a[href$=".mp3"]::before, a[href$=".ogg"]::before {content:"🎧  "}
a[href$=".mp4"]::before {content:"🎞 "} /*🎬*/
a[href$=".txt"]::before {content:"📝  "}

#upload::before {content:"⇧"}
#Search::before {content:"⌕"}
#Delete::before {content:"X"}
#Login::before {content:"👤"}
#Archive::before {content:"⇩"}
</style>
</head>

<body>
<header><button id='Search' onclick="dia.showModal()">Search</button><button id='Login'>Login</button><button id='upload' onclick="fileElem.click()">Upload</button><button id='Delete' onclick="del()">Delete</button><button id='Archive' onclick="del(1)">Archive</button></header>
<input type="file" id="fileElem" multiple hidden onchange="sendFiles(this.files)">
<dialog id='dia'><form><input list='cat' type='search' placeholder='newfolder.../' name='qf'><input type='checkbox' checked>📁&#xfe0e;<button type="submit">⌕</button></form></dialog>
<datalist id='cat'><option value="*.jpg;*.png;*.avif">🌄 images</option><option value="*.mp3;*.ogg">🎧  audios</option><option value="*.mp4;*.webm;*.mkv">🎞 videos</option><option value="*&sort=!s&">large files</option></datalist>
<a id='a' download="selection.tar"></a>
<aside><nav></nav><span id='nfiles' title='sort ☑&#xa;↖≡ ☼'>files</span></aside>

<main id='files'></main>

<script>
var reload=false, sticknav=true, dark=false, lang, dateopt  //edit here
var folder=location.pathname, ct={"Content-type":"application/x-www-form-urlencoded"} , evt=new Event('render'), sortdesc
if(sticknav) document.body.classList.add('sticknav'); if(dark) document.body.classList.add('dark')  //
get(folder)

function get(a,para){
folder=a
fetch(a+'~files.lst?'+(para||location.search.slice(1)||'sort=n'))  //Add hfs.filelist.tpl from zip to folder, that contains hfs.exe
 .then(response => {if(response.status==403) location='/~login'; return response.text()})
 .then(text => render(text))
}

function render(a){
 a=a.split(/\r?\n/)
 let myTpl=[]; a.forEach((item,index,arr) => {
  if(item=='index.htm') location=folder  //filemask
  if(item && !item.startsWith('#')) {let items=arr[index-1];
  let Item={modified:'', size:'', access:1}
  Item.url=(item.includes('//')?'':folder)+item
  Item.name=decodeURI(item)  //.replace(/\/$/,'')  //(item.replace(location.origin,'').replace(new RegExp("\\^"+folder),''))
  if(items&&items.startsWith('#')) {Item.modified=items.split(',')[0].slice(1,-3); if(lang && Date.parse(Item.modified)) Item.modified=new Date(Item.modified).toLocaleString(lang,dateopt)  //ISO
   Item.size=items.split(/,0?/)[1]; Item.access=items.split(',')[2]}
  myTpl.push(file(Item))
  }})
 if(folder.endsWith('/images/')) document.body.classList.add('grid'); else document.body.classList.remove('grid')  //
 document.querySelector('main').innerHTML=myTpl.join('\n')  //%list%
 document.querySelector('nav').innerHTML=bcrumbs(folder)
 nfiles.setAttribute('data-before',myTpl.length)  //number items
 upload.disabled=!a[a.length-1].split(/#|,/)[1]  //
 document.dispatchEvent(evt)  //addons
}

document.querySelector('nav').onclick=document.querySelector('main').onclick=function(e){if(!reload && e.target.tagName=='A' && e.target.href.endsWith('/')) {get(e.target.pathname); return false}  //folder
 else if(e.target.tagName=='SPAN') {e.target.parentNode.classList.toggle('checked'); nfiles.setAttribute('data-before','☑'+document.querySelectorAll('.checked a').length); document.body.classList.remove('sticknav')}
}

function bcrumbs(f) {
var path=f.split('/'), pt='', pr=''
for(var pta=0;pta<path.length-1;pta++) {pt+=path[pta]+'/'; pr+='<a href="'+pt+'">'+(decodeURI(path[pta])||'🏠&#xfe0e;')+'</a>'}
return pr
}

Login.onclick=function(){location='/~login'}

document.querySelector('form').onsubmit = function(){ let from=document.querySelector('.checked a')
if(this[0].value.endsWith('/')) fetch(folder+'?mode=section&id=ajax.mkdir',{method:'POST',body:'token={.cookie|HFS_SID_.}&name='+this[0].value.slice(0,-1),headers:ct}).then(res => get(folder)); else
if(from&&confirm('rename from '+from.text+' ?')) {
 fetch(folder+'?mode=section&id=ajax.rename',{method:'POST',body:'token={.cookie|HFS_SID_.}&from='+from.text+'&to='+this[0].value, headers:ct}).then(res => get(folder))
} else
get(folder,1*this[0].nextElementSibling.checked? "&search="+this[0].value:"&filter=*"+this[0].value+"*")
dia.close()
return false
}

function sendFiles(filesArray) { const limit=4295  //edit MB
var fd = new FormData();
[...filesArray].forEach(item => {if(item.size>limit*1e6) return; fd.append('myFile', item, item.name)})
var xhr=new XMLHttpRequest()
xhr.open('POST',folder)
xhr.upload.onprogress=function(e){upload.style.backgroundPosition=e.loaded/e.total*74-74+'px'}
xhr.send(fd)
xhr.onload=function(){get(folder)}
}

function del(p) {
let ref=document.querySelectorAll('.checked a'), qstr='';
[...ref].forEach(item =>qstr+='&selection='+item.pathname)
if(!qstr || !confirm((p?"Archive ":"Delete ")+ref.length+" file(s) ?")) return
if(!p) fetch(folder,{method:'POST',body:"action=delete"+qstr,headers:ct}).then(res => get(folder))
else fetch(folder+"?mode=archive&recursive",{method:'POST',body:qstr,headers:ct}).then(res => res.blob()).then(data =>{a.href=URL.createObjectURL(data);a.click()})
}

nfiles.onclick=function(){if(document.querySelector('.checked')) [...document.querySelectorAll('main div')].forEach(item => item.classList.add('checked'))
else {get(folder,'&sort='+(sortdesc?'!':'')+'t'); sortdesc=!sortdesc}
}

if(!dia.showModal) {dia.showModal=function(){this.hidden=false};  dia.close=function(){this.hidden=true};  dia.setAttribute('open',''); dia.hidden=true}  //mypoly

if('%user%' && '%user%' != '%'+'user%') Login.textContent='%user%'

upload.ondrop=(e)=>{e.preventDefault();sendFiles(e.dataTransfer.files)}; upload.ondragover=()=>{return false}  //

if(window.matchMedia('(prefers-color-scheme:dark)').matches) document.body.classList.add('dark')  //
nfiles.oncontextmenu=function(){document.body.classList.toggle("dark"); return false}

function file(item){ let tmp=  //[file]
`<div>${item.url.endsWith('.jpg')?`<img loading="lazy" alt="🌄" src=${item.url}?mode=thumb>`:''}<a ${item.access?'':'class=notaccess'} href="${item.url}">${item.name}</a><span>${item.size}</span><span>${item.modified}</span></div>`  //edit here
return tmp
}
</script>
</body>

<footer hidden>
[api level]
2

[login|public]
<h1>{.!Login required.}</h1>
<a href="/">⌂ Home</a>
<script>
if(!'%user%') showLogin({ closable:false }); else showAccount()
</script>

[unauth=unauthorized]
<h1>Unauthorized</h1>
⛔ wrong username or password

