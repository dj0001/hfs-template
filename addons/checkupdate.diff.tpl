[+]
<script>
if(location.search=='?update')
{
var ver=document.head.querySelector("[name=version]").content

fetch('https://api.github.com/repos/dj0001/hfs-template/releases').then(response => response.json())
 .then(txt => alert((txt[0].tag_name==ver?'No ':'')+'update') )
}
</script>
