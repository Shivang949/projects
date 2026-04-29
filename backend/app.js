const name = 'Shivang'; // cannot change
let age = '25';
age = '26' // will work fine
//name = 'aaa' // will give the Type error
console.log(name);
console.log(age);


function myProject() {
    console.log('Hello guys');
}

myProject();

function project(name){
    console.log(name);
}

project('Ram');


function sum(a,b){
    console.log(a+b);
}

sum(2,3);


const offers = {
    title: '50% off', time: '2 Days'
}

console.log(offers.title);


let offers = [
    {title: '50% off', duration: 5, city: 'mumbai'},
    {title: '60% off', duration: 4, city: 'delhi'},
    {title: '40% off', duration: 5, city: 'delhi'},
    {title: '10% off', duration: 3, city: 'mumbai'},
]

offers.forEach(
    (offer)=>
        {console.log(offer.title);
    }
);

const titleOffer = offers.filter((offer)=> {return offer.city = 'mumbai'})

console.log(titleOffer)


