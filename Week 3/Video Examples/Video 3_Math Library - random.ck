SqrOsc x => dac;
Math.srandom(69); // Creates a seed for the random freqx

while(true)
    {
        
        
        // Math.random() => int a; For completely random int. no min or max
        Math.random2(1, 127) => int b; // for a min and max int
        // Math.randomf() => float c; Complete random float. No mn or max
        Math.random2f(0.1, 0.5) => float d; //Random float with min and max amount
        
        Std.mtof(b) => float Ha; //turning random int with min and max value to midi
        
        Ha => x.freq; //Making midi values into freq for SqrOsc x.
        
        d => x.gain; // chucking random value of d to the gain of SqrOsc x.
        
        1::second => now;
       
        <<< "b:", b, "d:", d >>>; // Printing the value of b & d
        
        }