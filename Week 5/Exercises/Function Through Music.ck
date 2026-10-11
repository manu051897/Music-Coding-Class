// Function through music
// Chain

SinOsc s => dac;

// function
fun float halfGain ( float originalGain)
{
return (originalGain/2);
    };

// Main code
<<< "Original gain: ", s.gain() >>>;

1::second => now;

halfGain(s.gain()) => s.gain;

<<< "New gain: ", s.gain() >>>;

1::second => now;