// Node.js Practical: Handle GET and POST requests using Express.
// Run: node node-13.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.use(express.json());
app.get('/api/items',(req,res)=>res.json([{id:1,name:'Notebook'}]));
app.post('/api/items',(req,res)=>res.status(201).json({message:'Created',body:req.body}));
app.listen(3000,()=>console.log('http://localhost:3000'));
