// Node.js Practical: Implement JWT-based Authentication.
// Run: node node-49.js
// For Express/database experiments, install dependencies listed in package.json.
const jwt=require('jsonwebtoken');
const SECRET='change-this-secret';
const token=jwt.sign({id:1,role:'user'},SECRET,{expiresIn:'1h'});
console.log('JWT:',token);
console.log('Decoded:',jwt.verify(token,SECRET));
