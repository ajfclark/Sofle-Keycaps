include <KeyV2/includes.scad>
use <KeyV2/src/functions.scad>

module ajp_row(row=3,column) {
	$total_depth = $total_depth * 2/3;
	
  if (row == 5){
	echo(row);
    $top_tilt = -12.5;
    children();
  } else {
    children();
  }
}

sofle_ajfclark_legends = [
  ["\u238b`~","1!","2@",     "3#",     "4$",     "5%",   "",  "", "6^",     "7&",     "8*",     "9(",     "0)", "-_"],
  ["\u21b9",  "Q", "W",      "E",      "R",      "T",    "",  "", "Y",      "U",      "I",      "O",      "P",  "\u2327"],
  ["\u2388",  "A", "S",      "D",      "F",      "G",    "",  "", "H",      "J",      "K",      "L",      ";:", "'\""],
  ["\u21e7",  "Z", "X",      "C",      "V",      "B",    "",  "", "N",      "M",      ",<",     ".>",     "/?", "\u21e7\u21b5"],
  ["",        "",  "\u2756", "\u2387", "\u2388","\u2207"," "," ", "\u2206", "\u2318", "\u2325", "\u2384", "",   ""],
];

sofle_blank_legends = [
	["","","","","","","","","","","","","",""],
	["","","","","","","","","","","","","",""],
	["","","","","","","","","","","","","",""],
	["","","","","","","","","","","","","",""],
	["","","","","","","","","","","","","",""],
];

$font="Code2000";
$font_size=5;
$stem_support_type = "disable"; // [tines, brim, disabled]
legends=sofle_ajfclark_legends;
$double_sculpted=false;
$double_sculpt_radius=400;
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
