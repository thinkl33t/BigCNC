$fa = 0.1;
$fs = 1;

use <makerslide.scad>
use <tslot.scad>
use <motors.scad>

module bearing (od=22, id=8, depth=7)
{
  color("silver") difference()
  {
    cylinder(r=od/2, h=depth, center=true);
    cylinder(r=id/2, h=depth+0.1, center=true);
  }
}

module ballscrew(length=1000)
{
  color("lightgrey")
  {
    cylinder(h=length, r=10/2, center=true);
    translate([0,0,(-15+11)/2])cylinder(h=length-15-11, r=12/2, center=true);
    translate([0,0,-21.5])cylinder(h=length-15-11-39, r=16/2, center=true);
  }
}

module thrustend(height=10, bearing_diameter=24)
{
  difference()
  {
    hull()
    {
      for (x=[-15])
        for (y=[-15,15])
          translate([x,y,0])
            cylinder(r=5, h=height);
      for (x=[25])
        for (y=[-15,15])
          translate([x,y,height/2])
            cube([10,10,height], center=true);
    }

    // M5 cap head bolts - heads sunk
    for (x=[-15,22.5])
      for (y=[-10,10])
        translate([x,y,0])
        {
          cylinder(r=5.2/2, h=height+1);
          translate([0,0,-0.1]) cylinder(r=8.5/2, h=5.1);
        }

    // 10mm thrust Bearing hole + through hole
    translate([0,0,-0.1]) cylinder(r=bearing_diameter/2, h=height-1.99);
    cylinder(r=17/2, h=height+1);
  }
}


module axis()
{
  translate([-40,0,93.95]) thrustend(6,26);
  translate([-40,0,93.45]) bearing(26,12,9);
  translate([-40,0,-93.95]) rotate([180,0,0]) thrustend(6,24);
  translate([-40,0,-93.45]) bearing(24,10,9);

  difference()
  {
    translate([40,0,110]) rotate([0,90,0]) tslot2040(length=200, center=true);
    translate([-40,0,99]) cylinder(r=14/2, h=22);
  }
  rotate([0,0,180]) makerslide(200);
  translate([40,0,-110]) rotate([0,90,0]) tslot2040(length=200, center=true);
  translate([-40,0,21]) ballscrew(200-9-9+11+15+39);
}

axis();
