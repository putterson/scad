$fn = 25;

difference (){
difference () {
cylinder(60, d=20,center=false);
translate([0,0,3]){cylinder(60, d=15);}
}

difference () {
    cylinder(20, d=22);
    cylinder(20, d=18);
}
}