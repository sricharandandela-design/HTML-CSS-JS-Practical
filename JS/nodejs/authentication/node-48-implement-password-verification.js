// Node.js Practical: Implement Password Verification.
// Run: node node-48.js
// For Express/database experiments, install dependencies listed in package.json.
const bcrypt=require('bcrypt');
(async()=>{const password='Secret123!';const hash=await bcrypt.hash(password,12);console.log('Valid:',await bcrypt.compare(password,hash));})();
