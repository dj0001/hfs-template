[+]
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>
<script>  //or add the js to root https://github.com/Stuk/jszip/blob/master/dist/jszip.min.js  //Raw - Save as
const displace=1 //edit here

var ref=document.querySelector('#Archive')||archiveBtn
if(displace) ref.onclick=archive; else ref.oncontextmenu=function(){archive();return false}
var A=document.createElement("a"); A.download='selection.zip'; document.body.appendChild(A)

function archive(){
var it=document.querySelectorAll('.checked');
if(!it.length) it=document.querySelectorAll('.selector:checked')  //hfs2.4
if(!it.length || !confirm("Archive "+it.length+" file(s) ?")) return;
var zip=new JSZip(), c=it.length
it.forEach(item => {
 fetch((item.firstChild||item.parentNode)['href']).then(function(res)
  {res.blob().then(function(myBlob){zip.file(res.headers.get('content-disposition').match(/"(.+?)"/)[1], myBlob); c--; if(!c) save()})} );
})

function save(){
zip.generateAsync({type:"blob"})
.then(function(content) {navigator.msSaveOrOpenBlob? navigator.msSaveOrOpenBlob(content,"selection.zip"):A.href = URL.createObjectURL(content); A.click()})
 }
}
</script>
