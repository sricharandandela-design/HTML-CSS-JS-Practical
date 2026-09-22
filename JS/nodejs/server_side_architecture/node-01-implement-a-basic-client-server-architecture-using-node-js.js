// Node.js Practical: Implement a basic Client-Server Architecture using Node.js.
// Run: node node-01.js
// For Express/database experiments, install dependencies listed in package.json.
const net = require('node:net');
const server = net.createServer(socket => {
  socket.end('Hello from the Node.js server');
});
server.listen(3000, () => console.log('Server listening on port 3000'));
