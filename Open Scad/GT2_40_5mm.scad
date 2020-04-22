/*
    ZĘBATKA GT2 40 5mm
*/

$fn = 16;

aluminum = [0.92, 0.92, 0.92];

module GT2_40_5mm()
{
{
    h=1;
    hh=0.5;
    h2=7.35;
    h3=0.5;
    L=20;
    d=25;
    h4=0.5;
    
    //walec
    color(aluminum,1)
    
    difference() 
    {
    difference() 
    {
    difference() 
    {
    union()
    {
    cylinder(  h, d=d, center=false);
        
    translate([0,0,h+hh])
    cylinder(  h2, d=22.4,false);
    
    translate([0,0,h+hh+h2])
    cylinder(  h, d=d,false);
    
    translate([0,0,h+hh+h2+h3])
    cylinder(  L-h-h2-hh-h3-h4, d=16,false);
        
    translate([0,0,L-h4])
    cylinder(  h4, d=16, d2=16-1,false);
        
            //zębatka
      for(i=[0:39])
      {
    rotate(a = [0, 0, 0+(12/2*i)])
    translate([0,0,h2/2+h+hh])
    cube(size = [0.7,24,h2], center = true);
      }
    }
    
      for(i=[0:15])
      {
    rotate(a = [0, 0, (45/4)+(45/2*i)])
    translate([9.7/2,0,h+hh])
    cylinder(  h2, d=1.25,false);
      }
    }
        translate([0,0,-1])
        cylinder(  L+2, d=5,false);
    }

    translate([0,8,15])
    rotate(a = [90, 0, 0])
    cylinder(  1, d=4.25,d2=4,false);
    
    translate([8,0,15])
    rotate(a = [0, 270, 0])
    cylinder(  1, d=4.25,d2=4,false);
    }
    
}
}

GT2_40_5mm();
