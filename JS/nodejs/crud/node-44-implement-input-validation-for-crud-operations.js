// Node.js Practical: Implement input validation for CRUD operations.
// Run: node node-44.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');const app=express();app.use(express.json());
app.post('/register',(req,res)=>{const {name,email}=req.body;if(!name||!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email||''))return res.status(400).json({error:'Valid name and email required'});res.json({message:'Valid input'});});
app.listen(3000,()=>console.log('http://localhost:3000'));
