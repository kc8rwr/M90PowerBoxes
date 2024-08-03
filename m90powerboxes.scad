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
use <libraries/UnfyOpenSCADLib/cases/unfy_switchboxes.scad>
use <libraries/UnfyOpenSCADLib/cases/unfy_powerboxes.scad>
use <libraries/UnfyOpenSCADLib/unfy_brackets.scad>

part = "PowerSocketBox"; // ["PowerSocketBox", "PowerSwitchBox", "PowerSupplyBracket"]

support_skin = 0.6;

body_color = "Blue"; //["Lavender", "Thistle", "Plum", "Violet", "Orchid", "Fuchsia", "Magenta", "MediumOrchid", "MediumPurple", "BlueViolet", "DarkViolet", "DarkOrchid", "DarkMagenta", "Purple", "Indigo", "DarkSlateBlue", "SlateBlue", "MediumSlateBlue", "Pink", "LightPink", "HotPink", "DeepPink", "MediumVioletRed", "PaleVioletRed", "Aqua", "Cyan", "LightCyan", "PaleTurquoise", "Aquamarine", "Turquoise", "MediumTurquoise", "DarkTurquoise", "CadetBlue", "SteelBlue", "LightSteelBlue", "PowderBlue", "LightBlue", "SkyBlue", "LightSkyBlue", "DeepSkyBlue", "DodgerBlue", "CornflowerBlue", "RoyalBlue", "Blue", "MediumBlue", "DarkBlue", "Navy", "MidnightBlue", "IndianRed", "LightCoral", "Salmon", "DarkSalmon", "LightSalmon", "Red", "Crimson", "FireBrick", "DarkRed", "GreenYellow", "Chartreuse", "LawnGreen", "Lime", "LimeGreen", "PaleGreen", "LightGreen", "MediumSpringGreen", "SpringGreen", "MediumSeaGreen", "SeaGreen", "ForestGreen", "Green", "DarkGreen", "YellowGreen", "OliveDrab", "Olive", "DarkOliveGreen", "MediumAquamarine", "DarkSeaGreen", "LightSeaGreen", "DarkCyan", "Teal", "LightSalmon", "Coral", "Tomato", "OrangeRed", "DarkOrange", "Orange", "Gold", "Yellow", "LightYellow", "LemonChiffon", "LightGoldenrodYellow", "PapayaWhip", "Moccasin", "PeachPuff", "PaleGoldenrod", "Khaki", "DarkKhaki", "Cornsilk", "BlanchedAlmond", "Bisque", "NavajoWhite", "Wheat", "BurlyWood", "Tan", "RosyBrown", "SandyBrown", "Goldenrod", "DarkGoldenrod", "Peru", "Chocolate", "SaddleBrown", "Sienna", "Brown", "Maroon", "White", "Snow", "Honeydew", "MintCream", "Azure", "AliceBlue", "GhostWhite", "WhiteSmoke", "Seashell", "Beige", "OldLace", "FloralWhite", "Ivory", "AntiqueWhite", "Linen", "LavenderBlush", "MistyRose", "Gainsboro", "LightGrey", "Silver", "DarkGray", "Gray", "DimGray", "LightSlateGray", "SlateGray", "DarkSlateGray", "Black"]
support_color = "Yellow"; //["Lavender", "Thistle", "Plum", "Violet", "Orchid", "Fuchsia", "Magenta", "MediumOrchid", "MediumPurple", "BlueViolet", "DarkViolet", "DarkOrchid", "DarkMagenta", "Purple", "Indigo", "DarkSlateBlue", "SlateBlue", "MediumSlateBlue", "Pink", "LightPink", "HotPink", "DeepPink", "MediumVioletRed", "PaleVioletRed", "Aqua", "Cyan", "LightCyan", "PaleTurquoise", "Aquamarine", "Turquoise", "MediumTurquoise", "DarkTurquoise", "CadetBlue", "SteelBlue", "LightSteelBlue", "PowderBlue", "LightBlue", "SkyBlue", "LightSkyBlue", "DeepSkyBlue", "DodgerBlue", "CornflowerBlue", "RoyalBlue", "Blue", "MediumBlue", "DarkBlue", "Navy", "MidnightBlue", "IndianRed", "LightCoral", "Salmon", "DarkSalmon", "LightSalmon", "Red", "Crimson", "FireBrick", "DarkRed", "GreenYellow", "Chartreuse", "LawnGreen", "Lime", "LimeGreen", "PaleGreen", "LightGreen", "MediumSpringGreen", "SpringGreen", "MediumSeaGreen", "SeaGreen", "ForestGreen", "Green", "DarkGreen", "YellowGreen", "OliveDrab", "Olive", "DarkOliveGreen", "MediumAquamarine", "DarkSeaGreen", "LightSeaGreen", "DarkCyan", "Teal", "LightSalmon", "Coral", "Tomato", "OrangeRed", "DarkOrange", "Orange", "Gold", "Yellow", "LightYellow", "LemonChiffon", "LightGoldenrodYellow", "PapayaWhip", "Moccasin", "PeachPuff", "PaleGoldenrod", "Khaki", "DarkKhaki", "Cornsilk", "BlanchedAlmond", "Bisque", "NavajoWhite", "Wheat", "BurlyWood", "Tan", "RosyBrown", "SandyBrown", "Goldenrod", "DarkGoldenrod", "Peru", "Chocolate", "SaddleBrown", "Sienna", "Brown", "Maroon", "White", "Snow", "Honeydew", "MintCream", "Azure", "AliceBlue", "GhostWhite", "WhiteSmoke", "Seashell", "Beige", "OldLace", "FloralWhite", "Ivory", "AntiqueWhite", "Linen", "LavenderBlush", "MistyRose", "Gainsboro", "LightGrey", "Silver", "DarkGray", "Gray", "DimGray", "LightSlateGray", "SlateGray", "DarkSlateGray", "Black"]

