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

module chairHolderThikness(hole_diametre, depth, thickness,extra_long){
    solid_width=free_width/2;
    long=solid_width+(hole_diametre/2)+extra_long;
    translate([0,-depth/2,hole_diametre/2]){
        cube([long,depth,thickness]);
    }
    translate([0,-depth/2,-hole_diametre/2-thickness]){
        cube([long,depth,thickness]);
    }
}

module nail(){
    translate([-14/2+4,0,0]){
        rotate([0,90,0]){
            cylinder(14,7/2,7.6/2,true);
        }
    }
}
module chairNails(){
    translate([0,20,0]){
        nail();
    }
    translate([0,-20,0]){
        nail();
    }
}

module supports(thick, hole){
    depth=70;
    wide=10-hole;
    translate([-wide-hole,0,-thick/2]){
        translate([0,-depth/2,0]){
            cube([wide,11-hole,thick]);
        }
        long=32-(2*hole);
        translate([0,-long/2,0]){
            cube([wide,long,thick]);
        }
    }
}


extra=1; // maybe 0
hole_diametre=table_height + extra;
depth=70;
chairHolder(hole_diametre, depth);
chairHolderThikness(hole_diametre, depth, 4, 2);
chairNails();
//supports(2,0.5);

