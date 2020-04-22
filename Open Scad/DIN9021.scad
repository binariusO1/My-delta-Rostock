/*
PODKŁADKA DIN 9021

*/

$fn = 40;


        
DIN9021(8);
module DIN9021(gwint)
{
    //Parametry
        //
        function d1(gwint) = lookup(gwint, [[3,3.2],[4,4.3],[5,5.3],[6,6.4],[7,7.4],[8,8.4],[10,10.5],[12,13],[14,15],[16,17],[18,20],[20,22]]);
        d1=d1(gwint);
        //
        function h(gwint) = lookup(gwint, [[3,0.8],[4,1],[5,1.2],[6,1.6],[7,2],[8,2],[10,2.5],[12,3],[14,3],[16,3],[18,4],[20,4]]);
        h=h(gwint);
        //
        function d2(gwint) = lookup(gwint, [[3,9],[4,12],[5,15],[6,18],[7,22],[8,24],[10,30],[12,37],[14,44],[16,50],[18,56],[20,60]]);
        d2=d2(gwint);
    
    steel = [0.8, 0.8, 0.9];
    color(steel,1)
    difference()
    {
    cylinder(h=h, d=d2, center=false);
    translate([0,0,-1])
    cylinder(h=h+2, d=d1, center=false);
    }
}