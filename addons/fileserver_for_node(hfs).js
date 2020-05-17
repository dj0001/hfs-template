var http = require('http');
var fs = require('fs');
var path = require('path');

http.createServer(function (request, response) {
console.log('request starting...');

function walkSync(currentDirPath, callback) {
    //var fs = require('fs'),
    //    path = require('path');
    fs.readdirSync(currentDirPath).forEach(function (name) {
        var filePath = path.join(currentDirPath, name);
        var stat = fs.statSync(filePath);
        if (stat.isFile()) {
            callback(filePath, stat);
        } else if (stat.isDirectory()) {
            ausgabe+="#"+stat.mtime+","+stat.size+"\n"+path.basename(filePath)+"/\n"  //walkSync(filePath, callback);  //filePath
            //console.log(name)
        }
    });
}

var ausgabe=""
var root='test/'  //edit here
var ufilePath = root + decodeURI(request.url); //console.log(request.url); 
ufilePath = ufilePath.replace('~files.lst?sort=n','')  //
if (decodeURI(request.url)=='/') ufilePath = root + 'mobil-light_V4.6.tpl'  //
var ustat = fs.statSync(ufilePath);
if (ustat.isDirectory()) {  
walkSync(ufilePath, function(filePath, stat) {  //path/to/root/dir  'test/'
//ausgabe+="<div><a href='"+path.basename(filePath)+"'>"+path.basename(filePath)+"</a> "+stat.size+" "+stat.mtime+"</div>"  //UO falsch!filePath
ausgabe+="#"+stat.mtime+","+stat.size+"\n"+path.basename(filePath)+"\n"  //UO falsch!filePath

});

response.writeHead(200, {'Content-Type': 'text/txt'});  //text/html
response.end(ausgabe)
}
else showfile(ufilePath)


function showfile(filePath) {
//var filePath = '.' + request.url;
//if (filePath == './')    filePath = './index.html';

var extname = path.extname(filePath);
var contentType = 'text/html';
switch (extname) {
    case '.js':
        contentType = 'text/javascript';
        break;
    case '.css':
        contentType = 'text/css';
        break;
    case '.json':
        contentType = 'application/json';
        break;
    case '.png':
        contentType = 'image/png';
        break;      
    case '.jpg':
        contentType = 'image/jpg';
        break;
    case '.wav':
        contentType = 'audio/wav';
        break;
}

fs.readFile(filePath, function(error, content) {
    if (error) {
        if(error.code == 'ENOENT'){
            fs.readFile('./404.html', function(error, content) {
                response.writeHead(200, { 'Content-Type': contentType });
                response.end(content, 'utf-8');
            });
        }
        else {
            response.writeHead(500);
            response.end('Sorry, check with the site admin for error: '+error.code+' ..\n');
            response.end(); 
        }
    }
    else {
        response.writeHead(200, { 'Content-Type': contentType });
        response.end(content, 'utf-8');
    }
});
}


}).listen(8080);
console.log('Server running at http://10.184.55.54:8080/');