$fa = 0.1;
$fs = 1;

use <makerslide.scad>
use <tslot.scad>
use <motors.scad>

translate([40,0,110]) rotate([0,90,0]) tslot2040(length=200, center=true);
rotate([0,0,180])makerslide(200);

module thrustend(height=10)
{
  difference()
  {
    hull()
    {
      for (x=[-15,25])
        for (y=[-15,15])
          translate([x,y,0])
            cylinder(r=5, h=10);
    }

    for (x=[-15,22.5])
      for (y=[-10,10])
        translate([x,y,0])
        {
          cylinder(r=5.2/2, h=11);
          translate([0,0,-0.1]) cylinder(r=8.5/2, h=5.1);
        }

    translate([0,0,-0.1]) cylinder(r=24/2, h=6.01);
    cylinder(r=18/2, h=12);
  }
}

translate([-40,0,89.95]) thrustend();
