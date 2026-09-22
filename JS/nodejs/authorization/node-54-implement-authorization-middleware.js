// Node.js Practical: Implement Authorization Middleware.
// Run: node node-54.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
function auth(req,res,next){if(req.headers.authorization!=='Bearer demo-token')return res.status(401).json({error:'Unauthorized'});next();}
app.get('/',(req,res)=>res.json({message:'Express practical running'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
