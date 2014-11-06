module cornerpiece()
{
  module triangle(b=10, h=10, w=4)
  {
    translate([-h/2, -b/2, 0])
      linear_extrude(height = w, center = true, convexity = 10, twist = 0)
        polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
  }

  difference()
  {
    union()
    {
      hull()
      {
        triangle(25, 25, 40);
        cylinder(r=25/2, h=40, center=true);
      }

      for (i=[-10, 10])
      hull() for (j=[0,-90])
        rotate(v=[0,0,10], a=j)
          translate([0,-25/2,i]) scale([1,0.5,1]) rotate([0,90,0]) cylinder(r=6/2, h=25, $fn=6, center=true);      
    }
    for (i=[-10, 10])
      for (j=[0,-90])
        translate([0,0,i])
          rotate([90,0,j])
          {
            cylinder(r=5.2/2, h=40, center=true);
            translate([0,0,-4]) cylinder(r=12/2, h=22, center=true);
            translate([0,0,8]) cylinder(r1=12/2, r2=5.2/2, h=2.1, center=true);
          }
    cylinder(r=5.2/2, h=50, center=true);
    translate([0,0,-9]) cylinder(r=10/2, h=50, center=true);
    translate([0,0,17]) cylinder(r1=10/2, r2=5.2/2, h=2.1, center=true);
  }
}

cornerpiece();