/* [Power Socket Box] */
psb_bolt_size = "#6"; // ["M3", "M4", "#4", "#6", "#8"]
psb_socket_fastener = "Heatset"; //["Heatset", "HexNut", "PlainHole"]
psb_socket_fastener_size = "M4"; // ["M3", "M4", "#4", "#6", "#8"]

psb_fuse_holder_hole_diameter = 12;
psb_fuse_holder_outer_diameter = 14;
psb_fuse_holder_spacing = 4; //[0:0.5:5]
psb_fuse_holder_hole_shape = "circle";// ["circle", "d", "doubled"]
psb_fuse_holder_flat_width = 5;
psb_fuse_holder_rotation = 0; //[0:360]

psb_top_cable_d = 7.5;
psb_top_cable_bolt = "M3"; //["M3", "M4", "#6"]
psb_bottom_cable_d = 7.5;
psb_bottom_cable_bolt = "M3"; //["M3", "M4", "#6"]

/* [Power Switch Box] */
pwb_angle = 25; //[0:90]
pwb_max_skinless_angle = 50; //[0:90]
pwb_device="RLEIL_R2 | RLEIL_R2-Rleil R2 Series Switch"; //["RLEIL_R2 | RLEIL_R2-Rleil R2 Series Switch"]
pwb_device_space_z = 4;
pwb_device_space_y = 4;
pwb_fastener_spacing = 100;
pwb_fastener_size = "#6"; // ["M3", "M4", "#4", "#6", "#8"]
pwb_cable_d = 7.5;
pwb_cable_bolt = "M3"; //["M3", "M4", "#6"]

/* [Power Supply Bracket] */
bkt_supply_bolt_size = "M4"; // ["M3", "M4", "#4", "#6", "#8"]
bkt_supply_bolt_position = 11;
bkt_mount_bolt_size = "#6"; // ["M3", "M4", "#4", "#6", "#8"]
bkt_mount_bolt_position = 13;

/* [ advanced ] */
wall = 4;
$fn = $preview ? 18 : 360;
$over = 0.01;

if ("PowerSocketBox" == part){

  unf_mounted_power_socket_box(bolt_size = psb_bolt_size,
	    top_cable_d = psb_top_cable_d,
	    top_cable_bolt = psb_top_cable_bolt,
	    bottom_cable_d = psb_bottom_cable_d,
	    bottom_cable_bolt = psb_bottom_cable_bolt,
	    socket_fastener=psb_socket_fastener,
	    socket_fastener_size=psb_socket_fastener,
	    fuse_holder_hole_diameter = psb_fuse_holder_hole_diameter,
	    fuse_holder_outer_diameter = psb_fuse_holder_outer_diameter,
	    fuse_holder_spacing = psb_fuse_holder_spacing,
	    fuse_holder_hole_shape = psb_fuse_holder_hole_shape,
	    fuse_holder_flat_width = psb_fuse_holder_flat_width,
	    fuse_holder_rotation = psb_fuse_holder_rotation,
	    support_skin = support_skin,
	    wall = wall);
 } else if ("PowerSupplyBracket" == part){
  unf_simple_bracket(top_bolt_size = bkt_supply_bolt_size,
		       top_bolt_position = bkt_supply_bolt_position,
		       bottom_bolt_size = bkt_mount_bolt_size,
		       bottom_bolt_position = bkt_mount_bolt_position,
		       body_color = body_color,
		       wall = wall
  );
 } else if ("PowerSwitchBox" == part){
  unf_mounted_power_switch_box(angle = pwb_angle,
		   device=pwb_device,
		   device_space_z = pwb_device_space_z,
		   device_space_y = pwb_device_space_y,
		   fastener_spacing=pwb_fastener_spacing,
		   fastener_size = pwb_fastener_size,
		   cable_d = pwb_cable_d,
		   cable_bolt = pwb_cable_bolt,
		   body_color=body_color,
		   support_color=support_color,
		   support_skin = support_skin,
		   max_skinless_angle = pwb_max_skinless_angle,
		   wall = wall);
 }
