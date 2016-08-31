/*
 *  RibGlue.h
 *  MacRib
 *
 *  Created by flip phillips on 6/2/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 *  $Id: RibGlue.h 22 2007-06-03 04:24:18Z flip $
 *
 */

// how to map from options to types in RiOption calls
// probably need for other things too, but for now, that's how we'll do it
//

typedef enum {
	tOption,
	tImager,
	tHider,
	tDisplay,
	tPixelFilter,
	tAttribute,
	tGeometricApproximation
} catList;

typedef enum  {
	tInt,
	tFloat,
	tIntArray2,
	tIntArray3,
	tIntArray4,
	tFloatArray2,
	tFloatArray3,
	tFloatArray4,
	tString,
	tStringArray,
	tNone
} typeList;

typedef struct {
	catList		ctype;
	char*		name;
	char*		token;
	typeList	vtype;
} optType;

//
//
// NB - I started this but have decided on a different approach wherein 
//		the type of list in rMan is what gives us what we want- that is
//		its up to you to make sure you have the right type
//
//
optType kOptionTable[] = {
//options	
	{tOption,	"bucket",	"order",	tString},

	{tOption,	"limits",	"bucketsize",		tIntArray2},
	{tOption,	"limits",	"gridsize",			tInt},
	{tOption,	"limits",	"texturememory",	tInt},
	{tOption,	"limits",	"brickmemory",		tInt},
	{tOption,	"limits",	"deepshadowtiles",	tInt},
	{tOption,	"limits",	"geocachememory",	tInt},
	{tOption,	"limits",	"zthreshold",		tFloatArray3},
	{tOption,	"limits",	"othreshold",		tFloatArray3},

	{tOption,	"rib",		"format",	tString},
	
	{tOption,	"ribparse",	"varsubst",	tString},

	{tOption,	"searchpath", "shader",				tString},
	{tOption,	"searchpath", "texture",			tString},
	{tOption,	"searchpath", "vfxmaster",			tString},
	{tOption,	"searchpath", "vfxinstance",		tString},
	{tOption,	"searchpath", "display",			tString},
	{tOption,	"searchpath", "archive",			tString},
	{tOption,	"searchpath", "procedural",			tString},
	{tOption,	"searchpath", "resource",			tString},
	{tOption,	"searchpath", "servershader",		tString},
	{tOption,	"searchpath", "servertexture",		tString},
	{tOption,	"searchpath", "servervfxmaster",	tString},
	{tOption,	"searchpath", "servervfxinstance",	tString},
	{tOption,	"searchpath", "serverdisplay",		tString},
	{tOption,	"searchpath", "serverarchive",		tString},
	{tOption,	"searchpath", "serverresource",		tString},
	{tOption,	"searchpath", "dirmap",				tString},
	
	{tOption,	"shading",	"debug",		tInt},
	{tOption,	"shading",	"checknans",	tInt},
	{tOption,	"shading",	"objectcache",	tFloat},

	{tOption,	"shadow",	"bias",	tFloat},
	
	{tOption,	"shutter",	"offset",		tFloat},
	{tOption,	"shutter",	"clampmotion",	tInt},
	
	{tOption,	"statistics",	"endofframe",		tInt},
	{tOption,	"statistics",	"filename",			tString},
	{tOption,	"statistics",	"xmlfilename",		tString},
	{tOption,	"statistics",	"stylesheet",		tString},
	{tOption,	"statistics",	"shaderprofile",	tString},
	{tOption,	"statistics",	"displace_ratios",	tFloat2},
		
	{tOption,	"texture",		"enable gaussian",	tFloat},
	{tOption,	"texture",		"enable lerp",		tFloat},
	{tOption,	"texture",		"texturefilter",	tString},
	
	{tOption,	"trace",	"maxdepth",				tInt},
	{tOption,	"trace",	"specularthreshold",	tFloat},
	
	{tOption,	"user",		"",	tString},

//attributes
	{tAttribute, "cull",	"backfacing",	tInt},
	{tAttribute, "cull",	"hidden",		tInt},
	
	{tAttribute, "derivatives" "centered",	 tInt},
	{tAttribute, "derivatives" "extrapolate", tInt},
	
	{tAttribute, "dice",	"binary",			tInt},
	{tAttribute, "dice",	"hair",				tInt},
	{tAttribute, "dice",	"rasterorient",		tInt},
	{tAttribute, "dice",	"strategy",			tString},
	{tAttribute, "dice",	"referencecamera",	tString},
	
	{tAttribute, "displacementbound", "sphere", tFloat},
	{tAttribute, "displacementbound", "coordinatesystem", tString},
	
	{tAttribute, "grouping", "membership", tString},
	
	{tAttribute, "stochastic", "sigma", tInt},
	{tAttribute, "stochastic", "pointfalloff", tInt},
	
	{tAttribute, "identifier", "name", tString},

	/*	
	
	Attribute "irradiance "float maxerror" [f]
"float maxpixeldist" [f]



Attribute "photon" "int estimator" [i]
"string causticmap" [s]
"string globalmap" [s]
"string shadingmodel" [s]



Attribute "sides" "float backfacetolerance" [f]
"int doubleshaded" [b]



Attribute "shade" "string strategy" [s]
"string volumeintersectionstrategy" [s]
"float volumeintersectionpriority" [f]
"string diffusehitmode" [s]
"string specularhitmode" [s]
"string transmissionhitmode" [s]
"string camerahitmode" [s]
"relativeshadingrate" [f]
"resetrelativeshadingrate" [f]



Attribute "stitch" "int enable" [b]
"int traceenable" [b]
"int newgroup" [b]



Attribute "trace" "int maxdiffusedepth" [i]
"int maxspeculardepth" [i]
"int displacements" [b]
"float bias" [f]
"int samplemotion" [b]



Attribute "trimcurve" "string sense" [s]



Attribute "user" "myattribute" [x]



Attribute "visibility" "int camera" [v]
"int diffuse" [b]
"int specular" [b]
"int transmission" [b]
"int photon" [b]
"int midpoint" [b]



GeometricApproximation "float motionfactor" f



Attribute "procedural" "string attributes" [s]

*/


//imagers	
	{tImager,	"name",		"",			tNone},
	
//hiders
	{tHider,	"photon",	"",			tNone},
	
	{tHider,	"depthmask",	"zfile",		tString},
	{tHider,	"depthmask",	"reversesign",	tInt},
	{tHider,	"depthmask",		"depthbias",	tFloat}

//pixel filters need something special
	
//displays need something special

};
// for other things

