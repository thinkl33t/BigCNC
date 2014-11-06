module makerslide(h=100) 
{
	color([0.5,0.5,0.5]) translate([-10,0,0]) extrusion(h, "makerslide.dxf");
}

module extrusion(h=100, p="makerslide.dxf")
{
	linear_extrude(file=p, height=h, center=true, convexity=10);
}

makerslide(300);
