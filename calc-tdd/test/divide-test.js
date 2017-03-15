const { assert: {isNumber, strictEqual} } = require('chai');

const divide = require('../lib/divide');

describe('divide', () => {
	it('should return a number', () => {
		isNumber(divide());
	});
	it('should divide 1st arg by 2nd', () => {
		strictEqual(divide(8, 4), 2);
	});
});
