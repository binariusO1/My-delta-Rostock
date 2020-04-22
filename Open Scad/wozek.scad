include <cogsndogs.scad>

/*
    WÓZEK
*/
$fn=50;
h=30;
w=60;

use_stls=true;

module wozek()
{
    union(){
    difference(){
    difference(){
    difference(){
    union(){
    union(){
    difference(){
    difference(){
    difference(){
    union(){
    translate([0, 0, h/2]) cube([16, w, h], center=true);
        
    
    for(x=[-w/2,w/2])
    {
    translate([0, x, h/2]) cylinder(r=10, h=h, center=true);
    }
    }
    //Obcięcie konstrukcji
    //color([0, 0.5, 1, 0.45]) 
    translate([-10+1.5, 0, 18]) cube([20, w+40, h+10], center=true);
    }
    //color([0, 0.5, 1, 0.45]) 
    translate([-10+1.5+1.5, 0, 18]) cube([20, 41, h+10], center=true);
    }
    for(x=[-w+10.5,w-10.5])
    {
    //color([0, 0.5, 1, 0.45]) 
    translate([4, x, 18]) cube([10, 20, h+10], center=true);
    }
    }
    difference(){
    union(){
    for(x=[-25-8.2,-25+8.2,25-8.2,25+8.2])
    {
    translate([14, x, h-5]) cube([16, 6, 10], center=true);
    translate([14, x, h/2]) cube([12, 6, 10], center=true);
    translate([22, x, h-5]) rotate([90, 0, 0]) cylinder(r=5, h=6, center=true);
    }
    for(x=[-30.2+0.25,-19.8-0.25,19.8+0.25,30.2-0.25]){
    translate([22, x, h-5]) rotate([90, 0, 0]) cylinder(r=3.5, h=0.5, center=true);
    } 
    }
    color([1, 0, 0.5, 0.45]) 
    translate([20, 0, h/2-4]) rotate([90, 0, 0]) cylinder(d=18, h=80, center=true);
    }
    }
    translate([10, 0, h-5]) cube([8, 8, 10], center=true);
    translate([10, 0, h-5]) cube([8, w+2, 10], center=true);
    translate([14, 0, h-5]) rotate([0, 0, 0]) cylinder(r=3.5, h=10, center=true);
    }
    union(){
    for(x=[-25,25])
    {
    color([1, 0, 0.5, 0.45]) 
    translate([14, x, h-4.5]) rotate([0, 0, 0]) cylinder(d=10.4, h=11.1, center=true);   
    }
    for(x=[-8.65,8.65])
    {
    color([1, 0, 0.5, 0.45]) 
    translate([14, x, h-4.5]) rotate([0, 0, 0]) cylinder(d=10.3, h=11.1, center=true);  
    }
    }
    }

    union(){
    //Otwory
    //2 x ⌀15
    color([1, 0, 0.5, 0.45]) 
    for(x=[-w/2,w/2])
    {
    translate([0, x, h/2]) rotate([0, 0, 0]) cylinder(d=15, h=24, center=true);
    translate([0, x, 18]) rotate([0, 0, 0]) cylinder(d=10, h=40, center=true);
    }
    
    //oś ⌀3 dla ramion
    union(){
    color([1, 0, 0.5, 0.45]) 
    translate([22, 0, h-5]) rotate([90, 0, 0]) cylinder(d=3.1, h=80, center=true);
    for(x=[-25-8.2+2.5,-25+8.2-2.5,25-8.2+2.5,25+8.2-2.5])
    {
    //difference(){
        //union(){
    //translate([22, x, h-5]) rotate([90, 0, 0]) cylinder(d=10, h=2, center=true);
    //translate([22, x, h-5]) cube([8, 2, 14], center=true);
        //}
    //translate([22, x, h-5]) rotate([90, 0, 0]) cylinder(d=6, h=2, center=true);
    //}
    }  
    }
    //oś ⌀3 dla śruby pozycjonującej
    color([1, 0, 0.5, 0.45]) 
    translate([14, 0, h-5]) rotate([0, 0, 0]) cylinder(d=3.5, h=80, center=true);
    }
    }
    //połączenia zip

        color([1, 0, 0.5, 0.45]) 
            for(x=[-w/2,w/2])
            for(z=[8.5,h-8.5])
                
    difference(){
    translate([0, x, z]) cylinder(r=12, h=3, center=true);
    translate([0, x, z]) cylinder(r=9.5, h=3, center=true);
    }
    }
    
    //mocowanie paska zębatego
    difference(){
    union(){
    translate([-7, -13.3-2.5+2+5+0.1, h/2]) cube([22, 6, h], center=true);
    translate([-7, -13.3-2.5, h/2]) cube([22, 5, h], center=true);
    }
                
              //union() 
              //{
              {
              for(j=[-1,1])
              translate([0, 0, h/2+j*8]) 
              {
              translate([-14, -2, 0]) 
              {
          // Push-through M3 screw hole.
              color([1, 0, 0.5, 0.45]) translate([0, -10, 0]) rotate([90, 90, 0])
              cylinder(r=1.65, h=20, center=true);
          // M3 nut holder.
             translate([0, -4.5, 0])
             rotate([0, 0, 90]) rotate([0, 90, 0])
             color([1, 0, 0.5, 0.45]) translate([0, 0, 0])
             cylinder(r=3.4, h=2.5, center=true, $fn=6);
             }
             }
             }
              //color([1, 0, 0.5, 0.45]) translate([-6, -11.55, h/2]) cube([6, 0.5, h], center=true);
    translate([-6, -13.3-2, h/2]) cube([7, 20, 7], center=true);
             //}
         }
    }

}
wozek();


