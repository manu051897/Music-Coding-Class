// Sound Chain
SndBuf mySound => dac;

// Getting snare_01.wav to open
"/Users/30221/Desktop/Coding Music Class/Misc/audio/snare_01.wav" => mySound.read;

// Finding out the total number of samples
mySound.samples() => int numSamples;

//Printing the total number of samples
<<< numSamples >>>;

// Infinite loop for reversing
while(true)
{
    numSamples => mySound.pos; // Making the starting position as the end
    -1.0 => mySound.rate; // Make rate -1 to move from last pos to first
    1:: second => now; // Play for 1 sec
}