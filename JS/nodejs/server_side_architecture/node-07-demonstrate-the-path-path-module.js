// Node.js Practical: Demonstrate the Path (path) module.
// Run: node node-07.js
// For Express/database experiments, install dependencies listed in package.json.
const path=require('node:path');
const p=path.join(__dirname,'public','index.html');
console.log('Full path:',p);
console.log('Directory:',path.dirname(p));
console.log('Extension:',path.extname(p));
