[+]
<script>
/* for mobillight and hfs2.4beta*/
/*disable Use system icons*/
var style = document.createElement('style')
style.innerHTML = `
#files a::before {font: normal normal normal 16px/1 FontAwesome; color:black}
#files td a::before, body.dark-theme #files a::before {color:white} /*takeback*/

#files a[href$="/"]::before {content:"\\f07b  "} #files a[href$="/"]::before {color:orange}
a[href*="."]::before {content:"\\f016  "}
a[href*="://"]::before, a[href$=".htm"]::before  {content:"\\f0ac  "}
a[href$=".txt"]::before {content:"\\f0f6  "}
a[href$=".zip"]::before {content:"\\f1c6  "}

a[href$=".mp3"]::before, a[href$=".ogg"]::before {content:"\\f1c7  "} #files a[href$=".mp3"]::before {color:violet}
a[href$=".jpg"]::before, a[href$=".png"]::before {content:"\\f1c5  "}
a[href$=".mp4"]::before {content:"\\f1c8  "} #files a[href$=".mp4"]::before {color:green}

a[href$=".xls"]::before {content:"\\f1c3  "}
a[href$=".pdf"]::before {content:"\\f1c1  "} #files a[href$=".pdf"]::before {color:red}
a[href$=".doc"]::before {content:"\\f1c2  "}
img[src="/~img_file"], img[src="/~img_folder"] {display:none}
i.fa-clock, i.fa-logout { font-family: "fontello"; font-style: normal; font-weight: normal; } /*beta*/
`
document.head.appendChild(style)

var style = document.createElement('link')
style.rel='stylesheet'
style.href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'
document.head.appendChild(style)
</script>
