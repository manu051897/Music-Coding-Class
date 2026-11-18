// connections
SinOsc s => Impulse i => ResonZ bassFilter => JCRev reverb => Echo delay => dac;
SndBuf kick => ResonZ bassFilterK => JCRev reverbK  => Echo delayK => dac;

// Filepath
me.dir() + "../../Misc/audio" => string path;

// Array for kicks
string kickSamples[3];

// Sin wave freq
770 => s.freq;

// Open Files into the different arrays
path + "/kick_01.wav" => kickSamples[0];
path + "/kick_02.wav" => kickSamples[1];
path + "/kick_04.wav" => kickSamples[2];

// Filter Setup for impulse
60 => bassFilter.freq; // Impulse filter freq set
30 => bassFilter.Q; // Impulse filter Q set
0.1 => reverb.mix; // Impulse Reverb mix
0.5::second => delay.max; // Impulse echo max memory
50::ms => delay.delay; // Impulse echo delay
0.3 => delay.mix; // Impulse echo mix
300 => i.gain; // Impulse gain

//Filter setup for kick
80 => bassFilterK.freq; // Bass filter freq set
0.1 => reverbK.mix; // kick Reverb mix
100::ms => delayK.max; // Echo max memory
35::ms => delayK.delay; // Echo delay
0.5 => delayK.mix; // Echo mix

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
    
    if( a <= 0 ) // Every time a reaches 0 below line plays
    {        
        Math.random2( 0, kickSamples.cap() - 1) => int which;
        
        kickSamples[which] => kick.read;
        
        Math.random2f(0.6,1) => kick.gain;
            
        Math.random2f(0.9, 1.1) => kick.rate;
            
        (250.0/3)::ms => now;

        500 => a; // Make a play from 500 instead of 1500 after 1st while loop ends 
    }
}