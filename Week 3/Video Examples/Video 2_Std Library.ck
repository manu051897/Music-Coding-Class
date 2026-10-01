// std.mtof(int value)
// std.ftom(float value)

// Sound Chain

/*
TriOsc s=> dac;


i++ is when i is an integer. If i is float than use the actual math as stated below
for (0.0 => float i; i <= 127.0; i + 1.0 => i)
{
    std.mtof(i) => float Hz;
    <<< i,Hz >>>;
    i => s.freq;
    200::ms => now;
    };
   

for (0 => int i; i <= 127; i++)
{
    Std.mtof(i) => float Hz;
    Hz => s.freq;
    200::ms => now;
     <<< i,Hz >>>;
};
*/

// absolute Values. Changes neg int and float to positive

-12 => int x;
-12.123456 => float y;

Std.abs(x) => int absx;
Std.fabs(y) => float fabsy;

<<< absx, fabsy >>>;