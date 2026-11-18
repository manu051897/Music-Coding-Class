// Sound Chain
TriOsc chord[4];
Gain master => dac;

for ( 0 => int i; i < chord.cap(); i++ )
{
    chord[i] => master; // Connect Unit Gen chord[] to master.    
}

// Array for chords and quality
[48,57,53,55] @=> int exChords[];
["major", "minor" ] @=> string arrQual[];

// Global Values
0.2 => master.gain;

// Record current time
now => time start;

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
    
    // Adding Noise
    for (0 => int i; i < length; i++)
    {
        Std.mtof(root) + Math.random2(-100,100) => chord[3].freq;
        (1/length) :: ms => now;
    }
    
    //Time
    length::ms => now;
}

// Main Program
while(1)
{
    if ( now - start >= 15::second ){ me.exit(); }
    
    Math.random2(0, exChords.cap() - 1 ) => int plyChord;
    Math.random2(0, arrQual.cap() - 1 ) => int plyQual;
    playChord( exChords[plyChord] , arrQual[plyQual] , Math.random2(150,500));
   
}