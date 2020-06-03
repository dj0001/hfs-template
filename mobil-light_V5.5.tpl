<!DOCTYPE html>
<html lang="en">
<head>
<meta charset=UTF-8 />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="version" content="5.5.6"/>
<meta name="Description" content="mobillight">
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="/icon.png">
<title>HFS %version%</title>
<style>
body {margin:8px 2%} /*background:#555*/
header {background:#555} /*#cde*/
/*main {background:#F1F1ED}*/
aside {padding: 1.33em 0}
a, li span:last-child, small {cursor: pointer; text-decoration: none}
li a[href$="/"]::before {content:"📁"}
li>div, aside, header {display: flex; flex-wrap: wrap; justify-content: space-between; font-family:Helvetica; width:100%}
li {display:flex; border-top: 1px solid #ddd}
li>div,img {padding: .3em 0}
li span {color:#757575}

a[href*="."]::before {content:"📄  "}
nav a[href*="."]::before {content:""}
a[href$=".mp3"]::before, a[href$=".ogg"]::before {content:"🎧  "}
a[href$=".jpg"]::before {content:"🌄"}
img+div a[href$=".jpg"]::before {content:""}
a[href$=".mp4"]::before {content:"🎞  "} /*🎬*/
a[href*="://"]::before, a[href$=".htm"]::before  {content:"🌎  "} /*🔗*/
a[href$=".comment"]::before {content:"💬  "}

.checked {background:#f5f5f5}
.check main div span:last-child::after {content:" \2610"} /*26aa*/
.check .checked span:last-child::after {content:" \2611"} /*26ab*/
nav {font-weight: bold}
a[href$="/"]:active {background:#c2c2c2}
.dark, .dark li a, .dark li span {background:#555; color:white}
.dark main {background:#505050}
@media (prefers-color-scheme: dark) {body, li a, li span, small a {background-color: #555; color: white}}
@media(min-width:480px) {#upload::after{content:" {.!Upload.}"} #Search::after{content:" {.!Search.}"} #Delete::after{content:" {.!Delete.}"} #Archive::after{content:" {.!Archive.}"} #Login>span:empty::after{content:" {.!Login.}"}} small::after{content:" {.!files.}"}
 #LOGIN::after{content:"{.!Login.}"} #Logout::after{content:"{.!Logout.}"} #cpw::after{content:"{.!Change password.}"}
/*{.comment|*/@media(min-width:480px) {#upload::after{content:" Upload"} #Search::after{content:" Search"} #Delete::after{content:" Delete"} #Archive::after{content:" Archive"} #Login>span:empty::after{content:" Login"}} small::after{content:" files"}
#LOGIN::after{content:"Login"} #Logout::after{content:"Logout"} #cpw::after{content:"Change password"}/*.}*/
 #cpw::before{content:"🔑 "} #Logout::before{content:"[➔ "}
#LOGIN,.outbox~#Logout,#pw,.outbox~#cpw {display:block;margin-top:13px} .outbox~#LOGIN,#Logout,.outbox~#pw,#cpw {display:none}
.outbox~#cb:not(:checked) {pointer-events:none}
#Login::after {content:""}
nav a:first-child::before {content:"\2302 "} 
nav a {color:#000; background:#cde; border-radius: .2em}
li a {-ms-hyphens:auto; -webkit-hyphens:auto; hyphens:auto}
nav a::after {content:"/"} /*" > "*/
/*button:disabled {display:none}*/
/*body:not(.check) #Delete {display:none}*/ 
header {position:-webkit-sticky; position:sticky; top:-20px} /*0px*/
header::before {content:"\1f30d HTTP File Server"; display:block; width:100%; text-align:center; color:#fff} /**/
/*a+span:not(:empty)::after{content:"B"}*/
form {display:inline-block}
li a+span {margin:0px 10px 0px auto}
@media(max-width:480px) {li span{margin-left:auto}}
ul {padding-left: 0px;}
small::before {content:"\1f552"}
.check small::before {content:"\2611"}
.err::before {background:rgba(255,0,0,0.5)}
#upload {width:74px; background-position:-74px; transition:none}
#upload.loading {transition: background-position .2s linear; background: no-repeat 0px linear-gradient(#cde,#cde), #f0f0f0}
img {image-orientation:from-image; object-fit:cover}
/*main a[href="thumb/"], main a[href="thumb/"]~* {display:none}*/
.gri li {display:inline-flex; overflow:hidden}
.gri li div,.gri header {display:none}
.gri li, .gri li>img {width:initial;height:initial;max-height:100vh}
html {scroll-snap-type: y proximity; overflow-y: scroll; scroll-padding-top: 24px}
li, aside {scroll-snap-align: start}
.notaccess::after {content:" ⚿"} /*🔒*/

#upload::before {content:"⇧"}
#Search::before {content:"⌕"}
#Delete::before {content:"X"}
#Login::before {content:"👤"}
#Archive::before {content:"⇩"}
</style>
<script src='/~sha256.js' defer></script>
</head>

<body>
<header><button id='upload' onclick="fileElem.click()" ondrop="event.preventDefault();sendFiles(event.dataTransfer.files)" ondragover="this.classList.add('loading');return false" title="&#x2196;&#x2261; &#x1f4c1;"></button>
<input type="file" id="fileElem" multiple hidden onchange="sendFiles(this.files)">
<button id='Search' aria-label="Search" title='sort by size' onclick="document.querySelector('dialog').showModal()"></button>
<dialog><form><input list='cat' type='search' placeholder='search...' name='qf'><input type='checkbox' checked title='subfolder'><button type="submit">&#x2315;</button></form> <button onclick='this.parentNode.close()'><sup>&times;</sup></button></dialog>
<datalist id='cat'><option value="*.jpg;*.png;*.gif">image</option><option value="*.mp3;*.ogg;*.m3u">audio</option><option value="*.mp4;*.webm;*.mkv">video</option><option value="*&sort=s&rev=1&">large files</option></datalist>
<button id='Delete' aria-label="Delete" onclick="del()"></button>
<button id='Login' aria-label="Login" onclick="if(parseFloat('%version%')<2.4) location='/~login'; else dia2.showModal()" title="&#x2196;&#x2261; ***"> <span>%user%</span></button>
<dialog id='dia2'><form><input name='user' required placeholder="Username" id='user' /><input name='password' type='password' required placeholder="Password" id='pw' /><button type="submit" id='LOGIN' aria-label="Login"><button id='Logout' onclick='logout()' hidden></button>
 Keep me loggedin<input type="checkbox" title='agree to use cookies' id='cb'><button   id='cpw'></button></form>
 <button onclick='this.parentNode.close()'><sup>&times;</sup></button></dialog>
<button id='Archive' aria-label="Archive" title='&#x2611' onclick='del("Archive ")'></button>
</header>
<aside><nav onclick="if(!reload) {get(event.target.getAttribute('href'));return false}"></nav><small id='sm' title="sort &#x2611&#xa;&#x2196;&#x2261; &#x263c;"><a href='javascript:void(0)'></a></small></aside>
<main id='files'><ul></ul></main>

<script>
const filemask='index.htm'; var thumbsize=64, tn=/\.jpg|\.png|\.gif/, reload=false, target='l', ondemand=false  //edit here |\/
if(parseFloat('%version%')<2.4) console.log('manual change [unauth] to [unauthorized] or add [unauthorized] to Diff template')  //!
if(ondemand) {thsize0=thumbsize; thumbsize=0}
var folder=location.pathname.match(/.*\//)[0], b, evt=new Event('render')

function urlvar(key) {return (location.search.slice(1).match(key+'=(.*?)(&|$)')||'')[1]}
function get(val,para){ folder=val; para=para||'';
var sm=document.querySelector('small')

fetch(folder+'~files.lst?'+(para?para:'sort='+(urlvar('sort')||'n'))).then(function(response) { if(response.status==403) {dia2.showModal();return}  //
if(response.body && typeof(TextEncoder)!='undefined') {
 var reader = response.body.getReader(), txt='';

 reader.read().then(function processResult(result) {
  if (result.done) {
   if(txt.match(filemask)) location=folder
   sm.classList.remove("err"); const co=txt.match(/.*$/)[0].slice(1).split(',');upload.disabled=!co[0];Delete.disabled=!co[1];
   return;
   }

 var decoder = new TextDecoder();
 txt += decoder.decode(result.value, {stream: true})
 render(m3utojson(txt))
 return reader.read().then(processResult)
 });
} else return response.text().then(txt => render(m3utojson(txt)))  //Edge<76
}).catch(error => sm.classList.add("err"));

}

get(folder)

function m3utojson(a) {
a=a.split(/\r?\n/);  b=[]
for (var i=1; i<a.length; i+=2) { b.push({url:a[i], modified:a[i-1].split(',')[0].slice(1,-3), size:a[i-1].split(/,0?/)[1],access:a[i-1].split(',')[2]}) }
return b
}

function render(a){ const th=a.some(o => o.url=='thumb/'), la=(navigator.connection||{}).type!="cellular" && 'loading' in HTMLImageElement.prototype  //&&false
var myTemplate=a.map(function(item) {
 return "<li>"+
 (thumbsize && (th||la||folder.endsWith("/thumb/")) && tn.test(item.url)? "<img src='"+folder+(th&&!document.body.classList.contains("gri")?"thumb/":"")+item.url+"' alt='thumb' loading='lazy' height='"+thumbsize+"' width='"+thumbsize+"'>":"")+
 "<div><a "+(item.access?'':'class=notaccess ')+"href=\'"+(item.url.slice(-1)=='/'?item.url+"\'":(item.url.match('://')?'':folder)+item.url+"\' target='"+target+"'")+">"+decodeURI(item.url).replace(/\/$/,'')+
 "</a><span>"+item.size+"</span><span> "+item.modified+"</span></div></li>"

 })
document.querySelector('ul').innerHTML=myTemplate.join('\n')
document.querySelector('nav').innerHTML=bcrumbs(folder); document.querySelector('small>a').innerHTML='&nbsp;'+a.length
if(typeof addon=='function') addon()  //
document.dispatchEvent(evt)
}

function bcrumbs(f) {
var path=f.split('/'), pt='', pr=''
for(var pta=0;pta<path.length-1;pta++) {pt+=path[pta]+'/'; pr+='<a href="'+pt+'">'+(decodeURI(path[pta])||'Home')+'</a>'}
return pr
}

document.querySelector('form').onsubmit = function(){get(folder,1*this[0].nextElementSibling.checked? "&search="+this[0].value:"&filter=*"+this[0].value+"*"); this.parentNode.close();return false}

var dia=document.querySelector('dialog'); if(!dia.showModal) poly(dia); if(!dia2.showModal) poly(dia2)
function poly(node) {node.showModal=function(){this.hidden=false};  node.close=function(){this.hidden=true};  node.setAttribute('open',''); node.hidden=true}  //mypoly

document.querySelector('main').onclick=function(e){var f=e.target; if(!reload&& f.tagName=='A' && !f.target &&!e.altKey) {get(folder+f.getAttribute('href'));return false} else
if(f.tagName=='SPAN'&&!f.nextSibling || f.tagName=='A'&&e.altKey) {f.parentNode.classList.toggle("checked");document.querySelector('small>a').innerHTML=document.querySelectorAll('.checked').length}
else if(f.tagName=='IMG') {document.body.classList.toggle("gri");f.scrollIntoView()}
else if(f.tagName=='A' && ['.mp3','.ogg','.m3u'].indexOf(f.getAttribute('href').slice(-4))+1) {e.preventDefault();
 if(f.getAttribute('href')==audio.getAttribute("src")) if(audio.paused) audio.play(); else audio.pause(); else {audio.src=f.getAttribute('href');audio.play()}}
else if(ondemand&&f.tagName=='A'&&f.href.endsWith('.jpg')) {thumbsize=thsize0;render(b)}  //
}

sm.oncontextmenu= function(e) {e.preventDefault(); document.body.classList.toggle("dark")}  //longtouch clock
sm.onclick= function() {if(document.querySelector('.check')) document.querySelectorAll('main div').forEach(it => it.classList.add('checked')); else get(folder,'&sort=t')}

upload.oncontextmenu= function() {var ref=document.querySelector('.checked')
 if(ref) {ref=ref.firstChild.text; var tmp=prompt("\u270E rename to",ref);if(tmp) fetch("/~rename?from="+folder+ref+"&to="+tmp).then(res => get(folder))} else  //
 {var tmp=prompt("new folder");if(tmp) fetch("/~mkdir?name="+folder+tmp).then(res => get(folder))}
 return false}
cpw.onclick=Login.oncontextmenu= function() {var tmp=prompt("new password"); if(tmp) location="/~changepwd?new="+tmp;return false}
</script>
<script>
function sendFiles(filesArray) { const limit=4295  //edit MB
var fd = new FormData(), tsize=0, d0=Date.now()
Array.from(filesArray).forEach(item => {if(item.size>limit*1e6) return; tsize+=item.size; fd.append('myFile', item, item.name)})
upload.style.transitionDuration = tsize/parseFloat(upload.title)+"ms"; upload.classList.add("loading")
fetch(folder,{method:'POST',body:fd}).then(response => {get(folder); upload.classList.remove("loading"); upload.title=(tsize/(Date.now()-d0)).toFixed()+' kb/s'})
}

function del(ar) {
var ref = document.querySelectorAll('.checked'), qstr=''
ref.forEach(item => qstr+='&'+(parseFloat('%version%')<2.4?'selection':'files')+'='+item.firstChild.getAttribute('href'))
if(!qstr) {document.querySelector('body').classList.toggle("check"); return}
if(!confirm((ar||"Delete ")+ref.length+" file(s) ?")) return
ct={"Content-type":"application/x-www-form-urlencoded"}; 
if(!ar) fetch(folder,{method:'POST',body:"action=delete"+qstr,headers:ct}).then(response => get(folder))
else fetch(folder+"?mode=archive&recursive",{method:'POST',body:qstr,headers:ct}).then(response => response.blob()).then(data =>{a.href=URL.createObjectURL(data);a.click()})
}
var a=document.createElement("a"); a.download='selection.tar'; document.body.appendChild(a)

var audio=new Audio()
audio.onended = function() {let B=[...document.querySelectorAll('.checked a:not([href$="/"])')], tmp=B.findIndex(o => o.href==audio.src); audio.src=B[(tmp+1)%B.length].href;audio.play()}
if ('mediaSession' in navigator) navigator.mediaSession.setActionHandler('nexttrack', audio.onended)

document.querySelector('#dia2 form').onsubmit = function(){login(); this.parentNode.close(); return false}
var sha256 = function(s) {return SHA256.hash(s)}

function login() {
  var sid = "{.cookie|HFS_SID_.}"  //getCookie('HFS_SID');
  if (!sid) return true;  //let the form act normally
  var usr = user.value;
  var pwd = pw.value;
var xhr = new XMLHttpRequest();
xhr.open("POST", "/?mode=login");  // /~login
var formData = new FormData();
formData.append("user",usr)
if (typeof SHA256 != 'undefined') formData.append("passwordSHA256",sha256(sha256(pwd).toLowerCase()+sid).toLowerCase()); else formData.append("password",pwd) 
xhr.onload=function(){if(xhr.response=='ok') {
 if(document.querySelector("#dia2 input[type=checkbox]").checked) localStorage.login=JSON.stringify([usr,pwd]); else localStorage.removeItem('login');  //
location.replace(document.referrer)} else {alert("user or password don't match");document.querySelector("#dia2 form").reset()}}
xhr.send(formData)
    return false;
}
function logout() {fetch("/?mode=logout").then(res => location.reload()); return false}
if('%user%') {user.placeholder="%user%"; user.classList.add("outbox")}
document.querySelector("#dia2 input[type=checkbox]").onchange=function(){if(!this.checked) localStorage.removeItem('login')}
if(localStorage.login) document.querySelector("#dia2 input[type=checkbox]").checked=true
if(!'%user%' && localStorage.login) {var tmp=JSON.parse(localStorage.login); user.value=tmp[0]; pw.value=tmp[1]; var myform=document.querySelector("#dia2 form"); if (myform.requestSubmit) myform.requestSubmit(); else myForm.submit()}
</script>
</body>
</html>

<footer hidden>
[not found]
<h1>Not found</h1><a href="/">&#x2302; Home</a>

[unauth]
<h1>Unauthorized</h1>
&#x26d4; wrong username or password

[special:import]
{.if not|{.exists|hfs.filelist.tpl.}|{:{.dialog|Add hfs.filelist.tpl from zip to folder, that contains hfs.exe.}:}.}

[overload]
<h1>Service Unavailable</h1>overloaded Retry later   

[mkdir]
{.mkdir|{.force ansi|{.?name.}.}.}

[changepwd]
{.if|{.member of|can change password.}|{:{.set account||password={.force ansi|{.?new.}.}.}:}.} {.redirect|./.}

[rename]
{.rename|{.force ansi|{.?from.}.}|{.force ansi|{.?to.}.}.}


[login]
<h1>Login</h1><a href="/~signin">&#x1f464; Login</a>

[template id]
mobillight 5.5.6

