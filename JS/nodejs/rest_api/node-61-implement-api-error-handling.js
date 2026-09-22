// Node.js Practical: Implement API Error Handling.
// Run: node node-61.js
// For Express/database experiments, install dependencies listed in package.json.
try {
  JSON.parse('{invalid json}');
} catch (error) {
  console.error('Caught error:',error.message);
}
process.on('uncaughtException',err=>console.error('Unexpected error:',err.message));
