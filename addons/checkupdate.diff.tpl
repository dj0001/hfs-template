[+]
<script>
if(location.search=='?update' || location.host=='localhost' && !sessionStorage.upd)
{
sessionStorage.upd=1  //
var ver=document.head.querySelector("[name=version]").content

fetch('https://api.github.com/repos/dj0001/hfs-template/releases').then(response => response.json())
 .then(txt => { if (txt[0].tag_name==ver) console.log('No update'); else if (confirm('update'))  location='https://github.com/dj0001/hfs-template/releases/latest' } )
}
</script>
