// Node.js Practical: Implement Error Handling in a Node.js application.
// Run: node node-11.js
// For Express/database experiments, install dependencies listed in package.json.
try {
  JSON.parse('{invalid json}');
} catch (error) {
  console.error('Caught error:',error.message);
}
process.on('uncaughtException',err=>console.error('Unexpected error:',err.message));
