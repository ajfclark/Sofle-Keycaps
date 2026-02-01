include <KeyV2/includes.scad>
use <KeyV2/src/functions.scad>

sofle_left_layout = [
  [ 1, 1, 1, 1, 1, 1, -1.5],
  [ 1, 1, 1, 1, 1, 1, -1.5],
  [ 1, 1, 1, 1, 1, 1, -1.5],
  [ 1, 1, 1, 1, 1, 1, -1.5],
  [-1,-1, 1, 1, 1, 1, 1.5],
];

sofle_right_layout = [
  [-1.5, 1, 1, 1, 1, 1, 1],
  [-1.5, 1, 1, 1, 1, 1, 1],
  [-1.5, 1, 1, 1, 1, 1, 1],
  [-1.5, 1, 1, 1, 1, 1, 1],
  [ 1.5, 1, 1, 1, 1,-1,-1],
];

sofle_default_legends = [
  ["`",  "1", "2", "3", "4", "5", "", "",  "6", "7", "8", "9", "0", ""],
  ["\u238b", "Q", "W", "E", "R", "T", "",  "", "Y", "U", "I", "O", "P", "\u232b"],
  ["\u21b9", "A", "S", "D", "F", "G", "",  "", "H", "J", "K", "L", ";", "'"],
  ["\u21e7", "Z", "X", "C", "V", "B", "",  "", "N", "M", ",", ".", "/", "\u21e7"],
  ["", "", "\u2756", "\u2387", "\u2388","\u2207","\u21b5"," ","\u2206","\u2318", "\u2325", "\u2384"],
];

sofle_left_rotate = [
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, -15, 60],
];

sofle_left_x_offset = [
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 0, 0],
  [ 0, 0, 0, 0, 0, 2.5, -0.5],
];

sofle_left_y_offset = [
   [0, 0, 5, 7.5, 5, 2.5, 0],
   [0, 0, 5, 7.5, 5, 2.5, 0],
   [0, 0, 5, 7.5, 5, 2.5, 0],
   [0, 0, 5, 7.5, 5, 2.5, 0],
   [0, 0, 5, 7.5, 5, 0.25, -5],
];

module sofle_left(legends=sofle_default_legends) {
    translate([-161,118,0])
    simple_layout(sofle_left_layout) {
        x=sofle_left_x_offset[$row][$column];
        y=sofle_left_y_offset[$row][$column];
        z=sofle_left_rotate[$row][$column];
        legend=legends[$row][$column];
        $key_bump=(legend=="F"?true:false);

        translate([x,y,0]) rotate([0,0,z])
            legend(legend)
                children();
    }
}

module sofle_right(legends=sofle_default_legends) {
    translate([18,118,0])
    simple_layout(sofle_right_layout) {
        x=sofle_left_x_offset[$row][6-$column];
        y=sofle_left_y_offset[$row][6-$column];
        z=sofle_left_rotate[$row][6-$column];
        legend=legends[$row][7+$column];
        $key_bump=(legend=="J"?true:false);

        translate([-x,y,0]) rotate([0,0,-z])
            legend(legend)
                children();
        }
}

module sofle_both(legends=sofle_default_legends) {
        sofle_left(legends) children();
        sofle_right(legends) children();
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
  ["1!","2@",     "3#",     "4$",     "5%",   "6^",  "", "",     "7&",     "8*",     "9(",     "0)", "-_","+="],
  ["\u238b`~",  "Q", "W",      "E",      "R",      "T",    "",  "", "Y",      "U",      "I",      "O",      "P",  "\u2327"],
  ["\u21b9",  "A", "S",      "D",      "F",      "G",    "",  "", "H",      "J",      "K",      "L",      ";:", "'\""],
  ["\u21e7",  "Z", "X",      "C",      "V",      "B",    "",  "", "N",      "M",      ",<",     ".>",     "/?", "\u21e7\u21b5"],
  ["",        "",  "\u2756", "\u2387", "\u2388","\u2207"," "," ", "\u2206", "\u2318", "\u2325", "\u2384", "",   ""],
];

$font="Code2000";
$font_size=5;
$stem_support_type = "disable"; // [tines, brim, disabled]
legends=sofle_ajfclark_legends;
$double_sculpted=false;
$double_sculpt_radius=400;
$key_bump_depth = 1.5;
$key_bump_edge = 1.4;

sofle_both(legends) {
    mt3_row(row=$row+1)
    ajp_row(row=$row+1)
    key();
}

//for(i=[0:1]) {
//mirror([i,0,0])
//translate([-4.5,0,0])
//import("plate.stl");
//}
