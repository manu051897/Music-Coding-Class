SndBuf snr01 => Pan2 p => dac; //SndBuf to Pan2 to snr01

// Finding the file
"/Users/30221/Desktop/Coding Music Class/Misc/audio" => string path;
"/snare_01.wav" => string snare;

// The final file position
path + snare => snare;

// <<< filename >>>;

// Opens the file
snare => snr01.read;

// Infinite Loop
while(true)
{
    Math.random2f(0.2,0.8) => snr01.gain; // Random gain
    Math.random2f(0.2,1.8) => snr01.rate; // Random rate
    Math.random2f(-1.0,1.0) => p.pan; // random pan
    0 => snr01.pos; //Starting Position
    150::ms => now;
}