//
// UnfyOpenSCADLib Copyright Leif Burrow 2024
// kc8rwr@unfy.us
// unforgettability.net
//
// This file is part of UnfyOpenSCADLib.
//
// UnfyOpenSCADLib is free software: you can redistribute it and/or modify it under the terms of the
// GNU General Public License as published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// UnfyOpenSCADLib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with UnfyOpenSCADLib.
// If not, see <https://www.gnu.org/licenses/>.
//

use <libraries/UnfyOpenSCADLib/unfy_fasteners.scad>
use <libraries/UnfyOpenSCADLib/unfy_shapes.scad>
use <libraries/UnfyOpenSCADLib/cutouts/unfy_c14socket.scad>
use <libraries/UnfyOpenSCADLib/cutouts/unfy_popins.scad>
use <libraries/UnfyOpenSCADLib/cutouts/unfy_dhole.scad>
use <libraries/UnfyOpenSCADLib/unfy_cablemanagement.scad>

size = [75, 54, 75];
tab_in_size = true;
bolt_size = "#8"; // ["M3", "M4", "#4", "#6", "#8"]
c14_fastener = "Heatset"; //["Heatset", "HexNut", "PlainHole"]
c14_fastener_size = "M3"; // ["M3", "M4", "#4", "#6", "#8"]
wall = 4;
support_skin = 0.4;
$over = 0.01;

$fn = $preview ? 36 : 360;

module power_box(size=[55, 54, 55], step=[20, 27], bolt_size = "m4", back_lip = 5, wall=2){

  module main_shape(back_size, front_size, corner_r){
    edge_r = corner_r/4;
    corners = [0, corner_r, 0, 0];
    edge_rs=[edge_r, edge_r, 0, edge_r, 0, 0, 0, 0];
    unf_roundedCuboid(size=back_size, corners=corners, edge_r=edge_rs);
    translate([back_size.x-corner_r, 0, 0]){
      unf_roundedCuboid(size=front_size, corners=corners, edge_r=edge_rs);
    }
  }

  let(washer_v = unf_wsh_v(bolt_size),
      bolt_d = unf_fnr_shaft_diameter(bolt_size),
      tab_length = unf_wsh_diameter(washer_v) + (2*wall),
      tab_height = wall + unf_wsh_height(washer_v),
      back_size = [size.x, tab_in_size ? size.y - tab_length : size.y,  size.z],
      corner_r = min(back_size.x, back_size.y)/2,
      front_size = [step.x+corner_r, back_size.y, step.y]
  ){
    unf_C14Socket(rotation=[0, -90, 0], location=[-$over+wall, 7, wall+1], fastener=c14_fastener, bolt=c14_fastener_size, support_skin="vertical", restriction_l=wall+1, restriction_r=0, support_skin_t=support_skin){
      color("Blue"){
	difference(){
	  main_shape(back_size=back_size, front_size=front_size, corner_r=corner_r);
	  translate([wall, wall, -$over]){
	    main_shape(back_size = [back_size.x-(2*wall), back_size.y-(2*wall), back_size.z-wall+$over],
		       front_size = [front_size.x-(2*wall), front_size.y-(2*wall), front_size.z-wall+$over],
		       corner_r = corner_r);
	  }
	  translate([back_lip+wall, back_size.y-(wall+$over), -$over]){
	    cube([back_size.x-(2*wall)-(2*back_lip), wall+(2*$over), back_size.z+$over-max(wall, back_lip)]);
	  }
	  translate([wall+back_lip, back_size.y-(wall+$over), -$over]){
	    cube([size.x+step.x-(2*wall)-(2*back_lip), wall+(2*$over), front_size.z+$over-max(wall, back_lip)]);
	  }
	}
      }
      if (0 < support_skin){
	color("Yellow", alpha=0.5){
	  //pillar at corner of back_lip
	  translate([back_size.x-back_lip-wall, back_size.y-wall, 0]){
	    cube([support_skin, wall, front_size.z-back_lip]);
	  }
	  translate([back_lip+wall, back_size.y-support_skin, 0]){
	    cube([back_size.x-(2*wall)-(2*back_lip), support_skin, size.z+$over-max(wall, back_lip)]);
	  }
	  translate([back_size.x-back_lip-wall, back_size.y-support_skin, 0]){
	    cube([step.x, support_skin, front_size.z-max(wall, back_lip)]);
	  }
	}
      }
    }
  }
}


power_box(size = size,
	  bolt_size = bolt_size,
	  wall = wall);


