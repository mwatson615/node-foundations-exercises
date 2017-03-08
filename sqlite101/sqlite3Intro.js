#!/usr/bin/env node
'use strict';

const sqlite3 = require('sqlite3').verbose();

//creates db called employees.sqlite
const db = new sqlite3.Database('employees.sqlite', (err) => console.log('connected'));

db.run("CREATE TABLE IF NOT EXISTS newemployees (id INT, first TEXT, last TEXT, dept TEXT, salary NUMBER(6, 2), address TEXT)");

const dropEmployees = () => {
	db.run("DROP TABLE newemployees");
};
// dropEmployees();

const { list } = require('./employees.json');
const populateEmployees = () => {
	list.forEach(each => {
		db.run(`INSERT INTO newemployees VALUES (
			${each.id},
			"${each.firstName}",
			"${each.lastName}",
			"${each.dept}",
			${each.salary},
			"${each.address}")`)
	})
}
// populateEmployees();
db.all('SELECT * FROM newemployees', (err, allRows) => {
	// console.log(allRows)
})
db.each('SELECT dept FROM newemployees', (err, allJobs) => {
	// console.log(allJobs)
})

db.each('SELECT first, last, address FROM newemployees', (err, demo) => {
	// console.log(demo.first, demo.last, demo.address)
})

// let addHobby = () => {
// db.run("ALTER TABLE newemployees ADD hobby TEXT")
	
// }

//below is how to update a column's fields based on its id #
const updateHobby = () => {
	list.forEach(each => {
	db.run(`UPDATE newemployees SET hobby = "${each.hobby}" WHERE id = ${each.id}`)
	console.log(each.hobby)
	})
}
updateHobby();
