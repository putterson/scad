$fn=256;

opening=67;
opening_thickness=2;
wall=2.5;

rotate([180,0,0])
union() {
    difference() {
        cylinder(d=wall+opening, h=opening_thickness);
        cylinder(d=opening, h=opening_thickness);
    }

    translate([0,0,opening_thickness]){
        difference() {
            cylinder(d1=wall+opening,d2=opening,h=3);
            cylinder(d=opening-wall,h=3);
        }
    }
    
    //top grate
    union(){
        intersection() {
            union() {
                for(x = [-(opening/2):7:(opening/2)]){
                    translate([x,-(opening/2),opening_thickness+3]){
                        cube([2,opening,1]);
                    }
                }
                
                rotate([0,0,90])
                for(x = [-(opening/2):7:(opening/2)]){
                    translate([x,-(opening/2),opening_thickness+3]){
                        cube([2,opening,1]);
                    }
                }
            }            
                    
            translate([0,0,opening_thickness+3]){
                        cylinder(d=opening, h=1);
            }
        }
        
        translate([0,0,opening_thickness+3]){
            difference() {
                cylinder(d=opening,h=1);
                cylinder(d=opening-wall,h=1);
            }
        }
        
    }
}