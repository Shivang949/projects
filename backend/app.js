const http = require('http');
const requestHandler = require('./test-post');

const server = http.createServer(requestHandler);

const PORT = 3001;
server.listen(PORT, () => {
    console.log('Server has started on address http://localhost:3001');
});


