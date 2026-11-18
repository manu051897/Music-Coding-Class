// connections
SndBuf kick => NRev reverbK  => Echo delayK => dac;

// Filepath
me.dir(-2) + "/Misc/audio" => string path;

// Array for kicks
string kickSamples[3];

// Open Files into the different arrays
path + "/kick_01.wav" => kickSamples[0];
path + "/kick_02.wav" => kickSamples[1];
path + "/kick_04.wav" => kickSamples[2];

// Rev
0.1 => reverbK.mix; // kick Reverb mix

// Echo
50::ms => delayK.max; // Echo max memory
35::ms => delayK.delay; // Echo delay
0.3 => delayK.mix; // Echo mix

3000 => int a; // Start for impuse

// Infinite Loop
while( true )
{
    
    // advance time in samples since impulse works only as a sample
    a::samp => now;
    
    a - 10 => a; // Accelerate amount reduced for a

    if ( a <= 0 )  { 
        
        500 => a; // When a reaches 0, make a 500

        Math.random2( 0, kickSamples.cap() - 1) => int which;
        
        kickSamples[which] => kick.read;
        
        Math.random2f(0.6,1) => kick.gain;
            
        Math.random2f(0.9, 1.1) => kick.rate;
    
    }

}