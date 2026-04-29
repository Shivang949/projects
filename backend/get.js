const express = require('Express');
const app = express();

app.get("/", (req,res) => {
    res.send("Server is running");
});

app.listen(3000, () => {
    console.log("Server running on port 3000");
});


let offers = [
  { title: "50% OFF", price: 500 },
  { title: "Buy 1 Get 1", price: 300 }
];

app.get("/offers", (req, res) => {
    res.json(offers);
})

app.get('/offers', (req, res) => {
    let finalOffer = req.query.offerId;
    let result = offers;
    if (finalOffer) {
        result = offers.filter(o => o.offerId == finalOffer);
    }

    res.json(result);
});

app.listen('3000', () => {
    console.log('Port 3000 is running');
    }
);