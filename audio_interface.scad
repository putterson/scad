module audio_interface(depth, width, height, corner_radius) {
    translate([0,depth,0])
    rotate([90,0,0])
    hull() {
        translate([corner_radius,corner_radius,0]) 
        cylinder(h=depth,r=corner_radius);
        
        translate([width-corner_radius,corner_radius,0]) 
        cylinder(h=depth,r=corner_radius);
        
        translate([corner_radius,height-corner_radius,0]) 
        cylinder(h=depth,r=corner_radius);
        
        translate([width-corner_radius,height-corner_radius,0]) 
        cylinder(h=depth,r=corner_radius);
    }
}