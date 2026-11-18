me.dir() + "/Cowbell.ck" => string cowPath;
me.dir() + "/kick.ck" => string kickPath;
me.dir() + "/BPM.ck" => string BPMPath;

Machine.add(BPMPath) => float BPMID;
Machine.add(kickPath) => float kickID;
Machine.add(cowPath) => float cowID;
