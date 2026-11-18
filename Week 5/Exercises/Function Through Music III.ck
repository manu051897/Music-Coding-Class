// Sound Chain
SndBuf Click => dac;

// Open File
me.dir() + "../../Misc/audio/stereo_fx_01.wav" => Click.read;

// Playhead Setting
Click.samples() => Click.pos;

// Function
// granualize function
fun void gran (int steps)
{
    Click.samples()/steps => int grain;
    Math.random2(0,Click.samples() - grain) => Click.pos;
    grain::samp => now;
}

// Main Program
while (1)
{
    gran(100);   
}
