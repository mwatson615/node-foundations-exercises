#!/usr/bin/env node  
// when ^^^ gets read, it says to run in node environment
// ^^^is called a "shebang"? 



// Requirements

// Create a file called cheer.js that performs a cheer, using a named passed to it. Use as many of these as you can, even if the code you write isn't as compact or 'efficient' as you would like. This is more about trying out some ES6 than being succinct.

// const and/or let
// Object literal shorthand
// Destructuring assignments
// Fat arrow function(s)
// Spread operator
// Template literals
// Execute the file by typing node cheer.js inside the file's directory.



const person = {
	firstName: 'JOHN',
	lastName: 'DOE'
}

// let personName = {firstName, lastName}

const {firstName, lastName} = person
let firstArray = firstName.split("");
let secondArray = lastName.split("");

const cheerName = () => {
[...firstArray, ...secondArray].forEach((letter) => {
	let conj = 'aeioufhlmnrsx'.includes(letter.toLowerCase()) ? 'an' : 'a';
	console.log('Gimme ' + conj + ' ' + letter.toUpperCase() + "!")
})
console.log("What's that spell?")
console.log(firstName + " " + lastName)
}
// let a = "a";
// let an = "an"

// const cheerName = () => {
// 	for (let letter of fullName) {
// 		if (letter === "O" | letter ===) {

// 			console.log(letter)
// 		}
// 	}
// }
cheerName()
