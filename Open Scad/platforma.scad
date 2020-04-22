include <konfiguracja.scad>
use <carriage.scad>

h=grubosc_platformy;

cutout = 12.5;
inset = 6;
$fn=120;

module platforma() 
{
  translate([0, 0, h/2]) 
    union(){
    difference(){
  difference() {
    union() {
      for (a = [0:120:359]) {
        rotate([0, 0, a]) {
          translate([0, -platform_hinge_offset, 0]) parallel_joints();
          // Close little triangle holes.
          translate([0, 31, 0]) cylinder(r=5, h=h, center=true);
          // Holder for adjustable bottom endstops.
          //translate([0, 45, 0]) cylinder(r=5, h=h, center=true);
        }
      }
      cylinder(r=30, h=h, center=true);
    }
    cylinder(r=20, h=h+12, center=true);
    //for (a = [0:2]) {
      //rotate(a*120) {
        //translate([0, -25, 0])
          //cylinder(r=2.2, h=h+1, center=true, $fn=12);
        // Screw holes for adjustable bottom endstops.
        //translate([0, 45, 0])
          //cylinder(r=1.5, h=h+1, center=true, $fn=12);
      //}
    //}
	// Added extra set of holes 
    rotate([0,0,180]) for (a = [0:5]) {
      rotate(a*60) {
        translate([0, -25, 0])
          cylinder(r=2.65, h=h+1, center=true, $fn=120);
      }
    }
  }
  for(x=[-25,25])
  {
      for(s=[1:3])
    rotate([0,0,s*120]) 
      {
          color([1, 0, 0.5, 0.1]) 
          translate([x,-32,5]) cube([9.4, 10, 10], center=true);
      }
  }
  }
  //zaślepienie otworów fi5,5 mniejszym 3,1
    for(x=[-36.5,36.5])
  {
      for(s=[1:3])
    rotate([0,0,s*120]) 
      {
          //color([1, 0, 0.5, 1]) 
          difference()
          {
          translate([x,-33,0]) rotate([0,90,0]) cylinder(d=6, h=3, center=true);
                        translate([x,-33,0]) rotate([0,90,0]) cylinder(d=3.1, h=5, center=true, $fn=120);
          }
      }
  }
  }
}
          color([1, 0, 0.5, 1]) 
        translate([2, -33, 4]) rotate([0,90,0])
          cylinder(r=1, h=h+1, center=true, $fn=120);
platforma();
//projection(cut = false) platforma();