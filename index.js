const http = require('http');

// Dockerz
if (require.main === module) {
  http
    .createServer(function (req, res) {
      res.writeHead(200, { 'Content-Type': 'text/plain' });
      res.end('Hello World!');
    })
    .listen(3000);
}

// Lambda
module.exports.handler = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: 'Hello World!',
  };

  callback(null, response);
};
