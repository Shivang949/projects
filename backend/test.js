const http = require('http');

const server = http.createServer((req, res) => {
    console.log(req.url, req.headers, req.method);

    if (req.url === '/'){
    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<head><title>My First Response</title></head>');
    res.write('<body><h1>Heyyy this is my first server code</h1></body>');
    res.write('</html>');
    return res.end();
    }else if (req.url === '/second') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>My Second Response</title></head>');
        res.write('<body><h1>Heyyy this is my Second server code</h1></body>');
        res.write('</html>');
        return res.end();
    } else if (req.url === '/third') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>My Third Response</title></head>');
        res.write('<body><h1>Heyyy this is my Third server code</h1></body>');
        res.write('</html>');
        return res.end();
    }
});

const PORT = 3001;
server.listen(PORT, () => {
    console.log('Server has started on address http://localhost:3001');
});