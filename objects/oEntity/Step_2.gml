/// @description Update Built-in X/Y
x = xx+parent.set.dlt[0]
y = yy+parent.set.dlt[1]

// Init
if(fd <= 0 and alarm[0] < 0) alarm[0] = Gspd*2

// Update Visibility
dpct = 1-max(0,min(1,point_distance(x,y,wmx,wmy)/p.flash.rad))
bgc[0] = dpct
fgc[0] = dpct