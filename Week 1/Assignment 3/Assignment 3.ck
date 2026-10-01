SinOsc Sin => dac;
0.5 => Sin.gain;
3 :: second => now;

0.75 => Sin.gain;
3:: second => now;

1 => Sin.gain;
3:: second => now;

2 => Sin.gain;
3:: second => now;

SqrOsc Sqr => dac;
1 => Sqr.gain;
3 :: second => now;


TriOsc Tri => dac;
1 => Tri.gain;
3 :: second => now;


SawOsc Saw => dac;
1 => Saw.gain;
3 :: second => now;
