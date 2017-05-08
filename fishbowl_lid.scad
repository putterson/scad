$fn=256;

opening=67*2;
opening_thickness=2;
wall=3;
wall_h=6;

grate_h=2;
grate_bar_width=3;
grate_spacing=7;

notch_w=13;
notch_h=8;

module snap(r,l) {
    rotate([90,0,0]) cylinder(r=r,h=l,center=true);
}

module grate(w,h,d,space) {
    union() {
        for(x = [-(d/2):space+w:(d/2)]){
            translate([x,0,h/2]){
                cube([w,d,h], center=true);
            }
        }        
        
        for(x = [-(d/2):space+w:(d/2)]){
            rotate([0,0,90])
            translate([x,0,h/2]){
                cube([w,d,h], center=true);
            }
        }
    } 
}

module lid() {
    rotate([180,0,0])
    union() {
        difference() {
            cylinder(d=wall+opening, h=opening_thickness);
            cylinder(d=opening, h=opening_thickness);
        }

        translate([0,0,opening_thickness]){
            difference() {
                cylinder(d1=wall+opening,d2=opening,h=wall_h);
                cylinder(d=opening-wall,h=wall_h);
            }
        }
        
        //top grate
        union(){
            intersection() {
                translate([0,0,opening_thickness+wall_h]) 
                    cylinder(d=opening, h=grate_h);
                translate([0,0,opening_thickness+wall_h]) 
                    grate(w=grate_bar_width,d=opening,h=grate_h,space=grate_spacing);
            }
            
            translate([0,0,opening_thickness+wall_h]){
                difference() {
                    cylinder(d=opening,h=grate_h);
                    cylinder(d=opening-wall,h=grate_h);
                }
            }
            
        }
        
        //snaps
        rotate([0,0,180])
        for(theta=[0,120,240]) {
            rotate([0,0,theta])
            translate([opening/2 + wall/4,0,0])
            snap(1.2,2.5);
        }
    }
}


difference() {
    lid();
    translate([opening/2, 0, -(notch_h-1)/2]) cube([notch_w,notch_w,notch_h+1], center=true);
}