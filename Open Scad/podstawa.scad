/*
    PODSTAWA DOLNA I GÓRNA
*/

include <konfiguracja.scad>

$fn = 20;
tr=1.3;     //mnożnik podstawy
echo(promien_podstawy*tr);

            czarny = [0, 0, 0, 0.75];
            aluminum = [0.92, 0.92, 0.92, 1];
            purple =[0.5,0,0.5,0.4];
            
module podstawa_dolna()
{
    color(purple)
    difference(){
    minkowski() 
    {
        intersection() 
        {
        rotate(90)
        circle(r=promien_podstawy*sqrt(2),$fn=3,center=true);
        rotate(270)
        circle(r=promien_podstawy*tr*sqrt(2),$fn=3,center=true);
        }
    circle(r=corner_radius);
    }
    //mocowanie na wsporniki dolne
    for(x=[-30,30])
    {
    for(i=[1:3])
    rotate(120*i,0,0)
    {
    translate([x,promien_konstrukcji-18,0]) circle(r=2.15,$fn=50,center=true);
    translate([x,promien_konstrukcji-48,0]) circle(r=2.15,$fn=50,center=true);
    }
    //heatbed mky3 (fi210)
    for(i=[1:6])
    rotate(60*i,0,0)
    {
    rotate(a = [0, 0, 0]) translate([0,104.5,2]) circle(r=1.65,$fn=50,center=true);
    }
    }
    //fanmount 30x30
    translate([15,promien_konstrukcji-100,0]) circle(r=1.65,$fn=50,center=true);
    translate([-15,promien_konstrukcji-100,0]) circle(r=1.65,$fn=50,center=true);
    translate([15+25,promien_konstrukcji-100,0]) circle(r=1.65,$fn=50,center=true);
    translate([-15-25,promien_konstrukcji-100,0]) circle(r=1.65,$fn=50,center=true);
    //GT2560
    translate([92.9/2,promien_konstrukcji-130,0]) circle(r=1.65,$fn=50,center=true);
    translate([-92.9/2,promien_konstrukcji-130,0]) circle(r=1.65,$fn=50,center=true);
    translate([92.9/2,promien_konstrukcji-130-71.7,0]) circle(r=1.65,$fn=50,center=true);
    translate([-92.9/2,promien_konstrukcji-130-71.7,0]) circle(r=1.65,$fn=50,center=true);
    }
}
module podstawa_dolna2()
{
    linear_extrude(height=grubosc_podstawy)  podstawa_dolna();
}
    //podstawa_dolna();
    //podstawa_dolna2();

module podstawa_gorna()
{
        color(purple)
        difference(){
        difference(){
        difference()
        {
                minkowski() 
                {
                intersection() 
                {
                    rotate(90)
                    circle(r=promien_podstawy*sqrt(2),$fn=3,center=true);
                    rotate(270)
                    circle(r=promien_podstawy*tr*sqrt(2),$fn=3,center=true);
                }
                circle(r=corner_radius);
                }
            scale(0.5) minkowski() 
            {
            intersection() 
            {
			circle(r=(promien_konstrukcji-srednica_walka/2-corner_radius)/cos(30),$fn=6,center=true);
			rotate(90) circle(r=(promien_konstrukcji-srednica_walka/2-corner_radius)/cos(30)*1.3,$fn=3,center=true);
            }
		circle(r=corner_radius);
            }
      }
      //mocowanie na wsporniki górne
    for(x=[-30,30])
    {
    for(i=[1:3])
    rotate(120*i,0,0)
    {
    translate([x,promien_konstrukcji-18,0]) circle(r=2.15,$fn=50,center=true);
    }
    }
    }
    translate([12.5,-promien_konstrukcji+110,0]) circle(r=2.15,$fn=50,center=true);
    translate([-12.5,-promien_konstrukcji+110,0]) circle(r=2.15,$fn=50,center=true);
    }
}

module podstawa_gorna2()
{
    linear_extrude(height=grubosc_podstawy)   podstawa_gorna();
}
    //podstawa_gorna();
    podstawa_gorna2();

//projection(cut=false) import("ramka.stl");
//projection(cut=false) podstawa_gorna(promien_podstawy,promien_konstrukcji,corner_radius)




