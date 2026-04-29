function outer() {
    let count = 0;
    return function inner() {
        count++;
        return count;
    };
}

let counter = outer();
console.log(counter());
console.log(counter());

function abc() {
    count = 0;
    count++;
    return count;
}

let counters = abc();
console.log(counters());
console.log(counters());


// Closure concept :-
// A function is able to remember and access variables from its outer scope,
// even after that outer function has finished executing.
// So it’s not just “function inside function” -
// it’s function + memory of its environment.


// A closure is a function that retains access to its lexical scope
// even after the parent function has executed. It allows us to maintain private state
// and build powerful abstractions like caching, debouncing, and React hooks.
