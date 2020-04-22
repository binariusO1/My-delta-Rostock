minclude <konfiguracja.scad>;

use <podstawa.scad>;
use <wspornik_gorny.scad>;
use <wspornik_dolny.scad>;
use <heatbed.scad>;
use <tasma.scad>;

use <nema.scad>;

use <GT2_40_5mm.scad>;
use <pret_fi8.scad>;
use <608ZZ.scad>;
use <F608ZZ.scad>;
//ŚRUBY, PODKŁADKI I NAKRĘTKI
use <DIN912g.scad>;
use <DIN912.scad>;
use <DIN934.scad>;
use <DIN988.scad>;
use <DIN9021.scad>;

use <wozek_p.scad>;
use <platforma_p.scad>;
use <ramie.scad>;

//  Użycie modeli gotowych .stl
//use_stls=false;
use_stls=true;
//  Użycie wyciągniętych brył podstawy górnej i dolnej
podstawa_model=false;
//podstawa_model=true;

sruby=0;
ruchome_elementy=1;

//dlugosc 
 //belt_pulley_diameter = 25+1.2; 
 //belt_idler_diameter = 22+2.8;
 
//części ruchome (animacja)
br=50;
platformxyz = [cos($t * 360) * br, sin($t * 360) * br, 70];

vertical_height = wysokosc_konstrukcji 
				- wysokosc_podstawy 
				- grubosc_podstawy
				- wysokosc_grzalki
				- dlugosc_ramion
				- 30; // 30mm dla grzałki
                
    //  KONSTRUKCJA
module konstrukcja() //render(convexity=2)
{
    // Grzałka
    translate([0, 0, wysokosc_podstawy+grubosc_podstawy+15]) heatbed();
    //  Podstawa dolna 
    color([0.5, 0, 0.5, 0.45]) % translate([0, 0, wysokosc_podstawy]) linear_extrude(height=grubosc_podstawy) podstawa_dolna();
    //  Podstawa górna
    color([0.5, 0, 0.5, 0.45]) if (podstawa_model) translate([0, 0, wysokosc_konstrukcji])podstawa_gorna2(); else  % translate([0, 0, wysokosc_konstrukcji]) linear_extrude(height=grubosc_podstawy) podstawa_gorna();
    //ekstruder
    //(brak)
        
