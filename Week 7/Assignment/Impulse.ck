// Impulse.ck
// connections
Impulse i =>  ResonZ bassFilter => JCRev reverb => Echo delay => dac;

// Filter Setup for impulse
60 => bassFilter.freq; // Impulse filter freq set
30 => bassFilter.Q; // Impulse filter Q set
0.1 => reverb.mix; // Impulse Reverb mix
0.5::second => delay.max; // Impulse echo max memory
50::ms => delay.delay; // Impulse echo delay
0.3 => delay.mix; // Impulse echo mix
300 => i.gain; // Impulse gain

// Start Impulse from 1500.
3000 => int a;

// Infinite Loop
while( true )
{

    // set the next sample gain of impulse
    1 => i.next;
    
    // advance time in samples since impulse works only as a sample
    a::samp => now;
    
    a - 10 => a; // Accelerate amount reduced for a

    if ( a <= 0 )  500 => a; // When a reaches 0, make a 500

}