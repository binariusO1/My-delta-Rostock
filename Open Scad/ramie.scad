include <konfiguracja.scad>

/*
    SNAP KULOWY
*/

$fn = 50;

//zmiana kątowa ramienia
alpha=0;    //13 stopni max
beta=0;     //13 stopni max
gamma=0;

//zmiana kątowa kuli na końcu ramienia
alpha2=0;    //13 stopni max
beta2=0;     //13 stopni max
gamma2=0;

pret_metalowy=1;
//pret_metalowy=1 pret_weglowy=0

os=1;   //pomocnicze osie   

gwint=4;                        //gwint prętu M4
srednica_pretu_weglowego=3.5;   //średnica prętu węglowego

    steel = [0.8, 0.8, 0.9];
    black = [0, 0, 0];
    
//TRAXXAS 5347 SNAP Z KULAMI
ramie(alpha,beta,gamma,alpha2,beta2,gamma2,os);

module ramie(alpha,beta,gamma,alpha2,beta2,gamma2,os)
{
    kula();
    rotate([alpha,beta,gamma]) 
    union(){
    union()
    {
    translate([256.8,0,0]) rotate([0,180,0]) obudowa();
    obudowa();
    translate([15,0,0]) rotate([0,90,0]) if (pret_metalowy==1) pret_m4(gwint); else pret_weglowy(srednica_pretu_weglowego);
    translate([256.8,0,0]) rotate([alpha2,beta2,gamma2]) kula();
    }
    if(os==1)
    {
    color([1, 0, 0.5, 0.45]) 
    translate([0, 0, 0]) rotate([0,0,0]) cylinder(h=50, d1=3, center=true);
    color([1, 0, 0.5, 0.45]) 
    translate([256.8, 0, 0]) rotate([0,0,0]) cylinder(h=50, d1=3, center=true);
    }
    else{}
    }
}

module obudowa()
{
        difference()
    {
            union()
    {
    difference()
    {
        union()
        color([0, 0, 0, 1])
        {
    cylinder(h=3, d=10, center=true);
    translate([5, 0, 0]) cube([10, 10, 3], center=true);
    translate([22-5-4, 0, 0]) rotate([0,90,0]) cylinder(h=10+8, d1=6.5, d2=8, center=true);
    translate([12.8, 0, 0]) cylinder(h=3, d=11.5, center=true, $fn=3);
        }
    cylinder(h=5, d=5, center=true);; 
    }
    //color([0.92, 0.92, 0.92, 1])
    //cylinder(h=3, d=5, center=true);
    }

    union()
    color([0, 0, 0, 1])
    { 
    translate([22, 0, 0])
    rotate([0,90,0])
    cylinder(h=10, d=4, center=true);
     
    translate([0, 0, 0])
    cylinder(h=5, d=3, center=true);
    
    for(i=[1:2])
    rotate([180*i,0,0])
    {
    translate([8, 0, 4.4]) rotate([0,-8,0]) cube([10, 10, 3], center=true);
    }
    }
    }
}

module kula()
{
    difference(){
    difference(){
    color([0.92, 0.92, 0.92, 1])
    union(){
    sphere(3); 
    translate([0,0,-5]) sphere(3); 
    translate([0,0,5]) sphere(3); 
    }
    translate([0, 0, 6]) cube([10, 10, 5], center=true);
    translate([0, 0, -6]) cube([10, 10, 5], center=true);
    }
    cylinder(d=3, h=9, center=true);
    }
}

module pret_m4(gwint)
{
    color([0.8, 0.8, 0.9,1])
    cylinder(h=dlugosc_ramion-30, d=gwint, center=false);
}
module pret_weglowy(srednica_pretu_weglowego)
{
    color([0, 0, 0, 1])
    cylinder(h=rod_length-30, d=srednica_pretu_weglowego, center=false);
}
