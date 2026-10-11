// Sound Chain
SndBuf snare => dac;

// Primary path of file
"/Users/30221/Desktop/Coding Music Class/Misc/audio" => string path;

// Array of strings
string snare_samples[3];

//Load arrays with file paths
path + "/snare_01.wav" => snare_samples[0];
path + "/snare_02.wav" => snare_samples[1];
path + "/snare_03.wav" => snare_samples[2];

// print how many samples
// <<< snare_samples.cap() >>>;

// Infinite Loop
while(true)
{
    Math.random2(0, snare_samples.cap() - 1) => int which;
    // Create a random math int. since snare cap is 3 (we want 0-2) hence the -1

    snare_samples[which] => snare.read;
    // Reading which sample to play from the array and then read that into snare

    250::ms => now;
}