// Node.js Practical: Demonstrate the File System (fs) module.
// Run: node node-06.js
// For Express/database experiments, install dependencies listed in package.json.
const fs=require('node:fs');
const file='sample.txt';
fs.writeFileSync(file,'Node.js File System module');
console.log('Created:',file);
console.log('Read:',fs.readFileSync(file,'utf8'));
fs.appendFileSync(file,'\nAppended line.');
console.log(fs.readFileSync(file,'utf8'));
