[+]
<script>
LOGIN.title='Login or Register'

if('%user%'=='admin') document.querySelector('.outbox ~ #pw').style.display=document.querySelector('.outbox ~ #LOGIN').style.display='block'  //admin panel

function login() { const allusr=true  //edit here
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
location.replace(document.referrer)} else {
if((allusr && !sessionStorage.reg||'%user%'=='admin') &&xhr.response=='username not found' && !pwd.match(/{\..*\|/) && confirm('register?')) {sessionStorage.reg=1; fetch('/~register?usr='+usr+'&pwd='+btoa(unescape(encodeURIComponent(pwd)))).then(res => alert(usr+',wait for enabled'))} else //
alert("user or password don't match");document.querySelector("#dia2 form").reset()}}
xhr.send(formData)
    return false;
}
</script>

[register|public]
{.new account|{.?usr.}|enabled={.if|{.%user%=admin.}|1|0.}|password={.base64decode|{.?pwd.}.}|notes=%timestamp%.}
