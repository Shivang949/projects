const http = require('http');

const server = http.createServer((req, res) => {
    if (req.url === '/'){
    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<head><title>Myntra</title></head>');
    res.write('<body>');
    res.write('<div>');
    res.write('<span><b>MyApp</b></span>');
    res.write('<span style="float: right;">');
    res.write('<a href="/home">');
    res.write('<button>Home</button>');
    res.write('</a>');
    res.write('<a href="/mens">');
    res.write('<button>Mens</button>');
    res.write('</a>');
    res.write('<a href="/women">');
    res.write('<button>Women</button>');
    res.write('</a>');
    res.write('<a href="/kids">');
    res.write('<button>Kids</button>');
    res.write('</a>');
    res.write('<a href="/cart">');
    res.write('<button>Cart</button>');
    res.write('</a>');
    res.write('</span>');
    res.write('</div>');
    res.write('</body>');
    res.write('</html>');
    return res.end();
    }
    if (req.url === '/home') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>Home</title></head>');
        res.write('<body><h1>Welcome to Home Page</h1></body>');
        res.write('</html>');
        return res.end();
    }

    if (req.url === '/mens') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>Mens Page</title></head>');
        res.write('<body><h1>Welcome to Mens Page</h1></body>');
        res.write('</html>');
        return res.end();
    }

    if (req.url === '/women') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>Womens Page</title></head>');
        res.write('<body><h1>Welcome to Womens Page</h1></body>');
        res.write('</html>');
        return res.end();
    }

    if (req.url === '/kids') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>Kids</title></head>');
        res.write('<body><h1>Welcome to Kids Page</h1></body>');
        res.write('</html>');
        return res.end();
    }

    if (req.url === '/cart') {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write('<head><title>Cart</title></head>');
        res.write('<body><h1>Welcome to Cart Page</h1></body>');
        res.write('</html>');
        return res.end();
    }
    

    
});



server.listen(3001, ()=> {
    console.log('Server Url = https://localhost:3001');
});