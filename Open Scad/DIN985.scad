/* 
    DIN985
*/

$fn = 25;

DIN985(3);
module DIN985(gwint)
{
    //Parametry nakrętki:
    {
        //grubość
        function m(gwint) = lookup(gwint, [[3,2.4],[4,3.2],[5,4],[6,5],[8,6.5],[10,17],[12,19],[14,22],[16,24],[18,27],[20,30]]);
        m=m(gwint);
        //szerokość
        function s(gwint) = lookup(gwint, [[3,5.5],[4,7],[5,8],[6,10],[8,13],[10,6.2],[12,7.44],[14,8.4],[16,8.8],[20,10.16]]);
        s=s(gwint);
        //Definicja kolorów
        aluminum = [0.9, 0.9, 0.9];
        steel = [0.8, 0.8, 0.9];
    }
    
{
    color(steel,1)
	difference()
	{
        union(){
		cylinder(d = s*2/sqrt(3),h = m, $fn=6);
            difference(){
        translate ([0,0,gwint*0.55]) sphere(gwint*0.9);
    translate([0, 0, -1]) cube([20, 20, 2], center=true);
            }
        }
		translate([0,0,-0.1])	cylinder(r = gwint/2, h = m + 50);
	}
    
}

}
