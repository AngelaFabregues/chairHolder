thikness=4.6;
width=22;
length=86.1;
hole=7.5;
holeDistance=51.1;
empty=1.5;

squareLength=length-width;

module chair_2nd_part(){
    difference(){
        union(){
            //surface
            rotate([0,90,0]){
                translate([0,(holeDistance+hole)/2,0]){
                    cylinder(thikness,width/2,width/2,true);
                }
                translate([0,-(holeDistance+hole)/2,0]){
                    cylinder(thikness,width/2,width/2,true);
                }
            }
            cube([thikness,squareLength,width],true);
        }            
        //holes
        rotate([0,90,0]){
            translate([0,holeDistance/2,0]){
                cylinder(thikness+empty,hole/2,hole/2,true);
            }
            translate([0,-holeDistance/2,0]){
                cylinder(thikness+empty,hole/2,hole/2,true);
            }
        }
    }
}



chair_2nd_part();
