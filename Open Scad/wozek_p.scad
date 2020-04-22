use <wozek.scad>
use <LM08UU.scad>
use <DIN934.scad>
use <DIN912.scad>
use <DIN912g.scad>
use <DIN988.scad>
use <DIN9021.scad>
use <DIN985.scad>
use <ramie.scad>

/* 
    WÓZEK UZBROJONY
*/
alpha=0;
beta=0;
gamma=0;
alpha2=0;
beta2=0;
gamma2=0;

sruby=1;

module wozek_p(sruby)
{
    import ("wozek.stl");
    //wozek();
    translate ([0,30,3]) LM08UU();
    translate ([0,-30,3]) LM08UU();

    if(sruby==1)
    {
    //śruba m3 pod krańcówkę
    translate ([14,0,17.5]) DIN934(3);
    translate ([14,0,40]) DIN912g(3,25);
    
    for(x=[-25-8.2+4.7,-25+8.2-3.5,25-8.2+4.7,25+8.2-3.5])
    {
    translate ([22,x,25]) rotate([90,0,0]) DIN988(3);
    }
    //śruba m3 docięta od końca o 10mm
    translate([22,12.5,25]) rotate([90,0,0]) DIN912g(3,40);
    translate([22,-12.5,25]) rotate([270,0,0]) DIN912g(3,40);
    
    translate([22,13.3,25]) rotate([90,0,0]) DIN9021(3);
    translate([22,-13.3,25]) rotate([270,0,0]) DIN9021(3);
    
    translate([22,37.4,25]) rotate([90,0,0]) DIN9021(3);
    translate([22,-37.4,25]) rotate([270,0,0]) DIN9021(3);
    
    translate([22,37.4,25]) rotate([270,0,0]) DIN985(3);
    translate([22,-37.4,25]) rotate([90,0,0]) DIN985(3);
    }
    else{}
    //translate([22,25,25]) rotate([270,0,0]) ramie(alpha,beta,gamma,0,0,0,0);
    //translate([22,-25,25]) rotate([270,0,0]) ramie(alpha,beta,gamma,0,0,0,0);
}
wozek_p(1);