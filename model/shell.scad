
function half(x) = x/2;
function ww(x) = x + (shell_wall * 2);
function mw1(x) = x - shell_wall;
function mw2(x) = x - (shell_wall * 2);

module shell(dim,wall)
{
    cutout = [
        dim[0] + 1,
        mw2(dim[1]),
        mw1(dim[2]) + 0.1
    ];
    difference()
    {
        cube(dim,center=true);
        translate([0,half(wall),half(wall)])
        #cube(cutout,center=true);
    }
}



//--------------------
shell_wall = 4;
shell_width = 50 ;
shell_height = 60;
shell_depth = 60;
screen_pcb_height = 28;
screen_pcb_width = 27.5;


shell(
    [
        ww(shell_width),
        ww(shell_height),
        ww(shell_depth)
    ],
    shell_wall
);