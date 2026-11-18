adc => Gain s => blackhole; // instead of blackhole dac to hear adc- analog to digital converter


while (1) //Just a while loop to see the last samp value of adc
{
    <<< adc.last() >>>;
    0.5 :: second => now;
}