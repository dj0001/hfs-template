[crypto.js|no log|template=mobillight 5.5.*]
{.mime|application/javascript.}
{.add header|Cache-Control: public, max-age=86400.}
/* only for mobillight V5.5 */
// from https://github.com/AndersLindman/SHA256
SHA256={K:[1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298],Uint8Array:function(r){return new("undefined"!=typeof Uint8Array?Uint8Array:Array)(r)},Int32Array:function(r){return new("undefined"!=typeof Int32Array?Int32Array:Array)(r)},setArray:function(r,n){if("undefined"!=typeof Uint8Array)r.set(n);else{for(var t=0;t<n.length;t++)r[t]=n[t];for(t=n.length;t<r.length;t++)r[t]=0}},digest:function(r){var n=1779033703,t=3144134277,e=1013904242,a=2773480762,i=1359893119,o=2600822924,A=528734635,f=1541459225,y=SHA256.K;if("string"==typeof r){var v=unescape(encodeURIComponent(r));r=SHA256.Uint8Array(v.length);for(var g=0;g<v.length;g++)r[g]=255&v.charCodeAt(g)}var u=r.length,h=64*Math.floor((u+72)/64),l=h/4,s=8*u,d=SHA256.Uint8Array(h);SHA256.setArray(d,r),d[u]=128,d[h-4]=s>>>24,d[h-3]=s>>>16&255,d[h-2]=s>>>8&255,d[h-1]=255&s;var S=SHA256.Int32Array(l),H=0;for(g=0;g<S.length;g++){var c=d[H]<<24;c|=d[H+1]<<16,c|=d[H+2]<<8,c|=d[H+3],S[g]=c,H+=4}for(var U=SHA256.Int32Array(64),p=0;p<l;p+=16){for(g=0;g<16;g++)U[g]=S[p+g];for(g=16;g<64;g++){var I=U[g-15],w=I>>>7|I<<25;w^=I>>>18|I<<14,w^=I>>>3;var C=(I=U[g-2])>>>17|I<<15;C^=I>>>19|I<<13,C^=I>>>10,U[g]=U[g-16]+w+U[g-7]+C&4294967295}for(var K=n,b=t,m=e,M=a,R=i,j=o,k=A,q=f,g=0;g<64;g++){C=R>>>6|R<<26,C^=R>>>11|R<<21;var x=q+(C^=R>>>25|R<<7)+(R&j^~R&k)+y[g]+U[g]&4294967295,w=K>>>2|K<<30;w^=K>>>13|K<<19;var z=K&b^K&m^b&m,q=k,k=j,j=R,R=M+x&4294967295,M=m,m=b,b=K,K=x+((w^=K>>>22|K<<10)+z&4294967295)&4294967295}n=n+K&4294967295,t=t+b&4294967295,e=e+m&4294967295,a=a+M&4294967295,i=i+R&4294967295,o=o+j&4294967295,A=A+k&4294967295,f=f+q&4294967295}var B=SHA256.Uint8Array(32);for(g=0;g<4;g++)B[g]=n>>>8*(3-g)&255,B[g+4]=t>>>8*(3-g)&255,B[g+8]=e>>>8*(3-g)&255,B[g+12]=a>>>8*(3-g)&255,B[g+16]=i>>>8*(3-g)&255,B[g+20]=o>>>8*(3-g)&255,B[g+24]=A>>>8*(3-g)&255,B[g+28]=f>>>8*(3-g)&255;return B},hash:function(r){var n=SHA256.digest(r),t="";for(i=0;i<n.length;i++){var e="0"+n[i].toString(16);t+=2<e.length?e.substring(1):e}return t}};

//function sha256(s) { return SHA256.hash(s) }
var sha256 = function(s) {return SHA256.hash(s)}