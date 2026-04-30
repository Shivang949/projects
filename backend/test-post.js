const http = require('http');
const fs = require('fs');

const server = http.createServer((req, res) => {
    console.log(req.url, req.headers, req.method);

    if (req.url === '/') {
    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<head><title>My First Response</title></head>');
    res.write('<body><h1>Heyyy this is my first server code</h1>');
    res.write('<form action="/submit-details" method="POST">');
    res.write('<input type="text" name="username" placeholder="Enter your name"><br><br>')
    res.write('<lable for="male">Male</label>')
    res.write('<input type="radio" id="male" name="gender" value="male"><br>')
    res.write('<lable for="female">Femal</label>')
    res.write('<input type="radio" id="male" name="gender" value="female"><br><br>')
    res.write('<input type="submit" value="Submit">');
    res.write('</form>');
    res.write('</body>');
    res.write('</html>');
    return res.end();
    }

    else if (req.url.toLowerCase() === '/submit-details' && req.method ==="POST") {
        fs.writeFileSync('user.txt', 'Shivang Sharma');
        res.statusCode = 302;
        res.setHeader('Location', '/');
    }

    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<head><title>My First Response</title></head>');
    res.write('<body><h1>Heyyy this is my first server code</h1></body>');
    res.write('</html>');
    return res.end();

});

const PORT = 3001;
server.listen(PORT, () => {
    console.log('Server has started on address http://localhost:3001');
});