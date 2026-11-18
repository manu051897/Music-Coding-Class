// Sound Chain
Impulse imp => ResonZ filt => dac;

// Global Values
800 => filt.freq;
400 => filt.Q;

// Main Program
while (true) {
 200 => imp.next;
 Math.random2f(500, 2000) => filt.freq;
 Math.random2f(200, 500) :: ms => now;
}