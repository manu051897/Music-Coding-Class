// Sound Chain
SndBuf kick => dac;
SndBuf hihat => dac;
SndBuf snare => dac;

// File path
"/Users/30221/Desktop/Coding Music Class/Misc/audio" => string path;

// Load sound files
path + "/kick_01.wav" => kick.read;
path + "/hihat_01.wav" => hihat.read;
path + "/snare_01.wav" => snare.read;

// Set all pos to end
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

// initialize counter variable
1 => int counter;

// infinite loop
while (true)
{
    // Since counter mod starts from 0. If we add 1 it can me made into a beat.
    counter % 4 + 1 => int beat;
    
    // increase counter by 1
    counter++;
    
    // high hat plays every beat
    0 => hihat.pos;
    0.2 => hihat.gain;
    
    // kick on every 1 beat count
    if (beat == 1)
    {
        0 => kick.pos;
    }
    
    //snare on every 3 beat count
    if (beat == 3)
    {
        0 => snare.pos;
    }
    
    // Increase time by 250 ms
    250::ms => now;
    
    // Print out beat number
    <<< "beat: ", beat >>>;
}