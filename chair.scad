free_width=8;
table_height=11.6;

module chairHolder(hole_diametre, depth) {
    solid_width=free_width/2;
    hole_radius=hole_diametre/2;
    empty=1;
    union(){
        translate([solid_width/2,0,0]){
            cube([solid_width,depth,hole_diametre], true); //solid
        }
        translate([solid_width,0,0]){
            difference(){ //solid with hole
                translate([hole_radius/2,0,0]){
                    cube([hole_radius,depth,hole_diametre], true); 
                }
                translate([hole_radius,0,0]){
                    rotate([90,0,0]){
                        $fn=100;
                        cylinder(depth+empty,hole_radius,hole_radius,true);
                    }
                }
            }
        }
    }
}

module letter(l,s,h) {
	linear_extrude(height = h) {
		text(l, size = s, font = "Veltica", halign = "center", valign = "center", $fn = 16);
	}
}

module chairRadiusTest(extra){
    hole_diametre=table_height + extra;
    depth=10;

    difference(){
        chairHolder(hole_diametre, depth);
        union(){ // id
            margin=0.5;
            height=(free_width/2)-(margin*2);
            translate([height/2+margin,-depth/2+margin,0]){
                rotate([90,90,0]){
                    letter(str(extra),height,2);
                }
            }
        }
    }
}

// Adapts the holder adding extra to the diameter that is 11.6mm.
chairRadiusTest(1);
