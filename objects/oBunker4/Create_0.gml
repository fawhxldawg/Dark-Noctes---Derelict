/// @description Init Room

// Basic Inits
in_room = room
s = id

#region Create Struct
	
	set = {
	
		w : noone,
		h : noone,
		w2 : noone,
		h2 : noone,
		w4 : noone,
		h4 : noone,
		w8 : noone,
		h8 : noone,
		spr : noone,
		scl : noone,
		dlt : noone,
		dlt_mx	: noone,
		off : noone,
	
		node : {
				
			n0: init_node([ww2,wh2],"Hallway Ahead",verb2.move,in_room,rBunker5,self), // UPDATE ME
			n1: init_node([ww2,wh2],"Back Through Vault",verb2.move,in_room,rBunker3,self),  // UPDATE ME
			n2: init_node([ww2,wh2],"Hallway to the Left",verb2.move,in_room,rBunker9,self)  // UPDATE ME
				
		},
	
		entity : {},
		
		context : {
			
			c0: init_context([ww2,wh2],"Audio Log",ent.normal,in_room,self)
			
		}
	
	}
	
#endregion

#region Init Struct Updatees
	
	set.spr = [sprite_get_width(sprite_index),sprite_get_height(sprite_index)]
	set.scl = M.hRef/set.spr[1]
	set.dlt = [((set.spr[0]*set.scl)-ww)*-M.mx_pct,((set.spr[1]*set.scl)-wh)*-M.my_pct]
	set.dlt_mx = [((set.spr[0]*set.scl)-ww)*-1,((set.spr[1]*set.scl)-wh)*-1]
	set.off = [sprite_get_xoffset(sprite_index)*set.scl,sprite_get_yoffset(sprite_index)*set.scl]
	
#endregion

#region Ref Updates
	
	set.w = floor(set.spr[0]*set.scl)
	set.h = floor(set.spr[1]*set.scl)
	set.w2 = round(set.w/2)
	set.h2 = round(set.h/2)
	set.w4 = round(set.w/4)
	set.h4 = round(set.h/4)
	set.w8 = round(set.w/8)
	set.h8 = round(set.h/8)
	
#endregion

#region Node Updatees
	
	// Next (n0)
	with(set.node.n0) {
		
		xx = parent.set.off[0]
		yy = parent.set.off[1]
	
	}
	
	// Back (n1)
	with(set.node.n1) {
	
		dynamic = t
		xrng = [parent.set.w8/parent.set.w,
				(parent.set.w-parent.set.w8)/parent.set.w]
		yrng = [0.94,0.96]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
	
	}
	
	// Next Left (n2)
	with(set.node.n2) {
	
		dynamic = t
		xrng = [parent.set.w8/parent.set.w,
				(parent.set.w-parent.set.w8)/parent.set.w]
		xrng = [0.33,0.35]
		yrng = [0.44,0.52]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
	
	}
	
#endregion

#region Entity Updatees
	
#endregion

#region Contextual Updatees
	
	with(set.context.c0) {
		
		xrng = [0.75,0.75]
		yrng = [0.75,0.75]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		sprRot = random_range(-45,45)
		snd = log1_2
		
	}
	
#endregion