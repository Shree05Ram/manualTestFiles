var http = require ('http');

http.createServer(function(req,res){
	    res.writeHead(200, {'content-type': 'text/html'});
	    res.end('Helllo World1 from 192.168.1.36');
}).listen(1996);
