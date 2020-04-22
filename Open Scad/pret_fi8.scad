
/*
    PRĘT ⌀ 8
*/

$fn = 32;

pret_fi8(750,8);
module pret_fi8(wysokosc,srednica)
{
    aluminum = [0.92, 0.92, 0.92];
    color(aluminum,1)
    cylinder(h=wysokosc, d=srednica, center=false);
}