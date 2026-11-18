// Score.ck

me.dir() + "/Bass.ck" => string bassPath;
me.dir() + "/Impulse.ck" => string ImpPath;

Machine.add(bassPath) => int BassID;
Machine.add(ImpPath) => int ImpID;