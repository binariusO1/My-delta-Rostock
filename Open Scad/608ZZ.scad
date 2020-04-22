/*
    ŁOŻYSKO 608ZZ
*/

$fn = 40;

608ZZ();
module 608ZZ()
{
    aluminum = [0.92, 0.92, 0.92];
    color(aluminum,1)
    difference()
    {
    cylinder(h=7, d=22, center=false);
        translate([0,0,-1])
        cylinder(h=9, d=8, center=false);
    }
}

echo("Łożysko 608ZZ");