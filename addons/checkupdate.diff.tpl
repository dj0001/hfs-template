[+]
<script>
if(location.search=='?update')
{
var ver=document.head.querySelector("[name=version]").content

fetch('https://dj0001.github.io/hfs-template/hfs-version.txt').then(response => response.text())
 .then(txt => alert((1*txt==ver?'No ':'')+'update') )
}
</script>