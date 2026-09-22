// Node.js Practical: Implement login and logout using sessions.
// Run: node node-31.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
const session=require('express-session');
app.use(session({secret:'practical-secret',resave:false,saveUninitialized:false}));
app.get('/',(req,res)=>res.json({message:'Express practical running'}));
app.listen(3000,()=>console.log('http://localhost:3000'));
