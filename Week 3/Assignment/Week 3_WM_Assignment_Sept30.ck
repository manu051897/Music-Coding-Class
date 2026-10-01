/*
// Sound Mapping
SinOsc s1 => dac;
TriOsc s2 => dac;

// Create array with A, C, E, D, B, A

[69, 72, 76, 74, 71, 69] @=> int Harm[];

[21, 14, 16, 23] @=> int Bass[];

// Create infinite loop
while(true)
{
    for(0 => int i; i < Harm.cap(); i++)
    {
    
    Std.mtof(Harm[i]) => s1.freq;
    0.5::second => now;
    
        }
    
    
    for(0 => int a; a < Bass.cap(); a++)
    {
            
    Std.mtof(Bass[a]) => s2.freq;
    1::second => now;
            
        } // ERROR - Not in the same loop. Hence playing one after another.
    <<< Harm[i] , Bass[a] >>// Mistake regarding not having universal i and a. i and a would get destroyed in the loop.
*/

SinOsc s1 => dac.left;
TriOsc s2 => dac.right;
SqrOsc s3 => Pan2 p => dac;

// Turn down the volume so it does not distort
0.2 => s1.gain;
0.35 => s2.gain;
0.05 => s3.gain;

[69, 72, 76, 74, 71, 69] @=> int Harm[];
[21, 14,] @=> int Bass[];
[57, 50] @=> int Noiz[];

// Create your position variables outside the loop
0 => int i; 
0 => int a;
0 => int x; 

// A timer to track when a full second passes
0 => int bassTimer;

while( true )
{
    // 1. Set all frequencies
    Std.mtof( Harm[i] ) => s1.freq;
    Std.mtof( Bass[a] ) => s2.freq;
    Std.mtof( Noiz[x] ) => s3.freq;
    
    // 2. Print all values
    <<< "Harm:", Harm[i] , "Bass:", Bass[a], "Noise:", Noiz[x] >>>;
    
    // 3. Move time by the fastest note speed
    0.5::second => now;
    
    // 4. Move the Harmony forward one step
    i++;
    if( i == Harm.cap() ) 
    {
        0 => i; 
    }
    
    // 5. Move the Bass & Noiz forward only if 3 turns have passed (1.5 second)
    bassTimer++;
   
    if( bassTimer == 3 )
    {
        a++; // increase a by 1
        x++; // increase x by 1
        if( a == Bass.cap() && x == Noiz.cap() ) 
        {
            0 => a;
            0 => x;
        }
        0 => bassTimer;     
    }
}    