// Node.js Practical: Implement API Request Validation.
// Run: node node-62.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.use('/api',(req,res,next)=>{if(req.method==='POST'&&!req.body.name)return res.status(400).json({error:'name is required'});next();});
app.get('/',(req,res)=>res.json({message:'Express practical running'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
