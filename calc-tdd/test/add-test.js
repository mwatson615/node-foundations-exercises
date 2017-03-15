const { assert: {isNumber, strictEqual} } = require('chai');

const add = require('../lib/add');

describe('add', () => {
	it('should return a number', () => {
		isNumber(add());
	});
	it('sum should equal its parts', () => {
		strictEqual(add(1, 1), 2)
	})
});
