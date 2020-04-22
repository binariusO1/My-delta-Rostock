/*
    ŁOŻYSKO F608ZZ Z FLANSZĄ
*/

$fn = 40;

F608ZZ();
module F608ZZ()
{
    aluminum = [0.92, 0.92, 0.92];
    color(aluminum,1)
    difference()
    {
    union()
    {
    cylinder(h=7, d=22, center=false);
    cylinder(h=1.5, d=25, center=false);
    }
    translate([0,0,-1])
    cylinder(h=9, d=8, center=false);
    }
}