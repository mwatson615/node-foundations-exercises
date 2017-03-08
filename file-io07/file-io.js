#!/usr/bin/env node
const fs = require('fs')

let readStream = fs.readFileSync('file-io.json')

process.stdout.write(readStream)
