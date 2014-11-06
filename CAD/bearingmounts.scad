$fs = 1;
$fa = 1;

module lmount()
{
	difference()
	{
		union()
		{
			hull()
			{
				translate([-2.5,2.5,0])cylinder(r=12.5, h=20, center=true);
				translate([-15, -10, 0]) cube([1,1,20], center=true);
				translate([10, -10, 0]) cube([1,1,20], center=true);
				translate([10, 15, 0]) cube([1,1,20], center=true);
			}
			translate([0, -10, 0]) scale([1,0.5,1]) rotate([0, 90, 0]) cylinder(r=6/2, h=21, center=true, $fn=6);
		}
		translate([-19,19,0])
		difference()
		{
			cube([50, 50, 10], center=true);
			translate([20, -20, 0]) cylinder(r=12/2, h=11, center=true);
			translate([23, -17, 0]) cube([6,6,50], center=true);
			translate([17, -23, 0]) cube([6,6,50], center=true);
		}
		translate([0,0,0])cylinder(r=3, h=22, center=true);
		translate([0,0,-9])rotate([0,0,30])cylinder(r=10 / 2 / cos(180 / 6) + 0.05, h=5, $fn=6, center=true); 
		translate([0, 10, 0]) rotate([0, 90, 0]) cylinder(r=2.5, h=100, center=true);
		translate([-10, 0, 0]) rotate([0, 90, 90]) cylinder(r=2.5, h=100, center=true);
	}
}

module umount()
{
	difference()
	{
		union()
		{
			hull()
			{
				translate([0,0,0])cylinder(r=10, h=20, center=true);
				translate([20, 10, 0]) cube([1,1,20], center=true);
				translate([-20, 10, 0]) cube([1,1,20], center=true);
			}
			translate([0, 10.5, 0])  scale([1,0.5,1]) rotate([0, 90, 0]) cylinder(r=6/2, h=40, center=true, $fn=6);
		}

		translate([0,0,0])cylinder(r=3, h=22, center=true);
		translate([0,0,-9])rotate([0,0,0])cylinder(r=10 / 2 / cos(180 / 6) + 0.05, h=5, $fn=6, center=true); 
		translate([12.5, 0, 0]) rotate([90, 0, 0]) cylinder(r=2.5, h=100, center=true);
		translate([-12.5, 0, 0]) rotate([90, 0, 0]) cylinder(r=2.5, h=100, center=true);
		translate([12.5, -42.5, 0]) rotate([90, 0, 0]) cylinder(r=5, h=100, center=true);
		translate([-12.5, -42.5, 0]) rotate([90, 0, 0]) cylinder(r=5, h=100, center=true);

	}
}

lmount();
