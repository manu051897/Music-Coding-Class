// kick
//sound chain
SndBuf kick => dac;

me.dir(-3) + "/Misc/audio/kick_04.wav" => kick.read;

//create BPM object
BPM tempo;
tempo.tempo(120);

while(true){

    tempo.quarterNote => dur quarter;

    for (0 => int beat; beat < 4 ; beat++){

        0=> kick.pos;
        quarter => now;

    }

}