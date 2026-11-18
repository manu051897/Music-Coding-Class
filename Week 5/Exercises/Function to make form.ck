SndBuf kick => dac;
SndBuf snare => dac;

// Open sound fles
me.dir() + "../../Misc/audio/kick_01.wav" => kick.read;
me.dir() + "../../Misc/audio/snare_03.wav" => snare.read;
// Playhead set
kick.samples() => kick.pos;
snare.samples() => snare.pos;


// Global Variables
[1,0,0,0,0,0,1,0] @=> int kick_ptrn_1[];
[1,0,0,1,0,0,0,1] @=> int kick_ptrn_2[];
[0,0,0,1,0,0,1,0] @=> int snare_ptrn_1[];
[1,1,1,1,1,1,1,1] @=> int snare_ptrn_2[];

//function
fun void sect ( int kickArray[], int snareArray[], float beattime )
{
    for (0 => int i; i < kickArray.cap() ; i++)
    {
        if ( kickArray[i] == 1 ) // if 1 in kick array than play kick
        {
            0 => kick.pos;
        }
        
        if ( snareArray[i] == 1 ) // if 1 in snare array than play snare
        {
            0 => snare.pos;
        }
        beattime::second => now;
    }    
    
    
}


//Main Program
while (1)
{
<<< "section 1" >>>;
sect(kick_ptrn_1, snare_ptrn_1, .2);
<<< "section 2" >>>;
sect(kick_ptrn_2, snare_ptrn_1, .2);
<<< "section 3" >>>;
sect(kick_ptrn_1, snare_ptrn_2, .2);
<<< "section 4" >>>;
sect(kick_ptrn_2, snare_ptrn_2, .3);    
}

