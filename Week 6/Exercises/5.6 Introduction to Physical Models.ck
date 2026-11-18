Noise nois => ADSR env => Delay d => dac;

d => d; //Feedback Loop for delay??
0.99 => d.gain;
(0.005::second, 0.001::second, 0.0, 0.001::second) => env.set;

0.005 :: second => d.delay;

1 => env.keyOn;
1 :: second => now;