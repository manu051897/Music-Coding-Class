/* Basic Pan in sterio out...
SinOsc s => dac.left;
SinOsc t => dac.right;

220 => s.freq;
1000 => t.freq;
1::second => now;
*/


/* using channels in dac. Maybe when using sound card 
with multiple channel outs...

SinOsc a => dac.chan(0);
SinOsc b => dac.chan(1);
SinOsc c => dac.chan(2);
SinOsc d => dac.chan(3);
SinOsc e => dac.chan(4);
SinOsc f => dac.chan(5);

*/

/*
//Sound Chain
SinOsc s => Pan2 p => dac;

// Hard Pan
1.0 => float PanPosition;

while(PanPosition > -1)
{
    PanPosition => p.pan;
    PanPosition - 0.01 => PanPosition;
    0.1:: second => now;
    <<< PanPosition >>>;
    }

*/

Noise n => Pan2 p => dac;

while(true);
{
    Math.sin(now/1::second*2*pi) => p.pan;
    10::ms => now;
    }
    
    // won't run due to infinite loop
