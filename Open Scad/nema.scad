/*
NEMA 17
*/

$fa = 2;   // Minimum angle for circle segments.
$fs = 0.5; // Minimum size for circle segments.
$fn = 32;
aluminum = [0.9, 0.9, 0.9];
steel = [0.8, 0.8, 0.9];

motor_screw = 15.5;
motor_diagonal = sqrt(2 * motor_screw * motor_screw);

module nema17(length) 
{
  color([0.7, 0.7, 0.7])
difference() 
{
    {
            render() 
            {
            translate([0, -length/2-17, 0])
            intersection() 
            {
                cube([42.3, length, 42.3], center=true);
                rotate([0, 45, 0]) cube([52, length, 52], center=true);
            }
            translate([0, -17, 0]) rotate([90, 0, 0])
            cylinder(r=11, h=2, center=true);
            }

    }
          for(i=[1:4])
      {
          rotate([0, 90*i, 0])
          translate([31/2, -18.5, 31/2]) rotate([90, 0, 0])
          cylinder(d=3, h=4.5, center=true);
      }
}
        color(steel)
        translate([0, -length/2-7, 0]) rotate([90, 0, 0])
        cylinder(r=2.5, h=length+22, center=true);
}



nema17(48);
