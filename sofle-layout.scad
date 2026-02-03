include <KeyV2/includes.scad>
use <KeyV2/src/functions.scad>

sofle_layout = [
  [ 1, 1, 1, 1, 1, 1, -1.5, -1, -1.5, 1, 1, 1, 1, 1, 1],
  [ 1, 1, 1, 1, 1, 1, -1.5, -1, -1.5, 1, 1, 1, 1, 1, 1],
  [ 1, 1, 1, 1, 1, 1, -1.5, -1, -1.5, 1, 1, 1, 1, 1, 1],
  [ 1, 1, 1, 1, 1, 1, -1.5, -1, -1.5, 1, 1, 1, 1, 1, 1],
  [-1,-1, 1, 1, 1, 1,  1.5, -1,  1.5, 1, 1, 1, 1,-1,-1],
];

sofle_default_legends = [
  ["`",  "1", "2", "3", "4", "5", "", "", "", "6", "7", "8", "9", "0", ""],
  ["\u238b", "Q", "W", "E", "R", "T", "",  "","", "Y", "U", "I", "O", "P", "\u232b"],
  ["\u21b9", "A", "S", "D", "F", "G", "",  "","", "H", "J", "K", "L", ";", "'"],
  ["\u21e7", "Z", "X", "C", "V", "B", "",  "","", "N", "M", ",", ".", "/", "\u21e7"],
  ["", "", "\u2756", "\u2387", "\u2388","\u2207","\u21b5",""," ","\u2206","\u2318", "\u2325", "\u2384"],
];

sofle_x_offset = [
  [ 0, 0, 0, 0, 0, 0.0,  0.0,0, 0.0,  0.0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0.0,  0.0,0, 0.0,  0.0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0.0,  0.0,0, 0.0,  0.0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0.0,  0.0,0, 0.0,  0.0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 2.9,  0.0,0, 0.0, -2.9, 0, 0, 0, 0, 0],
];

sofle_y_offset = [
   [0, 0, 5, 7.5, 5, 2.50,  0,0,  0, 2.50, 5, 7.5, 5, 0, 0],
   [0, 0, 5, 7.5, 5, 2.50,  0,0,  0, 2.50, 5, 7.5, 5, 0, 0],
   [0, 0, 5, 7.5, 5, 2.50,  0,0,  0, 2.50, 5, 7.5, 5, 0, 0],
   [0, 0, 5, 7.5, 5, 2.50,  0,0,  0, 2.50, 5, 7.5, 5, 0, 0],
   [0, 0, 5, 7.5, 5, 0.20, -5,0, -5, 0.20, 5, 7.5, 5, 0, 0],
];

sofle_rotate = [
  [ 0, 0, 0, 0, 0,   0,  0,0,   0,  0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0,   0,  0,0,   0,  0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0,   0,  0,0,   0,  0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0,   0,  0,0,   0,  0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, -15, 60,0, -60, 15, 0, 0, 0, 0, 0],
];

module sofle(legends=sofle_default_legends) {
    translate_u(-8, 6)
    simple_layout(sofle_layout) {
        x=sofle_x_offset[$row][$column];
        y=sofle_y_offset[$row][$column];
        z=sofle_rotate[$row][$column];
        legend=legends[$row][$column];
        $key_bump=(legend=="F"||legend=="J");

        echo($row,$column,x,y,z);
        translate([x,y,0]) rotate([0,0,z])
            legend(legend)
                children();
    }
}

module ajp_row(row=3,column) {
	$total_depth = $total_depth * 2/3;
	
  if (row == 5){
    $top_tilt = -12.5;
    children();
  } else {
    children();
  }
}

sofle_ajfclark_legends = [
  ["1!","2@",     "3#",     "4$",     "5%",   "6^",  "","", "",     "7&",     "8*",     "9(",     "0)", "-_","+="],
  ["\u238b`~",  "Q", "W",      "E",      "R",      "T",    "","",  "", "Y",      "U",      "I",      "O",      "P",  "\u2327"],
  ["\u21b9",  "A", "S",      "D",      "F",      "G",    "","",  "", "H",      "J",      "K",      "L",      ";:", "'\""],
  ["\u21e7",  "Z", "X",      "C",      "V",      "B",    "","",  "", "N",      "M",      ",<",     ".>",     "/?", "\u21e7\u21b5"],
  ["",        "",  "\u2756", "\u2387", "\u2388","\u2207"," ",""," ", "\u2206", "\u2318", "\u2325", "\u2384", "",   ""],
];

$font="Code2000";
$font_size=5;
$stem_support_type = "disable"; // [tines, brim, disabled]
legends=sofle_ajfclark_legends;
$double_sculpted=false;
$double_sculpt_radius=400;
$key_bump_depth = 1.5;
$key_bump_edge = 1.4;

sofle(legends) {
    mt3_row(row=$row+1)
    ajp_row(row=$row+1)
    key();
}

color("red")
for(i=[0:1]) {
    mirror([i,0,0]) translate([-13.4,-3.75,-2]) import("plate.stl");
}