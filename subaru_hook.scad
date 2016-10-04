/*
    A replacement/improved hook for the trunk in a 2013 Subaru Impreza Hatchback
*/

plugHeight=12.5;
plugBaseDiameter=19.5;
plugTipdiameter=19;
plugScrewHoleDiameter=6.9;
plugScrewFlangeThickness=2;
plugInternalDiameter=14.7;

baseMajorDiameter=40;
baseMinorDiameter=35;
baseThickness=4;



difference(){
    //plug
    cylinder($fn=64, d1=plugBaseDiameter, d2=plugTipdiameter, h=plugHeight);
    //minus screw hole
    cylinder($fn=64, d=plugScrewHoleDiameter, h=plugHeight);
    //minus internal hole + screw flange
    cylinder($fn=64, d=plugInternalDiameter, h=plugHeight-plugScrewFlangeThickness);
}