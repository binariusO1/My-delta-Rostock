use <platforma.scad>
use <DIN985.scad>
use <DIN912g.scad>
use <DIN988.scad>
use <DIN9021.scad>
use <DIN7991.scad>
use <ramie.scad>
use <jhead.scad>

$fn=120;
/*
    Platforma uzbrojona
*/
ramiona=0;
sruby=0;

module platforma_p(sruby,ramiona,jhead)
{  
    import ("platforma.stl");

    if(sruby==1)
    {
    for(s=[1:3])
    rotate([0,0,s*120]) 
    {
    //śruba obcięta m3
    translate([10,-33,4]) translate([28.8,0,0]) rotate([0,90,0]) DIN912g(3,40);
    translate([10,-33,4]) translate([-48.8,0,0]) rotate([0,270,0]) DIN912g(3,40);
    translate([38,-33,4]) rotate([0,90,0]) rotate([0,0,90]) DIN9021(3); 
    translate([-38-0.8,-33,4]) rotate([0,90,0]) rotate([0,0,90]) DIN9021(3); 
    }
    for(x=[-30,-21.6,20.3,28.5])
    {
    for(s=[1:3])
    rotate([0,0,s*120]) 
    {
    translate([x,-33,4]) rotate([0,90,0]) rotate([0,0,90]) DIN988(3);
    }
    }
    for(x=[-14.5,12])
    {
    for(s=[1:3])
    rotate([0,0,s*120]) 
    {
    translate([x,-33,4]) rotate([0,90,0]) rotate([0,0,90]) DIN985(3);
      }
    }
    } 
    else{}
    if(jhead==1)
    {
      translate([0,6.5,-45.2-14]) rotate([0,0,90]) jhead();
        translate([0,0,9.5-14]) rotate([0,0,180]) mocowanie();
translate([0,0,12.5-14]) rotate([0,0,90]) mocowanie_2();

            }
    else
        {
        translate([0,0,9.5-14]) rotate([0,0,180]) mocowanie();
translate([0,0,12.5-14]) rotate([0,0,90]) mocowanie_2();
        }
      
}
module mocowanie ()
{
    color([0.92, 0.92, 0.92],1)
    difference(){
    difference(){
    minkowski(){
    translate([0,0,0]) cube([3,38,2.5], center=true);
        cylinder(d=20, h=0.5, center=true);
    }
    for(x=[-25,25])
    {
    translate([0,x,0]) cylinder(d=3.3, h=80, center=true, $fn=120);
    }
    }
    union(){
    translate([0,0,0])   cylinder(d=12.1, h=8, center=true, $fn=120);
    translate([-6,0,0])   cube([12.1,12.1,28], center=true);
    }
    }
}

module mocowanie_2()
{
        color([0.92, 0.92, 0.92],1)
        difference(){
    difference(){
    minkowski(){
    translate([0,0,0]) cube([38,3,2.5], center=true);
        cylinder(d=20, h=0.5, center=true);
    }
    union(){
    translate([0,0,0])   cylinder(d=12.1, h=8, center=true, $fn=120);
    translate([0,6,0])   cube([12.1,12,28], center=true);
    }
    }
    for(x=[-25,25])
    {
    translate([x,0,0]) cylinder(d=3.3, h=80, center=true, $fn=120);
    }
    }
}

platforma_p(0,0,0);


//module spr()
//{
    //translate([-21.65,12.5,])   cylinder(d=2, h=080, //center=true, $fn=120);
//}
//spr();


