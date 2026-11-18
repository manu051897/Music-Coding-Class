class simple{

    // Sound Chain
    Impulse imp => ResonZ filt => dac;

    //default settings
    100 => filt.Q => filt.gain;
    1000 => filt.freq;

    fun void freq ( float f ){

        f => filt.freq;

    }

    fun void setQ ( float q ){

        q => filt.Q => filt.gain;

    }

    fun void setGain ( float g ){

        g => imp.gain;

    }

    fun void noteOn ( float volume ){

        volume => imp.next;

    }

    fun float pitch (float freq){

        return (freq => filt.freq);

    } 
    
    fun float pitch (int noteNum){

        return (Std.mtof(noteNum) => filt.freq);

    } 

}

simple s;

while (true){

    // Float freq
    440.0 => s.pitch;

    1 => s.noteOn;
    1::second => now;

    // Int freq
    60 => s.pitch;

    // Play
    1 => s.noteOn;
    1::second => now;

}