// Play here:  fgdjshdhdasdfrdsdfghdhsgadhhdjshgdh

// Sound chain
SinOsc chord[3];
Gain master => ADSR env => dac;

for ( 0 => int i; i < chord.cap(); i++ ) { chord[i] => master; }

dac => WvOut record => blackhole; // Sound chain from dac to mono wave file

// Record file
me.dir() + "MidTerm Score.wav" => record.wavFilename; // Saves the file as this name

// Set ADSR Values
env.set( 500::ms, 100::ms, 0.5, 1800::ms );


// Keyboard Setup
Hid hi; //Sets up Keyboard
HidMsg msg; //msg is for receiving all keyboard packages

hi.openKeyboard( 0 ); // Open Keyboard

<<< "Press a, s, d, f, g, h, j" >>>;

// Global Values
0.5 => master.gain;

0 => chord[0].freq;
0 => chord[1].freq;
0 => chord[2].freq;

// Function
fun void playChord ( int root)
{
    if ( root > 0 && root < 120) // 120 and not 127 because the fifth is 7 more than root. so nothin will play above 127
    {
        // root
        Std.mtof( root ) => chord[0].freq;
        // third
        Std.mtof( root + 4 ) => chord[1].freq;
        // fifth    
        Std.mtof(root + 7) => chord[2].freq;
    }  
}

// Main Program
 while( true ) 
 {
    // Wait for physical hardware input
     hi => now;
    
    
    while( hi.recv( msg ) ) // While loop for contstantly receiving input
    {
        
        if ( msg.isButtonDown() ) // Only trigger when the key is pushed DOWN
        {
            0 => int midiNote;

            // Map the raw ASCII code of each letter to a MIDI note
            // 'a' = 65, 's' = 83, 'd' = 68, 'f' = 70, 'g' = 71, 'h' = 72, 'j' = 74
            if ( msg.ascii == 65 )  { 45 => midiNote; } // A
            else if ( msg.ascii == 83 ) { 47 => midiNote; } // B
            else if ( msg.ascii == 68 ) { 48 => midiNote; } // C
            else if ( msg.ascii == 70 ) { 50 => midiNote; } // D
            else if ( msg.ascii == 71 ) { 52 => midiNote; } // E
            else if ( msg.ascii == 72 ) { 53 => midiNote; } // F
            else if ( msg.ascii == 74 ) { 55 => midiNote; } // G         
            
            // If one of our mapped keys was pressed, play it
            if( midiNote > 0 ) 
            {
                playChord(midiNote);
                1 => env.keyOn; // Turn on the ADSR
            }
        }
        
        else if ( msg.isButtonUp()) //Trigger when button not pressed down
        {
            // playChord(150); // This is for complete silence after each chord
            1 => env.keyOff; // For a resonance in the end
        }
    }
 }