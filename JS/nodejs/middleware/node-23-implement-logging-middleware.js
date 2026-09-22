// Node.js Practical: Implement logging middleware.
// Run: node node-23.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.use((req,res,next)=>{console.log(new Date().toISOString(),req.method,req.url);next();});
app.get('/',(req,res)=>res.json({message:'Express practical running'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
