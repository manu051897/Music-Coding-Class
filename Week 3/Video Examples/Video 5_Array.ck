// Declaration of Array (method 1)

// create int A with [7 different values in it]
/*
int A[7];

// the 7 different values of array A

12 => A[0];
15 => A[1];
19 => A[2];
24 => A[3];
26 => A[4];
36 => A[5];
90 => A[6];
*/

//Array delclaration 2nd way

SqrOsc s => dac;

[54, 56, 62, 54, 48, 50, 52] @=> int A[];


/*
A[1] => int Data;

<<< Data >>>;

*/ // just chucking A[value postion] to Data and then printing Data.

for (0 => int i; i < A.cap(); i++)
{
    <<< A[i] >>>;
    Std.mtof(A[i]) => s.freq;
    100::ms => now;
    }
