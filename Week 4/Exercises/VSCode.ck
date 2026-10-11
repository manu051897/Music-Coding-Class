SinOsc s => dac;
0.5 => s.gain;

for (100 => int i; i <= 127; i++) {
    Std.mtof(i) => float f;
    f => s.freq;

<<< i, f >>>;
    0.5::second => now;
}