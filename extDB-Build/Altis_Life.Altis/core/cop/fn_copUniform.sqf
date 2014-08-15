/*
	COP UNIFORM SCRIPT
	Author: coldgas (http://altis.newhopeoutfit.de)
	Created for www.altisliferpg.com
*/

	#define __GETC__(var) (call var)
	
	if (__GETC__(life_coplevel) > 0)  then {
		player setObjectTextureGlobal [0, "textures\2nd_LT_Uniform.jpg"];
	};

	if (__GETC__(life_coplevel) > 1)  then {
		player setObjectTextureGlobal [0, "textures\1st_LT_Uniform.jpg"];
	};
	
	if (__GETC__(life_coplevel) > 2)  then {
		player setObjectTextureGlobal [0, "textures\CPT_Uniform.jpg"];
	};
	
	if (__GETC__(life_coplevel) > 3)  then {
		player setObjectTextureGlobal [0, "textures\COL_Uniform.jpg"];
	};
	
	if (__GETC__(life_coplevel) > 4)  then {
		player setObjectTextureGlobal [0, "textures\Chief_Uniform.jpg"];
	};
	
	
	if ((uniform player) == "U_B_CombatUniform_mcam_worn")  then {
		player setObjectTextureGlobal [0, "textures\YOURFILENAME.FILETYPE"];
	};
	
