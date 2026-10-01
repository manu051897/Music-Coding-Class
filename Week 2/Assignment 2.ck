// Oscilators
SinOsc s => dac;
SinOsc t => dac;

// time now to end at 30 second
now + 30:: second => time end;

// while loop for random math noise for 30 seconds
while(now < end)
{
// Within the loop create a random int x    
    Math.random2(100,1000) => int x;

// int x chucked into frequence of Osc s    
    x => s.freq;

// Gain set at 0.1 for Osc s    
    0.1 => s.gain;

// change freq every 10ms    
    10::ms => now;    

// Create if statement for beep every time x hits 250  
    if( x == 250)
    {

// setting Osc t freq with for loop (BEEP)
        for( 2000 => int i; i < 2500; i++)
        {
            i => t.freq;
            .5 => t.gain;
            .2 :: ms => now;
        };
        <<< x, now/second >>>; // print every time x hits 250
    }

// creating else so that t gain goes back to 0 after beep    
    else
    {
        0 => t.gain;
    }   
}

