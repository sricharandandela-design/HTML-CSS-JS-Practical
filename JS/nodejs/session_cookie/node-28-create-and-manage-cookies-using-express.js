// Node.js Practical: Create and manage cookies using Express.
// Run: node node-28.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
const cookieParser=require('cookie-parser');
app.use(cookieParser());
app.get('/',(req,res)=>res.json({message:'Express practical running'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
