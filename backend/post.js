let offers = [
    {title: '50% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '20% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '40% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '60% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '10% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '60% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '25% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '27% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '64% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '78% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '12% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
    {title: '67% off', desc: 'on ihcl', offerId: 'lll', url: 'abcabc'},
]

const cache = {};
const CACHE_TTL = 10 * 1000;
const express = require("express");
const app = express();

app.get("/", (req, res)=> {
    res.send("Server is running");
    }
);

app.use(express.json());
app.post('/offers', (req,res)=> {

    let finalOffer = req.body.offerId;
    let {page = 1, limit = 25} = req.query;
    const cacheKey = 'offers_${page}_${limit}_${offerId || "all"}';

    if (cache[cacheKey] && cache[cacheKey].expiry > Date.now()) {
        console.log('cache hit');
        return res.json(cache[cacheKey].data);
    }

    console.log('cache miss');

    let result = offers;

    if(finalOffer) {
        result = offers.filter(o=> o.offerId === finalOffer)
    }

    const startIndex = (page-1)*limit;
    const endIndex = page*limit;

    const finalResult = result.slice(startIndex, endIndex);

    cache[cacheKey] = {
        data: finalResult,
        expiry: Date.now() + CACHE_TTL
    };

    res.json(finalResult);
});




app.listen('3000', () => {
    console.log('Port 3000 is running');
    }
);