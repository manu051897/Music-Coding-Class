// Sound Chain
Sitar sitar => Gain sitarGain => Gain master => dac;

// Instruments Sound Chain
Shakers shaker => master; // Drums

VoicForm singerDrones[4]; // Drones
NRev droneRev => master;

for(0 => int i; i < singerDrones.cap(); i++){
    singerDrones[i] => droneRev;
    (0.5/singerDrones.cap()) => singerDrones[i].gain;
}

// Timing parameter
0.1 => float beattime;

// Global Variables
[45, 46, 48, 50, 52, 53, 55, 56] @=> int raga[]; //Sitar notes
[78, 91, 21, 44] @=> int drone[]; // Drone Notes

// Feedback Loop
sitarGain => Gain sitarFeedback => Delay delay => sitarGain;

// Feedback Parameters
beattime::second => delay.max;
beattime::second => delay.delay;
0.9 => sitarFeedback.gain;

// Singer parameters
0.8 => droneRev.mix;

for (0 => int i; i < singerDrones.cap(); i++){
    0.02 => singerDrones[i].vibratoGain;
    "mmm" => singerDrones[i].phoneme;
    Std.mtof(drone[i]) => singerDrones[i].freq;
}

//Functions
// Play Sitar Function
fun void playSitar(){
        
    while (1) {

         Math.random2(0,4) => int factor; // Randomly choose a factor to multiply the beattime

        for(0 => int i; i < raga.cap(); i++ ){
            
            Std.mtof(raga[ Math.random2(0, raga.cap() - 1) ]) => sitar.freq;
            sitar.noteOn(Math.randomf());
            
            beattime::second * factor => now;

        }
    }    
}

// Play Drums Function
fun void playDrums(){
    while (1) {
        
        Math.random2(0,4) => int factor; // Randomly choose a factor to multiply the beattime

        Math.random2(1, 2) => shaker.preset;
        Math.random2f(60, 128) => shaker.objects;
        Math.random2f(0.8, 1) => shaker.decay;
        shaker.noteOn(Math.random2f(0.0 , 4.0));

        (beattime/2) :: second * factor => now;

    }
}

// Main Program
// while (true){

spork ~ playSitar();
spork ~ playDrums();

100::second => now;

// }