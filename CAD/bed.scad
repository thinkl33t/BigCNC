use <makerslide.scad>
use <tslot.scad>
use <motors.scad>
use <cornerpiece.scad>
use <bearingmounts.scad>

module bed(width=900, length=1500)
{
	translate([(width/2)+10,-100,0]) rotate([90,0,0]) makerslide(length+200);
	translate([-(width/2)-10,-100,0]) rotate([90,180,0]) makerslide(length+200);

	for(i=[-(length/2+200-10), -(length/2-10), -(length/2-10)/2, 0, (length/2-10)/2, (length/2-10)])
		translate ([0,i,0]) rotate([90,0,90]) tslot2040(width, center=true);

	for(i=[-(length/2+200-10), (length/2-10)])
		translate ([0,i,-600]) rotate([90,0,90]) tslot2040(width, center=true);
	
	for(i=[(width/2)+10,-(width/2)+10])
		translate([i,-100,-600]) rotate([90,0,0]) tslot2040(length+200, center=true);

	color("BurlyWood") translate([0,0,20+(18/2)]) 
	difference()
	{
		cube([width, length, 18], center=true);
		for (x = [-2000:100:2000])
			for (y = [-2050:100:2050])
				translate([x, y, 0]) cylinder(r=5, h=20, center=true);
	}


	for(m=[0,1])
	mirror([m,0,0])
	{
		for (i=[-(length/2-10), -(length/2-10)/2, 0, (length/2-10)/2])
			color("red") translate([-(width/2)+(25/2),i+25/2+10,0]) cornerpiece();
		for (i=[-(length/2-10), -(length/2-10)/2, 0, (length/2-10)/2])
			color("red") translate([-(width/2)+(25/2),i-25/2-10,0]) rotate([0,0,-90]) cornerpiece();
		for (i=[-(length/2+200-40), (length/2-40)])		
			translate([-(width/2)+(25/2), i, -380]) tslot4040(800, center=true);
	}
}

module gantry(width=900, length=1500, height=300)
{
	translate([0,-10,height+20]) rotate([90,0,-90]) makerslide(width+20+20+20);
	translate([0,10,height+20]) rotate([90,0,90]) makerslide(width+20+20+20);

	translate([-width/2-20-20,0,height/2+20+10]) tslot2040(height+20, true);
	translate([width/2+20+20,0,height/2+20+10]) tslot2040(height+20, true);

	translate([-width/2-20-20,-55,0]) rotate([90,0,0]) tslot2040(200,true);
	translate([width/2+20+20,-55,0]) rotate([90,0,0]) tslot2040(200,true);

	for(m=[0,1]) mirror([m,0,0])
	{
		translate([-width/2-20-20,20+10,20+10]) rotate([0,90,0]) color("red") lmount();
		translate([-width/2-20-20,-135,20+10]) rotate([-90,0,-90]) color("red") umount();
		translate([-width/2-20-20,-60,-20-10]) rotate([90,0,90]) color("red") umount();
		translate([-width/2-20-10,-50,50]) rotate([0,90,0]) nema23();
	}
}

bed(700, 1000);
gantry(700, 1000, 200);
