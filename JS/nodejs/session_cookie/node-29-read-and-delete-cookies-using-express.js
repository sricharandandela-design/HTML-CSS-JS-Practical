// Node.js Practical: Read and delete cookies using Express.
// Run: node node-29.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
const cookieParser=require('cookie-parser');
app.use(cookieParser());
app.delete('/api/items/:id',(req,res)=>res.status(204).end());
app.listen(3000,()=>console.log('http://localhost:3000'));
