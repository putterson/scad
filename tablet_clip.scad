$fn=512;

big_width = 7.35;
small_width = 7.1;


end = big_width;
end_tip = big_width-1;
end_height = 0.3;

big = big_width;
big_tip = big_width;
big_height = 0.3;

small_height = 0.9;
small = small_width;

base_height = 4;
base = 15;
base_tip = 10;

union() {
translate([0,0,base_height])
cylinder(small_height,d1=small,d2=small);

translate([0,0,small_height+base_height])
cylinder(big_height,d1=big,d2=big_tip);

cylinder(base_height,d1=base,d2=base_tip);

translate([0,0,base_height+small_height+big_height])
cylinder(end_height, d1=end, d2=end_tip);    
}