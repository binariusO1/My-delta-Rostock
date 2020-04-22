include <konfiguracja.scad>


h=wysokosc_konstrukcji-42.3/2-5-14.95;

module tasma()
{
    color([0, 0, 0.0, 1]) 
    cube([6,1.38,h],center=true);
}
translate([0,0,h/2]) tasma();