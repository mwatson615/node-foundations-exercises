const { assert: {isNumber, strictEqual, equal} } = require('chai');

const calculate = require('../lib/calculator');
console.log(calculate)
describe('calculate', () => {
	it('should select correct operation based on input', () => {
		equal(calculate( [2, '+', 3]), 5)
	})
})
