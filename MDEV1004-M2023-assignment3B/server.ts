/**
 * File: server.ts
 * 
 * Student's Name: Divya Patel 
 * Student ID: 200538095
 * 
 * Date: 23/07/2023
 */




import app from './Server/Config/app';
import debug from 'debug';
debug('mdev1004-m2023-firstassignment:server');
import http from 'http';
import { AddressInfo } from 'net';
import { HttpError } from 'http-errors';

let port = normalizePort(process.env.PORT || '3000');
app.set('port', port);
let server = http.createServer(app);
server.listen(port);
server.on('error', onError);
server.on('listening', onListening);

function normalizePort(val:string) :string | number | false 
{
  let port = parseInt(val, 10);

  if (isNaN(port)) {
    return val;
  }

  if (port >= 0) {
    return port;
  }

  return false;
}

function onError(error: HttpError) : void
{
  if (error.syscall !== 'listen') {
    throw error;
  }

  let bind = typeof port === 'string'
    ? 'Pipe ' + port
    : 'Port ' + port;

  switch (error.code) 
  {
    case 'EACCES':
      console.error(bind + ' requires elevated privileges');
      process.exit(1);
      break;
    case 'EADDRINUSE':
      console.error(bind + ' is already in use');
      process.exit(1);
      break;
    default:
      throw error;
  }
}

function onListening() :void
{
  let addr = server.address() as AddressInfo;
  let bind = typeof addr === 'string'
    ? 'pipe ' + addr
    : 'port ' + addr.port;
  debug('Listening on ' + bind);
}
