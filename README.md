# FamiTracker nsis

nsis file to produce a (FamiTracker)[https://nsis.sourceforge.io] windows setup file

## what's needed?

* (nsis)[https://nsis.sourceforge.io]

## features

* don't need administrator privileges;
* demo songs are optionals;

## How to use this repo?

* get the latest binary version by going to http://famitracker.com/downloads.php . As of March 2025, the latest is `v0.4.6` and extract it in the (src)[./src] directory.
* compile it :

 1. either run the makensisw GUI program;
 2. or in the explorer windiows, right clixk on `famitracker.nsi` and choose `compile NSIS Script`;
 3. or from the terminal, in the directory where this repo was  cloned, run `"%PROGRAMFILES(x86)%\NSIS\makensis" famitracker.nsi`
 4. in the (output)[./output] directory, you'll find the installer;
 
## What to do when a new version is released?

* You'll need to change:

  * on line 14, the `VERSION` value;
  * on line 18, the `COMPILE_DATE` value;

