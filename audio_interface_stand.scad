include <audio_interface.scad>

$fn=128;



depth = 113.5;
width = 43;
height = 165;
thickness = 4;
lip=3;
corner_r=8;


difference() {
//    audio_interface(depth+thickness*2,width+thickness*2, height/4, corner_r);
    cube([width+thickness*2,depth+thickness*2,height/5]);
    
    //Subtract the audio interface
    translate([thickness,thickness,thickness])
    audio_interface(depth, width, height, corner_r);
    
    //Subtract front and back face openings
    translate([thickness+lip,0,thickness+lip])
    audio_interface(depth+thickness*2, width-lip*2, height, corner_r-lip);
    
    //Subtract side openings
    translate([width+1+thickness*2,thickness+lip,thickness])
    rotate([0,0,90])
    audio_interface(width+1+thickness*2, depth-lip*2, height, corner_r);
    
    //Subtract bottom opening
    translate([thickness+lip, depth, 0])
    rotate([90,0,0])
    audio_interface(height/5, width-lip*2, depth-thickness*2, 5);
}
