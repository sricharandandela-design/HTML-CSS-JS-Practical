// Node.js Practical: Implement Password Hashing.
// Run: node node-47.js
// For Express/database experiments, install dependencies listed in package.json.
const bcrypt=require('bcrypt');
(async()=>{const password='Secret123!';const hash=await bcrypt.hash(password,12);console.log('Hash:',hash);})();
