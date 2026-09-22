// Node.js Practical: Create a Node.js application using built-in modules.
// Run: node node-05.js
// For Express/database experiments, install dependencies listed in package.json.
const os=require('node:os');
const path=require('node:path');
console.log('OS:',os.platform());
console.log('CPU cores:',os.cpus().length);
console.log('Joined path:',path.join('public','index.html'));
