// Sound Chain
Gain master => dac;
SinOsc s => master;
SinOsc t => master;
SinOsc u => master;
SinOsc v => master;


// Functions
fun int weirdNum(int x)
{
    Math.random2f(1, 127)*x/ 5 => float a;
    Std.ftoi(a) => int b;
    return(b);
}

fun int halfNum(float x)
{
    t.freq()/2 => float a;
    Std.ftoi(a) => int b;
    return(b);
}
    
fun int quaterNum(float x)
{
    u.freq()/2 => float a;
    Std.ftoi(a) => int b;
    return(b);
}    


// Creating global values
0 => int minValue; // change min freq
127 => int maxValue; // change max freq

// Main code
for ( minValue => int i; i < maxValue; i++ )
{
    Std.ftom(i) => s.freq;
    weirdNum(i) => t.freq;
    halfNum(i) => u.freq;
    quaterNum(i) => v.freq;
    
    // Keep the volume at maximum until the counter hits 900
    if ( i <= 0.9 * maxValue )
    {
        1.0 => master.gain;
    }
    
    // Start fading out as the counter climbs from 900 to 1000
    else 
    {
        (maxValue - i) / 100.0 => master.gain;
    }
    
    <<< "Freq:", i, t.freq(), u.freq(), v.freq(), "Volume:", master.gain() >>>;
    
    10::ms => now;
}

// My mistake
/*
for ( 150 => int i; i < 1000; i++)
{
    i => s.freq;
    weirdNum(i) => t.freq;
    halfNum(i) => u.freq;
    quaterNum(i) => v.freq;
    
    <<< s.freq(), t.freq(), u.freq(), v.freq() >>>;
    
    10::ms => now;
    
    if ( 900 == i)
    {
        1.0 => float vol;
        
        while (vol > 0)
        {
            
            vol- 0.01 => vol;
            
            1.0 - vol => master.gain;
            10::ms => now;
        };
    };
};

*/