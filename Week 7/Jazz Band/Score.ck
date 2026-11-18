//Score.ck

// Chuck file paths
me.dir() + "/Bass.ck" => string basspath;
me.dir() + "/Drums.ck" => string drumspath;
me.dir() + "/Flute.ck" => string flutepath;
me.dir() + "/Piano.ck" => string pianopath;

// start piano
Machine.add(pianopath) => int pianoID;
4.8::second => now;

// start drums
Machine.add(drumspath) => int drumsID;
4.8::second => now;

// start bass
Machine.add(basspath) => int bassID;
4.8::second => now;

// start flute
Machine.add(flutepath) => int fluteID;
4.8::second => now;

Machine.remove(drumsID);
4.8::second => now;

Machine.add(drumspath) => drumsID;
4.8::second => now;

if (90::second => now) {
    me.exit();
}