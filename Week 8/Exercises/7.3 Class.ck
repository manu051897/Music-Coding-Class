class testData
{
    // member variable
    1 => int myInt;
    0.0 => float myFrac;

    // member function
    fun float sum()
    {
        return (myInt + myFrac);
    }
}

// Main Program
testData d;

<<< d.myInt, d.myFrac, d.sum() >>>;

1::second => now;

3 => d.myInt;
5.32 => d.myFrac;

<<< d.myInt, d.myFrac, d.sum() >>>;