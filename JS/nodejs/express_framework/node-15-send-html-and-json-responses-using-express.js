// Node.js Practical: Send HTML and JSON responses using Express.
// Run: node node-15.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.get('/',(req,res)=>res.send('<h1>Express HTML response</h1>'));
app.get('/api',(req,res)=>res.json({message:'JSON response'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