    //konstrukcje z wektrora 120st i tr (potrojone)
    {
    for(i=[1:3])
    rotate(a = [0, 0, (120*i)])
    translate([0, promien_konstrukcji, 0]) 
    
    {
    //Wspornik dolny konstrukcji 
    rotate([180,180,0])
    translate([0, 0, wysokosc_podstawy/2])// motor_end ();
    if (use_stls) import ("wspornik_dolny.stl"); else render() wspornik_dolny();
        
    //Wspornik góny konstrukcji
    translate([0, 0, wysokosc_konstrukcji-16]) 
    rotate([0,0,180])
    if (use_stls) translate([0, 0, -12])import ("wspornik_gorny.stl"); else render() wspornik_gorny();
        
    //tasma
        for(x=[-12.5,12.5]){
    rotate([0,0,90]) translate([6, x, wysokosc_konstrukcji/2+42.3/2-13]) tasma();
        }
    //Nema 17
    translate([0, 7, wysokosc_podstawy/2]) nema17(48);
        
    //Zebatka_GT2_40_zebow_5mm ();
    rotate([90,0,0])
    translate([0, wysokosc_podstawy/2, -11])                    
    if (use_stls) import ("GT2_40_5mm.stl"); else render() GT2_40_5mm();
        
    //łożysko górne M8
    translate([0, 2-7+2, wysokosc_konstrukcji-13]) 
    rotate([270,0,0])
    F608ZZ();
    translate([0, 9.2+2, wysokosc_konstrukcji-13]) 
    rotate([90,0,0])
    608ZZ();
        
    translate([0, -12, wysokosc_konstrukcji-13]) 
    rotate([90,0,0])
    DIN934(8);
        
    translate([0, 12+1, wysokosc_konstrukcji-13]) 
    rotate([270,0,0])
    DIN912g(8,45);
    
    translate([0, 9.2+2, wysokosc_konstrukcji-13]) 
    rotate([270,0,0])
    DIN988(8);
    
    translate([0, -12, wysokosc_konstrukcji-13]) 
    rotate([270,0,0])
    DIN988(8);
    
    translate([0, -4.5, wysokosc_konstrukcji-13]) 
    rotate([270,0,0])
    DIN988(8);
        
    //śruby w motor_end
    translate([30, -18, wysokosc_podstawy+grubosc_podstawy]) 
    rotate([0,0,0])
    DIN912(4,25);
    
    if(sruby==1)
    {
    for(i=[0:2])
    {
    for(j=[1:2])
    translate([0, 6, 0]) 
    rotate([0,0,180*j])
    {
    translate([37, 0, 16+i*14]) 
    rotate([0,90,0])
    DIN912(3,16);
        
    translate([36, 0, 16+i*14]) 
    rotate([0,90,0])   
   DIN9021(3);
        
    translate([23.5, 0, 16+i*14]) 
    rotate([0,90,0])          rotate([0,0,90])  
    DIN934(3);
    }
    }
        
    //śruby we wsporniku górnym
    for(i=[0:1])
    {
    for(j=[1:2])
    translate([0, 6, wysokosc_konstrukcji-36]) 
    rotate([0,0,180*j])
    {
    translate([37, 0, 16+i*12]) 
    rotate([0,90,0])
    DIN912(3,16);
        
    translate([36, 0, 16+i*12]) 
    rotate([0,90,0])   
    DIN9021(3);
        
    translate([23.5, 0, 16+i*12]) 
    rotate([0,90,0])          rotate([0,0,30])  
    DIN934(3);
    }
            for(i=[1:4])
            translate([0, 0, 42.3/2+9])
            rotate([0,90*i,0])
            {
            translate([31/2, -5, 31/2]) 
            //translate([31/2, -5, 45.3]) 
            rotate([270,90,0])
                {
                DIN912(3,12);
                DIN9021(3);
                }
            }

    }
    }
    else{}

        
        // moze wystarczy zwykła sruba m8 tylko docisnieta?
        
    //Pręt fi8
    for(j=[-1:2:1])
    {
    translate([30*j, 0, 0]) pret_fi8(wysokosc_konstrukcji,srednica_walka);
    
    translate([30, -18, wysokosc_konstrukcji-12]) 
    rotate([0,0,30])   
    DIN934(4);
    }
            
        }
        }
    }
    //  ELEMENTY RUCHOME

module para_ramion(lean_y,lean_x)
{
	for(i=[-1,1])
	translate([25*i,platform_hinge_offset,0])
	rotate([lean_x,0,0])
	rotate([0,lean_y,0])
	rotate([0, -90, 0]) 
	ramie(0,0,0,0,0,0,0);
}

    module czesci_ruchome()
    {
    translate([0, 0,platformxyz[1]])	

    
    for(i=[0:2])
	assign(angle=120*i)
	assign(carriage_xy=[0,promien_konstrukcji-carriage_hinge_offset],
		platform_xy=[platformxyz[0]*cos(angle)+platformxyz[1]*sin(angle),
		platformxyz[1]*cos(angle)-platformxyz[0]*sin(angle)+
		platform_hinge_offset])
	assign(rod_dist=carriage_xy-platform_xy)
	assign(dist=sqrt(rod_dist[0]*rod_dist[0]+rod_dist[1]*rod_dist[1]))
	assign (height=sqrt(dlugosc_ramion*dlugosc_ramion-dist*dist))
	assign(lean_y=90-acos(rod_dist[0]/dlugosc_ramion),
     lean_x=-atan2(rod_dist[1],height))
    
    //wózki
	{
    rotate(angle) 
    translate([0, promien_konstrukcji, wysokosc_podstawy+grubosc_podstawy+wysokosc_grzalki+8+platformxyz[2]+height-30]) 
    rotate([0, 0, -90]) 
    {
    wozek_p(1);
    }

    //ramiona
    translate(platformxyz)
    rotate(angle)
    translate([0,0,wysokosc_podstawy+grubosc_podstawy+wysokosc_grzalki+4])
    para_ramion(lean_y,lean_x);
	}
    
    translate(platformxyz) 
	translate([0, 0, wysokosc_podstawy+grubosc_podstawy+wysokosc_grzalki+platformxyz[1]]) 
	rotate([0, 0, 60]) 
	platforma_p(1,0,0);
   
    
    }
          
    konstrukcja();
    if(ruchome_elementy==1) czesci_ruchome(); else{}