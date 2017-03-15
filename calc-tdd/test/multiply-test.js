const { assert: {isNumber, strictEqual} } = require('chai');

const multiply = require('../lib/multiply');

describe('multiply', () => {
	it('should return a number', () => {
		isNumber(multiply());
	});
	it('should multiply the two args', () => {
		strictEqual(multiply(2, 3), 6);
	});
});
