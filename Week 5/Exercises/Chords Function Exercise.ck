// Sound Chain
TriOsc chord[3];
Gain master => dac;

for ( 0 => int i; i < chord.cap(); i++ )
{
    // Connect Unit Gen chord[] to master.
    chord[i] => master;    
}

// function

fun void playChord ( int root, string quality, float length)
{
    // root
    Std.mtof(root) => chord[0].freq;
    
    // third- depends on minor or major
    if ( quality == "major" )
    {
        Std.mtof( root + 4 ) => chord[1].freq;
    }
    
    else if ( quality == "minor" )
    {
        Std.mtof( root + 3 ) => chord[1].freq;
    }
    
    // fifth    
    Std.mtof(root + 7) => chord[2].freq;
    
    //Time
    length::ms => now;
}

// Main Program
while (1)
{
playChord(48, "major", 350); //C
playChord(57, "minor", 350); //A
playChord(53, "major", 350); //F
playChord(55, "major", 350); //G

}