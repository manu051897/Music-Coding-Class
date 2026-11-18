// Sound Chain
SndBuf snare => dac;

// File Open
me.dir() + "../../Misc/audio/snare_01.wav" => snare.read;
// Playhead Position
snare.samples() => snare.pos;

// Function
fun int snrRoll( int Rolls)
{
    <<< Rolls >>>;
    if ( Rolls >= 20 )
    {
        0 => snare.pos;
        Math.random2f(0.9,1) => snare.rate;
        Rolls::ms => now;
        
        
        return snrRoll(Rolls - 1);
    }  
    
    else
    {
        return 0;
        
    }  
}

// Main program
snrRoll(100);

