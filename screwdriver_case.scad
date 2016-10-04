use <Hexagones.scad>;
$fn = 150 ;			// OpenSCAD Resolution
cornerwidth = 0;//1.1547;
ymovewidth = 4.5*2;//3.4641 * 1.5 * 2;
wallwidth = 1;
// hexagone de 1 pouce (1 inch) soit 25.4 mm
//Hexagone(cle=6,h=10)
//for (y = [-10:ymovewidth-cornerwidth:10]) {
//for (x = [-10:6-wallwidth:10]) {
//    translate ([x,y,5]) difference() {
//        Hexagone(cle=6,h=10);
//        translate([0,0,1]) cylinder(d=4.1,h=9, center = true);
//    }
//}
//}
//
//for (y = [-10:ymovewidth-cornerwidth:10]) {
//for (x = [-10:6-wallwidth:10]) {
//    translate ([x+2.5,y+4.5,5]) difference() {
//        Hexagone(cle=6,h=10);
//        translate([0,0,1]) cylinder(d=4.1,h=9, center = true);
//    }
//}
//}
difference(){
    cube([25,25,10]);


        for (y = [4.5:8:25]) {
                for (x = [4.5:8:25]){
            translate([x,y,6]) Hexagone(cle=4.2,h=8);
                }
            translate([12.5,y,6]) cube([25,2.5,8],center=true);
        }

    
    

}

        