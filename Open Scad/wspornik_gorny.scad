include <konfiguracja.scad>

wysokosc_wozka=32;
h=wysokosc_wozka;
$fn = 120;
w = 60;
//h=wysokosc_wozka;
dystans_endstopa=1;
odsuniecie_endstopa=1;
tilt = 1; // Tilt bearings upward (the timing belt is pulling pretty hard).
          // 2 degree tilt caused belts to slide off the bearings
          
x = 17.7; // Micro switch center.
y = 16; // Micro switch center.
endstop=1;
module bearing_mount() {
  translate([0, 0, 2.3]) cylinder(r1=12, r2=9, h=1.1, center=true);
  translate([0, 0, -2.3]) cylinder(r1=12, r2=10, h=1.1, center=true);
}

module wspornik_gorny()
{
                              difference() 
    {
                        union() 
    {
                          difference() 
    {
                    union() 
    {
                      difference() 
    {
                  difference() 
    {
              difference() 
    {
          difference() 
    {
        union() 
    {
      difference() 
    {
    union() 
        {
        translate([0, -1, 0]) cube([w+12, 22, h], center=true);
        }
    // Smooth rod mounting slots.
    for (x = [-w/2, w/2]) 
        {
      translate([x, 0, 0]) 
            {
	cylinder(r=4.25, h=h+1, center=true);
	translate([0, -10, 0]) cube([2, 20, h+1], center=true);
      }
    }
        // Belt path.
        translate([0, -5, 0]) cube([w-20, 20, h+1], center=true);
    translate([0, -9, 0]) cube([w-12, 20, h+1], center=true);
    translate([-w/2+10, 1, 0]) cylinder(r=4, h=h+1, center=true);
    translate([w/2-10, 1, 0]) cylinder(r=4, h=h+1, center=true);
  }
        for (x = [-w/2, w/2]) 
          {
          translate([x, 14, 8]) 
          {
          translate([0, 0, 1]) cube([12, 8, h/2-2], center=true);
          translate([0, -2, -9]) cube([12, 6, 6], center=true);
          translate([0, 4, 1]) cylinder(r=6, h=h/2-2, center=true);
          }
          }
      }
      
          union() 
          {
          rotate([0,90,0]) translate([4, 22-6, 0]) cylinder(r=6, h=w+14, center=true);
          //translate([0, 22-6, -12]) cube([w+14, 12, 12], center=true);
          }
          }
          for (x = [-w/2, w/2]) 
          {
          color([1, 0, 0.5, 0.45]) rotate([0,0,0]) translate([x, 18, 0]) cylinder(r=2.25, h=w+14, center=true);
          //color([1, 0, 0.5, 0.45]) rotate([0,0,0]) translate([x, 18+30, 0]) cylinder(r=2, h=w+14, center=true);
          }
          //m4
      }
          
              union() 
              {
              {
              for(j=[1,2])
              translate([0, 0, j*16-24]) 
              {
              for (x = [-w/2, w/2]) 
              {
              translate([x, 0, 0]) 
              {
          // Push-through M3 screw hole.
              color([1, 0, 0.5, 0.45]) translate([0, -6, 0]) rotate([0, 90, 0])
              cylinder(r=1.65, h=20, center=true);
          // M3 nut holder.
             translate([-x/6, -6, 0])
             rotate([30, 0, 0]) rotate([0, 90, 0])
             color([1, 0, 0.5, 0.45]) translate([0, 0, 0])
             cylinder(r=3.4, h=2.5, center=true, $fn=6);
             }
             }
             }
             }
             }
         }

              for (x = [-w/2, w/2]) 
              {
             translate([x, 18, 0])
             rotate([30, 90, 0]) rotate([0, 90, 0])
             color([1, 0, 0.5, 0.45]) translate([0, 0, -1.6])
             cylinder(r=4.5, h=3.3+0.5, center=true, $fn=6);
              }
          }
          //Otwór ⌀8
      translate([0, 7.5, 1]) rotate([90 - tilt, 0, 0]) bearing_mount();
      }

          color([1, 0, 0.5, 0.45]) 
          translate([0, 8, 1]) rotate([90 - tilt, 0, 0]) cylinder(r=4.2, h=40, center=true);
  }
            
  //Montaż endstopa
          translate([-10, 10, -h/2]) cube([20, dystans_endstopa, 10], center=false);
  //endstop
  if (endstop==1){
                % translate([-19.6/2, 10+dystans_endstopa, -h/2-odsuniecie_endstopa])
          cube([19.6, 6.34, 10.2], center=false);}else{}
  }
  
            color([1, 0, 0.5, 0.45]) 
                for(j=[-1,1])
              translate([0, 0, 0]) 
              {
          translate([9.5/2*j, 10, -h/2+5-odsuniecie_endstopa]) rotate([90, 0, 0]) cylinder(d=3, h=30, center=true);
                            translate([9.5/2*j, 3+3.7, -h/2+5-odsuniecie_endstopa]) rotate([90, 0, 0]) cylinder(d=6, h=3.5, center=true);
              }
          }
        
}
translate([0, 0, 12]) wspornik_gorny();
