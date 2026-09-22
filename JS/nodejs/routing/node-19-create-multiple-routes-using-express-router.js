// Node.js Practical: Create multiple routes using Express Router.
// Run: node node-19.js
// For Express/database experiments, install dependencies listed in package.json.
const express=require('express');
const app=express();
const router=express.Router();
router.get('/',(req,res)=>res.json({route:'users'}));
router.get('/:id',(req,res)=>res.json({userId:req.params.id}));
app.use('/users',router);
app.listen(3000,()=>console.log('http://localhost:3000'));
