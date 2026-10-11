SndBuf fx01 => dac; //SndBuf for fx_01
// Just upload the files and extract the uploaded names directly on WebChuck
// "stereo_fx_01.wav" => fx01.read;

// Doing this on WebChuck. But for
// directory command this will be as follows:
// finds the filepath for the current .ck file
"/Users/30221/Desktop/Coding Music Class/Misc" => string path;
// define file name for the snare_01 file
"/audio/snare_01.wav" => string filename;
// chucking the whole file dir to a single filename
path + filename => filename;
// <<< filename >>>;
// Just print out and make sure the dir is correct.
// 5. Open the sound file
filename => fx01.read;

// fx01.length() => now; // Plays the whole file
// To play from a certain position
// Sets the begining Position
0 => fx01.pos;
// Define rate (fast, normal or slow)
1.0 => fx01.rate;
// Play for 1 second
1:: second => now;