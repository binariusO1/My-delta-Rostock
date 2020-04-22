/*
DIN 7991
*/

$fn = 360;

DIN7991(4,12);
module DIN7991(gwint,dlugosc)
{
    //Parametry śruby:
    {
        //Parametry śruby:
        //szerokość łba
        function dk(gwint) = lookup(gwint, [[3,6.72],[4,8.96],[5,10.2],[6,13.44],[8,17.92],[10,22.4],[12,26.8],[14,30.88],[16,33.6],[20,40.32]]);
        dk=dk(gwint);
        //grubość łba
        function k(gwint) = lookup(gwint, [[3,1.86],[4,2.48],[5,3.1],[6,3.72],[8,4.96],[10,6.2],[12,7.44],[14,8.4],[16,8.8],[20,10.16]]);
        k=k(gwint);
        //gniazdo 60-kątne
        function s(gwint) = lookup(gwint, [[3,2.0],[4,2.5],[5,3.0],[6,4.0],[8,5.0],[10,6.0],[12,8.0],[14,10.0],[16,10.0],[20,12.0]]);
        s=s(gwint);
        //a
        function a(gwint) = lookup(gwint, [[3,90],[4,90],[5,90],[6,90],[8,90],[10,90],[12,90],[14,90],[16,90],[20,90]]);
        a=a(gwint);
        //Długość części gwintowanej
        function b(gwint) = lookup(gwint, [[3,2.0],[4,2.0],[5,3.5],[6,4.0],[8,5.5],[10,7.0],[12,8.0],[14,9.0],[16,10.0],[18,12.0],[20,13.0],[24,15.0]]);
        s=s(gwint);
        //Definicja kolorów
        aluminum = [0.9, 0.9, 0.9];
        steel = [0.8, 0.8, 0.9];
    }
    
{
    color(steel,1)
                translate([0, 0, -dlugosc+k])
            difference() 
    {
            union()
    {
    cylinder(h=dlugosc-k, d=gwint, center=false);
    
            translate([0, 0, dlugosc-k])
        cylinder(h=k, d=gwint, d2=dk, center=false);
    }
                translate([0, 0, dlugosc])
        cylinder(h=k, d=s,$fn=6,center = true);
    
}

}
}