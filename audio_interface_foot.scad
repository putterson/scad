include <audio_interface.scad>

$fn=128;



depth = 113.5;
width = 43;
height = 165;
thickness = 4;
lip=3;
corner_r=8;


intersection(){
translate([thickness+lip, depth, 0])
rotate([90,0,0])
audio_interface(thickness, width-lip*2, depth-thickness*2, 5);

translate([width,thickness+lip,0])
rotate([0,-35,0])
cube([width-lip*2,depth-thickness*2,thickness]);
}