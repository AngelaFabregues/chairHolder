thikness=4.5;
width=20;
length=85;
hole=8;
holeDistance=50;
empty=1.5;

squareLength=length-width-8;

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
