// Node.js Practical: Demonstrate Callbacks, Promises, and Async/Await in Node.js.
// Run: node node-10.js
// For Express/database experiments, install dependencies listed in package.json.
function callbackExample(cb){setTimeout(()=>cb(null,'Callback complete'),300);}
const promiseExample=()=>new Promise(resolve=>setTimeout(()=>resolve('Promise complete'),300));
callbackExample((err,result)=>console.log(result));
promiseExample().then(console.log);
(async()=>console.log(await promiseExample()))();
