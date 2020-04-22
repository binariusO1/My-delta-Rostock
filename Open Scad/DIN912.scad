/*
DIN 912 Z GWINTEM PO CAŁOŚCI
*/

$fn = 60;

DIN912(8,30);
module DIN912(gwint,dlugosc)
{
    //Parametry śruby:
    {
        //Parametry śruby:
        //szerokość łba
        function dk(gwint) = lookup(gwint, [[3,5.5],[4,7],[5,8.5],[6,10],[8,13],[10,16],[12,18],[14,21],[16,24],[20,30]]);
        dk=dk(gwint);
        //grubość łba
        function k(gwint) = lookup(gwint, [[3,3],[4,4],[5,5],[6,6],[8,8],[10,10],[12,12],[14,14],[16,16],[20,20]]);
        k=k(gwint);
        //gniazdo 60-kątne
        function s(gwint) = lookup(gwint, [[3,2.5],[4,3],[5,4],[6,5],[8,6],[10,8],[12,10],[14,12],[16,14],[20,17]]);
        s=s(gwint);
        //Długość części gwintowanej
        //L=[3,5-30],[4,6-40],[5,8-50],[6,10-60],[8,12-80],[10,16-100],[12,20-120],[14,25-140]
        //Definicja kolorów
        aluminum = [0.9, 0.9, 0.9];
        steel = [0.8, 0.8, 0.9];
    }
    
{
    color(steel,1)
                            translate([0, 0, -dlugosc])
            difference() 
    {
            union()
    {

    cylinder(h=dlugosc, d=gwint*0.9, center=false);
    
            translate([0, 0, dlugosc])
        cylinder(h=k, d=dk, center=false);
    }
                translate([0, 0, dlugosc+k])
        cylinder(h=k, d=s,$fn=6,center = true);
}
}
}