#!/usr/bin/env node

'use strict';

const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('example.sqlite', (err) => console.log('connected'));
//filename can use db extension too

const dropEmployees = () => {
	db.run("DROP TABLE employees");
};
// dropEmployees();

//only creates if doesn't exist
db.run("CREATE TABLE IF NOT EXISTS employees (id INT, first TEXT, last TEXT, salary NUMBER(6, 2), dept TEXT)");


const populateEmployees = () => {

	const { list } = require('./employees.json');

	list.forEach(each => {
		db.run(`INSERT INTO employees VALUES (
			${each.id},
			"${each.firstName}",
			"${each.lastName}",
			${each.salary},
			"${each.dept}"
			)`)
	})
}

// populateEmployees();

//take sql statement as first arg, then error or data in anonymous func args

// db.get('SELECT * FROM employees', (err, row) => {
// 	console.log(row);
// });
// db.all('SELECT * FROM employees', (err, allRows) => {
// 	// console.log(allRows);
// 	allRows.forEach(( {id, first, last, dept, salary}) => {
// 		console.log(`Employee ${id} is ${first} ${last} from ${dept} Department and earns $${salary}`
// 			);
// 	});
// });
//db.each is like firing db.get for each set of values (aka row) - better for larger db, more like stream than read, like chunking

db.all('SELECT * FROM employees WHERE salary > 50000 ORDER BY first', (err, allRows) => {
	if (err) {
		return console.log(err)
	}
	// allData.forEach(( {id, first, last, dept, salary} ) => {
	// emplArray.push(id, first, last, dept, salary)

	// console.log(emplArray)
	// });
	// allData.forEach((each) => {;


	// console.log(`Employee ${id} is ${first} ${last} from ${dept} Department and earns $${salary}`
	// 		);
// });
// const result = allRows.sort((a, b) => {
// 	return (a.first > b.first) ? 1 : -1;
// })
// .filter(each => each.salary > 50000)
const result = allRows.map(each => `${each.first} ${each.last}s salary: ${each.salary}`);
console.log(result);

});
