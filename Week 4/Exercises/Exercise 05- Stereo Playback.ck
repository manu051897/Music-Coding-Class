// Sound Chain
SndBuf2 mySound => dac; // SndBuf2 is for stereo files

// connecting both channels to left and right speakers
// mySound.chan(0) => dac.left;
// mySound.chan(1) => dac.right;

// Opening the file
"/Users/30221/Desktop/Coding Music Class/Misc/audio/stereo_fx_01.wav" => mySound.read;

// Infinite Loop
while(true)
{
    0 => mySound.pos;
    2.0 => mySound.rate;
    mySound.length()/2 => now;
}