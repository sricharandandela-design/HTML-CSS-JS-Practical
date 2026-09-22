// Node.js Practical: Implement proper HTTP Status Codes in REST APIs.
// Run: node node-60.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.get('/',(req,res)=>res.json({message:'Express practical running'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
