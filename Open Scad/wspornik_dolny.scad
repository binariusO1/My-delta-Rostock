include <konfiguracja.scad>

/*
    WSPORNIK DOLNY KONSTRUKCJI
*/

$fn = 120;
w = 60;
h=wysokosc_podstawy;
    a=38;   //wysunięcie ramion
    e=38;   //wzmocnienie (promień zaokrąglenia)
    b=14;   //grubość ramion
    r=6;    //promień zaokrąglenia ramion
    c=2;    //grubość ścianki wzmacniającej
module wspornik_dolny()
{
    //Podstawowa konstrukcja
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
    //Ramiona podtrzymujące podstawę dolną
    for (x = [-w/2, w/2]) 
    {
    difference()
    {
    union()
    {
    translate([x, a/2+10,h/2-b/2]) cube([12, a, b], center=true);
    translate([x, a+10,h/2-b/2]) cylinder(r=r, h=b, center=true);
    translate([x, 10+r/2,h/2-r/2-b]) cube([12, r, r], center=true);
    }
    //Zaokrąglenie ramion
    translate([0, 10+r, h/2-r-b]) rotate([0, 90, 0]) cylinder(r=r, h=w+20, center=true);
    }
    }
        //Wzmocnienie trójątne boczne
        difference()
        {
            union()
            {
        for (x = [-w/2-6+c/2, w/2+6-c/2]) 
        {
        translate([x, e/2+10,h/2-b-e/2]) cube([c, e, e], center=true);
        }
        for (x = [-w/2+6-c/2, w/2-6+c/2]) 
        {
        translate([x, e/2+10,h/2-b-e/2]) cube([c, e, e], center=true);
        }
            }
        color([1, 0, 0.5, 0.45]) translate([0, 10+e, h/2-b-e]) rotate([0, 90, 0]) cylinder(r=e, h=w+20, center=true);
        }

    }
    
    
      //Otwór ⌀24 na zębatkę
      color([1, 0, 0.5, 0.45]) translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(d=24, h=40, center=true);
        //2 x 2 Otwory ⌀4 na śrubę mocującą dolną podstawę
          for (x = [-w/2, w/2]) 
          {
          color([1, 0, 0.5, 0.45]) rotate([0,0,0]) translate([x, 18, 0]) cylinder(r=2.25, h=w+14, center=true);
          color([1, 0, 0.5, 0.45]) rotate([0,0,0]) translate([x, 48, 0]) cylinder(r=2.25, h=w+14, center=true);
        //2 x 2 Otwory spodnie na nakrętkę M4
             translate([x, 18, h/2-b+3.8/2-0.2])
             rotate([30, 90, 0]) rotate([0, 90, 0])
             color([1, 0, 0.5, 0.45]) translate([0, 0, 1])
             cylinder(r=4.5, h=3.3+0.5+2, center=true, $fn=6);
             translate([x, 18+30, h/2-b+3.8/2-0.2])
             rotate([30, 90, 0]) rotate([0, 90, 0])
             color([1, 0, 0.5, 0.45]) translate([0, 0, 1])
             cylinder(r=4.5, h=3.3+0.5+2, center=true, $fn=6);
          }
        //3 x 2 Otwory boczne na śrubę M3
        //3 x 2 Otwory boczne na nakrętkę M3
              union() 
              {
              {
              for(j=[1,2,3])
              translate([0, 0, j*16-32]) 
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
                 // Motor mounting screw slots
             {
                 m=29;
    translate([m/2, 0, m/2]) rotate([0, -45, 0])
      cube([9, 40, 3.5], center=true);
    translate([-m/2, 0, m/2]) rotate([0, 45, 0])
      cube([9, 40, 3.5], center=true);
    translate([m/2, 0, -m/2]) rotate([0, 45, 0])
      cube([9, 40, 3.5], center=true);
    translate([-m/2, 0, -m/2]) rotate([0, -45, 0])
      cube([9, 40, 3.5], center=true);
             }
         }
  }
}
wspornik_dolny();