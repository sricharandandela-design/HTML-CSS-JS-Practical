// Node.js Practical: Implement a DELETE REST API.
// Run: node node-59.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
app.delete('/api/items/:id',(req,res)=>res.status(204).end());
app.listen(3000,()=>console.log('http://localhost:3000'));
