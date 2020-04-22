/*
Heatbed MK3Y
*/

$fn = 36;

heatbed();
module heatbed()
{
    
                difference() 
    {
    aluminum = [0.92, 0.92, 0.92];
    color(aluminum,1)
    cylinder(h=3, d=220, center=false);
    
          for(i=[1:6])
      {
    rotate(a = [0, 0, (60*i)])
    translate([0,104.5,-1])
          
    cylinder(h=5, d=3, center=false);
          
              rotate(a = [0, 0, (60*i)])
    translate([0,104.5,2])
        cylinder(h=1.1, d=3, d2=6, center=false);      
      }
    }
}