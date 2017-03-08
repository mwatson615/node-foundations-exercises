#!/usr/bin/env node

// Create a JavaScript file to act as a Node.js program named args.js. This program should accept at least one number as a command-line argument. The arguments should be summed up into a single value.

// Don't worry about floating point rounding errors.

let [,, ...args] = process.argv;

const numbers = args.map(function(num) {
	return num * 1;
});

const getResults = () => {
 	let results = numbers.reduce(function(acc, val) {
 	return acc + val;
 }, 0);
 console.log(results)
};
getResults();
