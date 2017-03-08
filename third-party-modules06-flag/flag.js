#!/usr/bin/env node

const chalkStuff = require('chalk');
const {bgRed, bgWhite, white, bgBlue} = require('chalk');
const stringLength = require('string-length');

const REDCHAR = bgRed(' '),
WHITECHAR = bgWhite(' '),
STAR_PADDING = bgBlue(' '),
STAR_MARGIN = bgBlue(' '),
STAR = white.bgBlue('\u2606'),
MAKE_STAR = STAR_PADDING + STAR;

for (let i = 1; i < 14; i++) {
let starBg = bgBlue(' '),
repeatNum = 7,
fieldLength = 0,
maxLength = 50,
maxHeight = 35,
starField = '',
stripeColor;

if (i % 2 === 0) {
	repeatNum = 6;
	starField = i < 8 ? STAR_MARGIN + MAKE_STAR.repeat(repeatNum) + STAR_MARGIN.repeat(4) : '';
	stripeColor = bgWhite;
} else {
	starField = i < 8 ? MAKE_STAR.repeat(repeatNum) + STAR_MARGIN.repeat(2) : '';
	stripeColor = bgRed;
}

fieldLength = stringLength(starField);
maxLength -= fieldLength;


	process.stdout.write(starField + makeStripe(maxLength, stripeColor) + '\n');
}

function makeStripe(chars, color) {
	let stripe = color(' '.repeat(chars));
	return stripe;
}
