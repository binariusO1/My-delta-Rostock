/*
PODKŁADKA DIN 988

*/

$fn = 40;


        
DIN988(8);
module DIN988(gwint)
{
    //Parametry
        //
        function d1(gwint) = lookup(gwint, [[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10],[11,11],[12,12],[13,13],[14,14],[15,15],[16,16],[18,18],[20,20]]);
        d1=d1(gwint);
        //
        function h(gwint) = lookup(gwint, [[3,1.2],[4,1.2],[5,1.2],[6,1.2],[7,1.2],[8,1.2],[9,1.2],[10,1.2],[11,1.2],[12,1.2],[13,1.2],[14,2],[15,2],[16,2],[18,2],[20,2]]);
        h=h(gwint);
        //
        function d2(gwint) = lookup(gwint, [[3,6],[4,8],[5,10],[6,12],[7,13],[8,14],[10,16],[11,17],[12,18],[13,19],[14,20],[15,21],[16,22],[18,25],[20,28]]);
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