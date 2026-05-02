const fs = require('fs');
const { json } = require('stream/consumers');

const userRequesrHandler = (req, res) => {
    console.log(req.url, req.headers, req.method);

    if (req.url=== '/') {
    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<head><title>My First Response</title></head>');
    res.write('<body><h1>Heyyy this is my first server code</h1>');
    res.write('<form action="/submit-details" method="POST">');
    res.write('<input type="text" name="username" placeholder="Enter your name"><br><br>')
    res.write('<lable for="male">Male</label>')
    res.write('<input type="radio" id="male" name="gender" value="male"><br>')
    res.write('<lable for="female">Female</label>')
    res.write('<input type="radio" id="male" name="gender" value="female"><br><br>')
    res.write('<input type="submit" value="Submit">');
    res.write('</form>');
    res.write('</body>');
    res.write('</html>');
    return res.end();
    }

    else if (req.url.toLowerCase() === '/submit-details' && req.method ==="POST") {

        const body = [];

        // reading the data chunk and pushing/storing the chunk in an array
        req.on('data', chunk => {
            console.log(chunk);
            body.push(chunk);
        });
        // on complete data flow process will concat the whole chunk and convert it in string form.
        // Now to parse the whole data decode the data using the UrlSearchParam.
        // Saving the decoded data in form of key value pair.
        req.on("end", ()=>{
            const finalData = Buffer.concat(body).toString();
            console.log(finalData);
            const param = new URLSearchParams(finalData);
            // const bodyObject = {};
            // for (const [key, val] of param.entries()) {
            //     bodyObject[key] = val;
            // }
            const bodyObject = Object.fromEntries(param);
            console.log(bodyObject);
            fs.writeFileSync('user.txt', JSON.stringify(bodyObject));

        });
        res.statusCode = 302;
        res.setHeader('Location', '/');
    }

    res.setHeader('Content-Type', 'text/html');
    res.write('<html>');
    res.write('<head><title>My First Response</title></head>');
    res.write('<body><h1>Heyyy this is my first server code</h1></body>');
    res.write('</html>');
    return res.end();

};

module.exports = userRequesrHandler;