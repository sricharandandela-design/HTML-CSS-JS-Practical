// Node.js Practical: Create Admin and User roles.
// Run: node node-52.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.get('/admin',auth,(req,res)=>res.json({message:'Admin route allowed'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
