const http = require('http');

const server = http.createServer((req, res) => {
    console.log(req.url, req.headers, req.method);
});

const PORT = 3001;
server.listen(PORT, () => {
    console.log('Server has started on address http://localhost:${PORT}');
});