// Import the interface to Tessel hardware
var tessel = require('tessel');

// Set the led pins as outputs with initial states
// Truthy initial state sets the pin high
// Falsy sets it low.
var led1 = tessel.led[0].output(0),
	led2 = tessel.led[1].output(0),
	led3 = tessel.led[2].output(0),
	led4 = tessel.led[3].output(0),
	leds = [led1, led2, led3, led4];

var counter = 0

setInterval(function () {
    console.log("I'm blinking! (Press CTRL + C to stop)");

    for (i=0; i<leds.length; i++) {
    	leds[i].output(i==counter)
    }
    counter = counter==leds.length? 0:counter+1;
}, 200);