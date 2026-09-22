// Node.js Practical: Serve static files using Express.
// Run: node node-14.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.use(express.static('public'));
app.get('/',(req,res)=>res.send('Static server is running'));
app.listen(3000,()=>console.log('http://localhost:3000'));
