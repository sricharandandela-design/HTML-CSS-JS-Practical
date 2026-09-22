// Node.js Practical: Implement User Registration.
// Run: node node-45.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express'); const bcrypt=require('bcrypt');
const app=express(); app.use(express.json());
const users=[];
app.post('/register',async(req,res)=>{const {username,password}=req.body; if(!username||!password)return res.status(400).json({error:'Required'}); users.push({username,password:await bcrypt.hash(password,10)}); res.status(201).json({message:'Registered'});});
app.post('/login',async(req,res)=>{const u=users.find(x=>x.username===req.body.username); if(!u||!(await bcrypt.compare(req.body.password,u.password)))return res.status(401).json({error:'Invalid credentials'}); res.json({message:'Login successful'});});
app.listen(3000,()=>console.log('http://localhost:3000'));
