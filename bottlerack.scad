bottle_radius = 34.5; //Maximum radius of bottles (or cans) you would like to hold
bottle_length = 80; //The length along the bottle that maintains it's max radius
segments = 3; // How many bottles wide you'd like the rack to be
bottle_spacing = 5; // the distance between bottles
strip_thickness = 5; // The thickness of the strips
bottom_thickness = 4; // The distance the containers will be held above the surface

rack(bottle_length, strip_thickness, bottom_thickness, bottle_spacing, bottle_radius, segments);

module bottle(height, radius)
{
    rotate([90,0,0]) cylinder(h=height,r=radius) ;
}

module strip(thickness, lift, post_width, radius, n) {
    difference() {
        cube([
            rack_length(radius, post_width, n),
            thickness,
            radius + lift]);
        for (x = [
                0:
                radius*2 + post_width:
                radius*2*(n-1) + (post_width*(n-1))]) {
            
            translate ( [ x + radius + post_width, thickness + 1, radius + lift]            ) bottle(thickness + 2, radius);
            
        }
    }
}

module brace(height, width, length){
    
}

function rack_length (radius, spacing, segments) = radius*2*(segments) + (spacing*(segments+1));

module rack(depth, thickness, lift, spacing, radius, segments) {
    strip(thickness=thickness, lift=lift, post_width=spacing, radius=radius, n=segments);
    translate([0,depth-thickness, 0]) strip(thickness=thickness, lift=lift, post_width=spacing, radius=radius, n=segments);
    echo("The rack will be ", rack_length(radius, spacing, segments) , " units wide");
        
    
    for (x = [0:(radius*2+spacing):rack_length(radius, spacing, segments)]){
        translate([x,0,0]) cube([spacing, depth, lift]);
    }
}