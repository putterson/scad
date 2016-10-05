/*
    A replacement/improved hook for the trunk in a 2013 Subaru Impreza Hatchback
*/

$fs=.5;
$fa=0.5;

plugHeight=12.5;
plugBaseDiameter=19.5;
plugTipDiameter=19;
plugScrewHoleDiameter=6.9;
plugScrewFlangeThickness=2;
plugInternalDiameter=14.7;

baseMajorDiameter=40;
baseMinorDiameter=35;
baseMajorMinorRatio=baseMajorDiameter/baseMinorDiameter;
baseThickness=4;

hookDepth=15;
hookThickness=5;
hookLength=50;


//Plug Section
module plug() {
    difference(){
        //plug
        cylinder(d1=plugBaseDiameter, d2=plugTipDiameter, h=plugHeight);
        //minus screw hole
        cylinder(d=plugScrewHoleDiameter, h=plugHeight);
        //minus internal hole + screw flange
        cylinder(d=plugInternalDiameter, h=plugHeight-plugScrewFlangeThickness);
    }
}

//Base section
module base() {
    difference() {
        scale([1.0,baseMajorMinorRatio,1.0]) cylinder(d=baseMinorDiameter, h=baseThickness);
        cylinder(d=plugInternalDiameter, h=baseThickness);
    }
}

//Hook section
module hook() {
    difference() {
        union(){
            translate([-(plugTipDiameter/2),0,0]) {
                translate([(plugTipDiameter/2),hookLength,0]) cylinder(d=plugTipDiameter,hookThickness);
                cube([plugTipDiameter,hookLength,hookThickness]);
            }
            scale([1.0,baseMajorMinorRatio,1.0]) cylinder(d2=baseMinorDiameter, d1=plugTipDiameter,h=hookDepth);
        }
        cylinder(d=plugInternalDiameter, h=hookDepth);
//        difference(){
//            translate([-(plugTipDiameter/2),0,hookThickness]) cube([plugTipDiameter,hookLength,hookThickness]);
//            translate([0,0,hookThickness]) cylinder(d=plugTipDiameter,hookThickness);
//        }
    }

}

union() {
    translate([0,0,hookDepth]){
        translate([0,0,baseThickness]){ 
            plug();
        }
        base();
    }
    hook();
}
//
//
//        difference(){
//            translate([-(plugTipDiameter/2),0,hookThickness]) cube([plugTipDiameter,hookLength,hookThickness]);
//            translate([0,0,hookThickness]) cylinder(d=plugTipDiameter,hookThickness);
//        }