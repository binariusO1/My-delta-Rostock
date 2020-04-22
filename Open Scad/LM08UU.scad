/*
ŁOŻYSKO LINIOWE LM8UU


*/

$fn = 40;
steel = [0.8, 0.8, 0.9];
LM08UU();
module LM08UU()
    {
        
    translate([0,0,24/2])
    color(steel) render() difference() 
    {
        cylinder(h=24, r=7.5, center=true);
        cylinder(h=30, r=4, center=true);
    }
}