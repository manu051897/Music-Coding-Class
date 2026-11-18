public class BPM
{

    // global member variables
    dur myDuration[4];
    static dur quarterNote, eighthNote, sixteenthNote, thritysecondNote;

    fun void tempo (float beat){

        // beat is BPM

        60.0/(beat) => float SPB; // seconds per beat
        SPB::second => quarterNote;
        quarterNote * 0.5 => eighthNote;
        eighthNote * 0.5 => sixteenthNote;
        sixteenthNote * 0.5 => thritysecondNote;

        // store data in array
        [quarterNote, eighthNote, sixteenthNote, thritysecondNote] @=> myDuration;
    }

}