// Sound Chain
SndBuf kick => dac;
TriOsc s => dac;

// Array
[72,73,75,76] @=> int A[];

// Filepath & Read
me.dir() + "../../Misc/audio/kick_01.wav" => string filepath;



// Function
fun void swell ( float start, float end, float grain )
{
    // Swell up
    for( start => float j; j< end; j+grain => j )
    {
        j => s.gain;
        //j => kick.gain;
        0.01::second => now;
    }
    
    // Swell down
    for( end => float j; j > start; j-grain => j)
    {
        j => s.gain;
        0.01::second => now;    
    }
    
}

// Main code
// Infinite loop that plays for the duration of the whole audio file.
while(true)
{
    for (0 => int i; i < A.cap(); i++)
    {
        
        Std.mtof(A[i]) => s.freq;
        for (0.01 => float j; j < 0.1; j + 0.09 => j)
        {
            swell(0.01, .2, j);
            0.01::second => now;
        }
        
        0.1::second => now;
        if ( i < 4)
        {
            filepath => kick.read;
            0.1 => kick.gain;
        }
    }
}