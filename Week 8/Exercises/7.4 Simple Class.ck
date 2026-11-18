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
}

simple s;

while (true){

    Math.random2f( 1100.00, 1200.00 ) => s.freq;
    Math.random2f( 1.00, 200.00 ) => s.setQ;
    Math.random2f( 0.2 , 0.6 ) => s.setGain;

    // Play
    1 => s.noteOn;
    1::second => now;

}