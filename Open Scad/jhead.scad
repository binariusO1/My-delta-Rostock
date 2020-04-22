$fn=60;

    aluminum = [0.92, 0.92, 0.92];
    
module dysza()
{
    union(){
    translate([0,0,1.1+3.9/2]) cylinder(d=8, h=3.9, center=true, $fn=6);
    translate([0,0,1.1/2]) cylinder(d1=0.4, d2=4, h=1.1, center=true, $fn=50);
    }
}
module blok_grzejny()
{
        color(aluminum,1)
        difference(){
    difference(){
    translate([0,0,6]) cube([20,16,12], center=true);
    rotate([0,0,0]) translate([5,0,0]) cylinder(d=6, h=30, center=true);
    }
    rotate([90,0,0]) translate([-6,6,0]) cylinder(d=4, h=30, center=true);
}
}
module radiator()
{
    color(aluminum,1)
    difference(){
    difference(){
    union(){
    for(i=[0:10])
    {
        translate([0,0,i*2.6])
    cylinder(d=22.8, h=0.8, center=true);
    }
    union(){
    translate([0,0,43/2]) cylinder(d=8, h=43, center=true);
    translate([0,0,43-13/2]) cylinder(d=12, h=13, center=true);
    translate([0,0,43-13+2.8/2+0.6]) cylinder(d=16, h=2.6, center=true);
    translate([0,0,28.6]) cylinder(d=16, h=0.8, center=true);    
    translate([0,0,43-3.7/2]) cylinder(d=16, h=3.7, center=true);     
    }
    }
    translate([0,0,43-14/2+1]) cylinder(d=10, h=15, center=true);   
    }
    translate([0,0,16/2-1]) cylinder(d=7, h=17, center=true);  
    }
}

module jhead()
{
    translate([-6.5,0,0]) dysza();
    translate([0,0,5]) blok_grzejny();
    translate([-6.5,0,12+5.4+2.5]) radiator();
}

jhead();
