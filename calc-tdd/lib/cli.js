'use strict';

process.title = 'Calculator'

const { argv : [,, ...args] } = process
const calculate = require('./calculator')
	console.log(calculate(args))

//needs to add, subtract, mult, divide
//takes 3 args:
//1. number
//2. operator
//3. number
//
// returns a number
//process args

//take user input of two nums and return a calculation using a method chosen by the user
