// Node.js Practical: Create a basic HTTP Server using Node.js.
// Run: node node-02.js
// For Express/database experiments, install dependencies listed in package.json.
const http = require('node:http');
const server = http.createServer((req,res)=>{
  res.writeHead(200, {'Content-Type':'text/html'});
  res.end('<h1>Hello from Node.js HTTP Server</h1>');
});
server.listen(3000, ()=>console.log('http://localhost:3000'));
