// drums.ck
// Sound Chain
SndBuf hihat => dac;

me.dir(-2) + "/Misc/audio/hihat_01.wav" => hihat.read;

while (true) {
 
Math.random2f(0.1, 0.3) => hihat.gain;
Math.random2f(0.9, 1.2) => hihat.rate;
(Math.random2(1,2) * 0.2)::second => now;
0 => hihat.pos;

}