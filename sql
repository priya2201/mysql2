const mysql=require('mysql');
let conn=mysql.createConnection({
        host:'localhost',
        user:'root',
        password:'rootpassword',
        database:'sqlbasics'

    });
conn.connect(function(err){
    if(err) throw err;
    console.log("Connected")
//     conn.query('CREATE DATABASE sqlbasics',function(err,result){
// if(err) throw err;
// console.log('Database Connected ')
//     });
// var sql="CREATE TABLE SQLTABLE (name VARCHAR(255),address VARCHAR(255))";
//     conn.query(sql,function(err,result){

//     if(err) throw err;
//     console.log('Table Connected ')
//         });
//    var sql="ALTER TABLE SQLTABLE ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//    conn.query(sql,function(err,result){
//     if(err) throw err;
//     console.log("Table altered")
//    });
//    var sql = "INSERT INTO SQLTABLE (name, address) VALUES ?";
//   var values = [
//     ['John', 'Highway 71'],
//     ['Peter', 'Lowstreet 4'],
//     ['Amy', 'Apple st 652'],
//     ['Hannah', 'Mountain 21'],
//     ['Michael', 'Valley 345'],
//     ['Sandy', 'Ocean blvd 2'],
//     ['Betty', 'Green Grass 1'],
//     ['Richard', 'Sky st 331'],
//     ['Susan', 'One way 98'],
//     ['Vicky', 'Yellow Garden 2'],
//     ['Ben', 'Park Lane 38'],
//     ['William', 'Central st 954'],
//     ['Chuck', 'Main Road 989'],
//     ['Viola', 'Sideway 1633']
//   ];
//   conn.query(sql,[values],function(err,result){
//     if(err) throw err;
//     console.log("Number of records inserted"+result.affectedRows);
//   console.log(result.affectedRows);

//   })
//   var sql = "INSERT INTO SQLTABLE (name, address) VALUES ('Michelle', 'Blue Village 1')";
//   conn.query(sql, function (err, result) {
//     if (err) throw err;
//     console.log("1 record inserted, ID: " + result.insertId);
//   });
conn.query("SELECT * FROM SQLTABLE", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
});
conn.query("SELECT name, address FROM SQLTABLE", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    console.log(fields);
    console.log(result[2].address);
    console.log(fields[1].name);
  });
  conn.query("SELECT * FROM SQLTABLE WHERE address = 'Park Lane 38'", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
  conn.query("SELECT * FROM SQLTABLE WHERE address LIKE 'S%'", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
  var name='Amy';
  var adr = 'Mountain 21';
  var sql = 'SELECT * FROM SQLTABLE WHERE name = ? OR address=?';
conn.query(sql, [name,adr],function (err, result) {
  if (err) throw err;
  console.log(result);
});
conn.query("SELECT * FROM SQLTABLE ORDER BY name", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
//   var sql = "DELETE FROM SQLTABLE WHERE address = 'Mountain 21'";
//   conn.query(sql, function (err, result) {
//     if (err) throw err;
//     console.log("Number of records deleted: " + result.affectedRows);
//   });
//   var sql="UPDATE SQLTABLE SET address='cayon 123' WHERE address='Valley 345'";
//   conn.query(sql,function(err,result){
//     if(err) throw err;
//     console.log(result.affectedRows + "record(s) updated");
//   })
  var sql = "SELECT * FROM SQLTABLE LIMIT 5 OFFSET 2";
  conn.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result);
  });

  
});



