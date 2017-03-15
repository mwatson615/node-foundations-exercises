const { assert: {isNumber, strictEqual} } = require('chai');

const subtract = require('../lib/subtract');

describe('subtract', () => {
	it('should return a number', () => {
		isNumber(subtract());
	});
	it('should subtract 2nd arg from 1st', () => {
		strictEqual(subtract(3, 1), 2);
	})
});
