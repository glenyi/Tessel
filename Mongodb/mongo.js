/*var mongoose = require('mongoose');

var url = 'mongodb://tessel:internetofthings@ds063160.mongolab.com:63160/tessel';
mongoose.connect(url);

var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function callback () {
  console.log("Connected!");
});*/

var mongo = require('mongodb').MongoClient;
var assert = require('assert');

// Connection URL
var url = 'mongodb://tessel:internetofthings@ds063160.mongolab.com:63160/tessel';

// Use connect method to connect to the Server
mongo.connect(url, function(err, db) {
  assert.equal(null, err);
  console.log("Connected correctly to server");

  db.close();
});