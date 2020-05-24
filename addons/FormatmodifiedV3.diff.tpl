[+]
<script>  //formatmodified for mobil-light.tpl V5.4
//use ISO Date Format in hfs
function format(){
var locales=''  //edit here  ''=auto
var options={ year: '2-digit', month: 'short', day: 'numeric' }  //edit here 
 //year, month, day, hour, minute, second  "numeric", "2-digit"; weekday  "narrow", "short", "long"
var newmin=180  //edit here minutes files flaged
var locales=locales||navigator.language  // urlvar('lang')||

var ref=document.querySelectorAll('li span:last-child')
if(!ref.length) ref=document.querySelectorAll('.item-ts')  //HFS2.4
if(!ref.length) ref=document.querySelectorAll('#files td:nth-child(2)')  //Throwback12
const iso=Date.parse(ref[0].textContent.trim()); if(!iso) return;
for (let el of ref)   {var tc=el.textContent.trim()
 var tmp=tc  //Date.parse(tc); if(!tmp) continue
 if(!window.matchMedia("(min-width: 480px)").matches) el.textContent = new Date(tmp).toLocaleString(locales, options)
 var dif=(Date.now()-new Date(tc))/60000; if(dif<newmin) el.textContent='\uD83C\uDD95'+el.textContent
 }
}
if(!document.querySelector('main')) format()  //hfs2.4
else document.addEventListener('render', format)  //mobil-light_V5.4
</script>