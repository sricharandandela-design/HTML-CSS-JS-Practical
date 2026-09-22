// Node.js Practical: Connect a Node.js application to a database.
// Run: node node-33.js
// For Express/database experiments, install dependencies listed in package.json.
const mysql=require('mysql2/promise');
async function main(){
 const db=await mysql.createConnection({host:'localhost',user:'root',password:'YOUR_PASSWORD',database:'web_practicals'});
 await db.query('CREATE TABLE IF NOT EXISTS node_students(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(150) UNIQUE)');
 console.log('Database connection and table are ready.');
 await db.end();
}
main().catch(console.error);
