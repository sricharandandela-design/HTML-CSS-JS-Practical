// Node.js Practical: Demonstrate the Request-Response Cycle in a server-side application.
// Run: node node-03.js
// For Express/database experiments, install dependencies listed in package.json.
const http=require('node:http');
http.createServer((req,res)=>{
  console.log('Request:', req.method, req.url);
  res.writeHead(200, {'Content-Type':'application/json'});
  res.end(JSON.stringify({message:'Response sent successfully', method:req.method, url:req.url}));
}).listen(3000,()=>console.log('http://localhost:3000'));
