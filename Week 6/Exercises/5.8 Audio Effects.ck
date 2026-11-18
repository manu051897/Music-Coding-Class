adc => PitShift Pit => dac;
2 => Pit.shift;

while (true) {
    1::second => now;
}

// Example 2
/* adc => JCRev rev => dac;
0.1 => rev.mix;

while (true) {
    1::second => now;
} */



// Example 1
/* adc => Gain inGain;
Delay d[3];

inGain => d[0];
inGain => d[1];
inGain => d[2];

60:: ms => d[0].max => d[0].delay;
80:: ms => d[1].max => d[1].delay;
100:: ms => d[2].max => d[2].delay;

d[0] => d[0] => dac;
d[1] => d[1] => dac;
d[2] => d[2] => dac;

0.6 => d[0].gain => d[1].gain => d[2].gain; // Feedback Gain

// Main Program
while (true) {
    1::second => now;
} */