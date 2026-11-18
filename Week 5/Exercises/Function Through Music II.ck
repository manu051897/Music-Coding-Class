// Swell Function

// Sound Chain
SinOsc s => dac;

// Array
[60,62,65,63,64,65,58,57,56] @=> int A[];

// Function
fun void Swell ( float begin, float end, float grain)
{
    for (begin => float i; i <= end; i + grain => i)
    {
        i => s.gain;
        0.01::second => now;
    }
    
    for (end => float i; i >= begin; i - grain => i)
    {
        i => s.gain;
        0.01::second => now;
    }
}

// Main Program
for ( 0 => int i; i < A.cap(); i++)
{
    Std.mtof(A[i]) => s.freq;
    Swell(0.2, 1.0, 0.05);
    1::second => now;
}