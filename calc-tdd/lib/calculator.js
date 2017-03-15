

const add = require('./add');
const subtract = require('./subtract');
const multiply = require('./multiply');
const divide = require('./divide');
//export to cli, call function that accepts an array of args and returns calculated answer
const calculate = (args) => {
	// let args[1] = '+'
if (args[1] === '+') {
	return add(args[0], args[2])
	} else if (args[1] === '-') {
		return subtract(args[0], args[2])
	} else if (args[1] === 'x') {
		return multiply(args[0], args[2])
	} else if (args[1] === '/'){
		return divide(args[0], args[2])
	}
}
module.exports = calculate;
