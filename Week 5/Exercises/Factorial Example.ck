// Recursion - factorial example

fun int fact( int x)
{
    if ( x<=1)
    {
        return 1;
    }
    else
    {
        return (x*fact(x-1));
    }
}

for (0 => int i; i < 100 ;i++)
{
    <<< i, fact(i) >>>;
    1::second => now;    
}