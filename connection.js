var mysql=require('mysql');
 var con=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'rootpassword',
    database:'mysql2'
 });
 con.connect((err) =>{
   if(!err){
       console.log('Connection Established Successfully');
   }
       else{
           console.log('Connection Failed!'+JSON.stringify(err,undefined,2));
       }
      //    con.query("CREATE DATABASE mysql2",function(err,result){
      //  if(err){
      //    console.log("Database Not Connected Successfully"+JSON.stringify(err))
      //  }
      //  else{
      //    console.log("Database connected" + result);

      //  }
   //     var sql="CREATE TABLE customers1 (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(255),address VARCHAR(255))";
   //   con.query(sql,function(err,result){
   //    if(err){
   //       console.log("Table creation failed"+JSON.stringify(err));
   //    }
   //    else{
   //       console.log("Table created successfully"+result)
   // }
   //   })
//    var sql = "INSERT INTO customers1 (name, address) VALUES ('Company Inc', 'Highway 37')";
//   con.query(sql, function (err, result) {
//     if (err) throw err;
//     console.log("1 record inserted");
//   });
var sql="INSERT INTO customers1 (name,address) VALUES ?";
var values=[['John', 'Highway 71'],
['Peter', 'Lowstreet 4'],
['Amy', 'Apple st 652'],
['Hannah', 'Mountain 21'],
['Michael', 'Valley 345'],
['Sandy', 'Ocean blvd 2'],
['Betty', 'Green Grass 1'],
['Richard', 'Sky st 331'],
['Susan', 'One way 98'],
['Vicky', 'Yellow Garden 2'],
['Ben', 'Park Lane 38'],
['William', 'Central st 954'],
['Chuck', 'Main Road 989'],
['Viola', 'Sideway 1633']

];
con.query(sql,[values],function(err,result){
   if(err) throw err;
   console.log("Number of records inserted "+ result.affectedRows);
})

// var sql="INSERT INTO customers1 (name,address) VALUES('vini','mulund')";
// con.query(sql,function(err,result){
//    if(err) throw err;
//    console.log("1 record inserted,Id:"+result.insertId);
// })
con.query("SELECT * FROM customers1", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });

       });
   //});