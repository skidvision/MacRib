/*
 *  RibGlue.c
 *  MacRib
 *
 *  Created by flip phillips on 9/30/04.
 *  Copyright 2004 skidmore ebv labs. All rights reserved.
 *
 *  $Id: RibGlue.c 22 2007-06-03 04:24:18Z flip $
 */

#include "mathlink.h"
#include "ri.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #include <RibGlue.h>

////
// utility
////
typedef struct {	
	void	*array;
	int		len;
	unsigned char aType;
} apar;

// globals. i know. i'm tired. it doesn't matter, chompers aren't re-entrant
static int		*gIparams;
static float	*gFparams; 
static char		**gSparams;
static apar		*gAparams;

static int		gNfp=0, gNsp=0, gNip=0,gNap=0;

//
// chomp parses off name-value pairs from a list
// its up to you to make sure that the values have the right types
// there's no way to know from the RiSpec what optional arguments' types
// should be
//
int
chompPairs(long *nparams, RtToken **tokens, RtPointer **pparams)
{
	int	n,np;
	int i,j;
	float* fp;
	int* ip;
	apar* ap;
	
	// do we even have a list of things to parse?
	MLTestHead(stdlink,"List",&n);
	if(n<=0) {
		*nparams = 0;
		*tokens = NULL;
		*pparams = NULL;
		return 0;
	}
	// do we have an even number of things to parse?
	else if (n%2 != 0) {
		*nparams = 0;
		*tokens = NULL;
		*pparams = NULL;
		return RIE_MISSINGDATA;
	}
	
	// we're going to make this harder
	// than we probably should
	np = n/2; *nparams = np;
	
	// allocate stuff to be passed to V functions
	*tokens = (RtToken*)malloc(np*sizeof(RtToken));
	*pparams = (RtPointer*)malloc(np*sizeof(RtPointer));

	// allocate storage for worst case
	gIparams = (int*)malloc(np*sizeof(int));
	gFparams = (float*)malloc(np*sizeof(float));
	gSparams = (char**)malloc(np*sizeof(char*));
	gAparams = (apar*)malloc(np*sizeof(apar));

	// peel off pairs
	for(i=0;i<np;i++) {
		// token
		MLGetString(stdlink,(kcharpp_ct)&(*tokens)[i]);
		
		// value
		switch (MLGetNext(stdlink)) {
			case MLTKINT:
				MLGetInteger32(stdlink,&gIparams[gNip]);
				(*pparams)[i] = &gIparams[gNip++];
				break;
				
			case MLTKREAL:
				MLGetReal32(stdlink,&gFparams[gNfp]);
				(*pparams)[i] = &gFparams[gNfp++];
				break;
				
			case MLTKSTR:
				MLGetString(stdlink,(kcharpp_ct)&gSparams[gNsp]);
				(*pparams)[i]=&gSparams[gNsp++];
				break;
			
				// better be a list...
			case MLTKFUNC: 
				MLTestHead(stdlink,"List",&n);
				if(n<=0) {
					MLFlush(stdlink);
					return RIE_MISSINGDATA;
				}
					
				ap=&gAparams[gNap++];
				ap->aType=MLGetNext(stdlink);
				ap->len=n;
				ap->array=(void*)malloc(sizeof(int)*n);
				fp=(float*)ap->array;
				ip=(int*)ap->array;
										
				for(j=0;j<n;j++,fp++,ip++) {
					switch(ap->aType) {
						case MLTKINT:
							MLGetInteger32(stdlink,ip);
							break;
						case MLTKREAL:
							MLGetReal32(stdlink,fp);
							break;
							
						default: //error
							MLFlush(stdlink);
							return RIE_MISSINGDATA;
							
					}
				}

				(*pparams)[i]=ap->array;
				break;
				
			default: // error
				MLFlush(stdlink);
				return RIE_MISSINGDATA;
		}
	}

	return 0;
}

void
cleanTeeth(long nparams, RtToken *tokens, RtPointer *params)
{
	long i;

	if(nparams <= 0)
		return;
	
	// clean up mathlink
	for(i=0;i<nparams;i++)
		MLReleaseString(stdlink,tokens[i]);

	for(i=0;i<gNsp;i++)
		MLReleaseString(stdlink,gSparams[i]);

	for(i=0;i<gNap;i++) {
		apar* ap=&gAparams[i];
		free(ap->array);
	}
	
	// clean up our universe
	free(tokens);   
	free(params);
	free(gIparams);
	free(gFparams);
	free(gSparams);
	free(gAparams);
	
	gNfp=0, gNsp=0, gNip=0; gNap=0;
}


// globals
int gRiLastError() {return RiLastError;}

// filtration
/* no glue needed
float	RiGaussianFilter(float x, float y, float xwidth, float ywidth);
float	RiBoxFilter(float x, float y, float xwidth, float ywidth);
float	RiTriangleFilter(float x, float y, float xwidth, float ywidth);
float	RiCatmullRomFilter(float x, float y, float xwidth, float ywidth);
float	RiSeparableCatmullRomFilter(float x, float y, float xwidth, float ywidth);
float	RiBlackmanHarrisFilter(float x, float y, float xwidth, float ywidth);
float	RiLanczosFilter(float x, float y, float xwidth, float ywidth);
float	RiMitchellFilter(float x, float y, float xwidth, float ywidth);
float	RiSincFilter(float x, float y, float xwidth, float ywidth);
float	RiBesselFilter(float x, float y, float xwidth, float ywidth);
float	RiDiskFilter(float x, float y, float xwidth, float ywidth);
*/

// error stuff
int gRiErrorIgnore(int code, int severity, char *msg) { RiErrorIgnore(code, severity, msg); return RiLastError; }
int gRiErrorPrint(int code, int severity, char *msg) { RiErrorPrint(code, severity, msg); return RiLastError; }
int gRiErrorPrintOnce(int code, int severity, char *msg) { RiErrorPrintOnce(code, severity, msg); return RiLastError; }
int gRiErrorCondAbort(int code, int severity, char *msg) { RiErrorCondAbort(code, severity, msg); return RiLastError; }
int gRiErrorAbort(int code, int severity, char *msg) { RiErrorAbort(code, severity, msg); return RiLastError; }
int gRiErrorCleanup(void) { RiErrorCleanup(); return RiLastError; }

////
// procs
//// 
// NEEDS IMPLEMENTATION
// RtVoid	RiProcDelayedReadArchive(RtPointer data, float detail);
// RtVoid	RiProcRunProgram(RtPointer data, float detail);
// RtVoid	RiProcDynamicLoad(RtPointer data, float detail);

////
// context
////
void gRiGetContext(void)
{
	RtContextHandle ctx = RiGetContext();
	MLPutFunction(stdlink,"RtContextHandle",1);
	MLPutInteger(stdlink,(int)ctx);
	return;
}

int gRiContext(int ip)
{
	RtContextHandle ctx;

	ctx = (RtContextHandle)ip;
	RiContext(ctx);
	return RiLastError;
}

////
// declare token
////
void gRiDeclare(char *name, char *declaration) { MLPutString(stdlink,RiDeclare(name,declaration));}

////
// general state
////
int gRiBegin(char* name) { RiBegin(name); return RiLastError; }
int gRiEnd() { RiEnd(); return RiLastError; }
int gRiFrameBegin(int num) { RiFrameBegin(num); return RiLastError; }
int gRiFrameEnd() { RiFrameEnd(); return RiLastError; }
int gRiWorldBegin() { RiWorldBegin(); return RiLastError; }
int gRiWorldEnd() { RiWorldEnd(); return RiLastError; }

////
// image formation
////
int gRiFormat(int xres, int yres, double aspect) {RiFormat(xres,yres,aspect); return RiLastError;}
int gRiFrameAspectRatio(double aspect) {RiFrameAspectRatio(aspect); return RiLastError;}
int gRiScreenWindow(double left, double right, double bot, double top) {RiScreenWindow(left,right,bot,top); return RiLastError;}
int gRiCropWindow(double xmin, double xmax, double ymin, double ymax) {RiCropWindow(xmin,xmax,ymin,ymax); return RiLastError;}

int gRiProjection(char* name)
{	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiProjectionV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiClipping(double hither, double yon) {RiClipping(hither,yon); return RiLastError;}
int gRiClippingPlane(double Nx, double Ny, double Nz, double Px, double Py, double Pz) {RiClippingPlane(Nx,Ny,Nz,Px,Py,Pz); return RiLastError;}
int gRiDepthOfField(double fstop, double focallength, double focaldistance) {RiDepthOfField(fstop,focallength,focaldistance); return RiLastError;}
int gRiShutter(double min, double max) {RiShutter(min,max); return RiLastError;}

int gRiPixelVariance(double variation){ RiPixelVariance(variation); return RiLastError; }
int gRiPixelFidelity(double variation){ RiPixelFidelity(variation); return RiLastError; }
int gRiPixelSamples(double xsamples, double ysamples){ RiPixelSamples(xsamples, ysamples); return RiLastError; }
//int gRiPixelFilter(RtFilterFunc filterfunc, float xwidth, float ywidth){ RiPixelFilter(filterfunc, xwidth, ywidth); return RiLastError; }
int gRiExposure(double gain, double gamma){ RiExposure(gain, gamma); return RiLastError; }

int gRiImager(char* name)
{ 
	RtToken *tokens;
	RtPointer *parms;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &parms)))
		goto error;
	
	RiImagerV(name, nparams, tokens, parms); 
	cleanTeeth(nparams,tokens,parms);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiQuantize(char* type, int one, int min, int max, double ampl){ RiQuantize( type, one, min, max, ampl); return RiLastError; }

int gRiDisplay(char *name, char* type, char* mode)
{ 
	RtToken *tokens;
	RtPointer *parms;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &parms)))
		goto error;
	
	RiDisplayV(name, type, mode, nparams, tokens, parms);
	cleanTeeth(nparams,tokens,parms);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}
	
int gRiHider(char* type)
{ 
	RtToken *tokens;
	RtPointer *parms;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &parms)))
		goto error;
	
	RiHiderV(type, nparams, tokens, parms);
	cleanTeeth(nparams,tokens,parms);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiColorSamples(int n, double nRGB[], long len1, double RGBn[], long len2)
{ 
	float nnRGB[512]; // if you have a color space this large you're in trouble
	float RGBnn[512];
	long i;
	
	if((len1!=len2!=n*3)||len1>512)
		return RIE_MISSINGDATA;
	for(i=0;i<len1;i++) {
		nnRGB[i]=nRGB[i];
		RGBnn[i]=RGBn[i];
	}
	
	RiColorSamples(n, nnRGB, RGBnn); 
	return RiLastError; 
}

int gRiRelativeDetail(double relativedetail){ RiRelativeDetail(relativedetail); return RiLastError; }

int gRiOption(char* name)
{	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiOptionV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

////
// attributes
////
int gRiAttributeBegin(void){ RiAttributeBegin(); return RiLastError; }
int gRiAttributeEnd(void){ RiAttributeEnd(); return RiLastError; }

int gRiColor(double r, double g, double b)
{ 
	RtColor cc={r,g,b}; 
	RiColor(cc); 
	return RiLastError; 
}

int gRiOpacity(double r, double g, double b)
{
	RtColor cc={r,g,b}; 
	RiOpacity(cc); 
	return RiLastError; 
}

int gRiTextureCoordinates(double s1, double t1, double s2, double t2, double s3, double t3, double s4, double t4){ RiTextureCoordinates( s1, t1, s2, t2, s3, t3, s4, t4); return RiLastError; }

////
// light sources
////

void gRiLightSource(char* type)
{ 
	RtLightHandle hndl;
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	hndl = RiLightSourceV(type, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	
	MLPutFunction(stdlink,"RtLightHandle",1);
	MLPutInteger(stdlink,(int)hndl);
	return;
	
error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	MLPutSymbol(stdlink,"$Failed");
	return;
}

void gRiAreaLightSource(char* type)
{ 
	RtLightHandle hndl;
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	hndl = RiAreaLightSource(type, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	
	MLPutFunction(stdlink,"RtLightHandle",1);
	MLPutInteger(stdlink,(int)hndl);
	return;
	
error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	MLPutSymbol(stdlink,"$Failed");
	return;
}

int gRiIlluminate(int ip, char* state)
{
	RtLightHandle light = (RtLightHandle)ip;
	RiIlluminate(light,strcmp(state,"True")?1:0);
	return RiLastError;	
}

int gRiSurface(char* name)
{	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiSurfaceV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiAtmosphere(char* name)
{	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiAtmosphereV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiInterior(char* name)
{	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiInteriorV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiExterior(char* name)
{	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiExteriorV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiShadingRate(double size){ RiShadingRate(size); return RiLastError; }
int	gRiShadingInterpolation(char* type){ RiShadingInterpolation(type); return RiLastError; }
int gRiMatte(char* state){ RiMatte(strcmp(state,"True")?1:0); return RiLastError; }

int gRiBound(double xmin, double xmax, double ymin, double ymax, double zmin, double zmax)
{
	RtBound bb = {xmin, xmax, ymin, ymax, zmin, zmax};
	RiBound(bb);
	return RiLastError;	
}
int gRiDetail(double xmin, double xmax, double ymin, double ymax, double zmin, double zmax)
{
	RtBound bb = {xmin, xmax, ymin, ymax, zmin, zmax};
	RiDetail(bb);
	return RiLastError;	
}

int gRiDetailRange(double minvis, double lowtran, double uptran, double maxvis){ RiDetailRange(minvis,lowtran,uptran,maxvis); return RiLastError; }
int	gRiGeometricApproximation(char* type, double value){ RiGeometricApproximation(type,value); return RiLastError; }
int gRiOrientation(char* orientation){ RiOrientation(orientation); return RiLastError; }
int gRiReverseOrientation(void){ RiReverseOrientation(); return RiLastError; }
int gRiSides(int sides){ RiSides(sides); return RiLastError; }

////
// transformations
////

int gRiIdentity(void){ RiIdentity(); return RiLastError; }

int gRiTransform(void) 
{
	RtMatrix m;
	float *mp = (float*)m;
	double *a; long *dims;
	char **heads; long d,i; int err = 0;
	
	MLGetRealArray(stdlink,&a,&dims,&heads,&d);
	if(d!=2 || dims[0]!=4 || dims[1]!=4){
		err = RIE_MISSINGDATA;
		goto error;
	}
	for(i=0;i<16;i++)
		mp[i]=a[i];
	
	RiTransform(m);

error:	
	MLDisownRealArray(stdlink,a,dims,heads,d);
	return err;
}

int gRiConcatTransform(RtMatrix transform)
{
	RtMatrix m;
	float *mp = (float*)m;
	double *a; long *dims;
	char **heads; long d,i; int err = 0;
	
	MLGetRealArray(stdlink,&a,&dims,&heads,&d);
	if(d!=2 || dims[0]!=4 || dims[1]!=4){
		err = RIE_MISSINGDATA;
		goto error;
	}
	for(i=0;i<16;i++)
		mp[i]=a[i];
	
	RiConcatTransform(m);

error:	
	MLDisownRealArray(stdlink,a,dims,heads,d);
	return err;
}

int gRiPerspective(double fov){ RiPerspective(fov); return RiLastError; }
int gRiTranslate(double dx, double dy, double dz){ RiTranslate(dx,dy,dz); return RiLastError; }
int gRiRotate(double angle, double dx, double dy, double dz){ RiRotate(angle,dx,dy,dz); return RiLastError; }
int gRiScale(double sx, double sy, double sz){ RiScale(sx,sy,sz); return RiLastError; }
int gRiSkew(double angle, double dx1, double dy1, double dz1, double dx2, double dy2, double dz2){ RiSkew(angle,dx1,dy1,dz1,dx2,dy2,dz2); return RiLastError; }

int gRiDeformation(char* name)
{ 	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiDeformationV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiDisplacement(char* name)
{ 	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiDisplacementV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

int gRiCoordinateSystem(char* space){ RiCoordinateSystem(space); return RiLastError; }
int gRiScopedCoordinateSystem(char* space){ RiScopedCoordinateSystem(space); return RiLastError; }
int gRiCoordSysTransform(char* space){ RiCoordSysTransform(space); return RiLastError; }

// this is here but is unclaimed... RiTransformPoints isn't available under macos
void gRiTransformPoints(char* fromspace, char* tospace)
{
	RtPoint *m;
	float *mp;
	double *a,*ap; long *dims;
	char **heads; long d,i,j; int err = 0;
	
	MLGetRealArray(stdlink,&a,&dims,&heads,&d);
	if(d!=2 || dims[1]!=3){
		MLDisownRealArray(stdlink,a,dims,heads,d);
		a=NULL;
		return;
	}
	
	m=(RtPoint*)malloc(dims[0]*sizeof(RtPoint));
	
	for(mp=(float*)m,ap=a,i=0;i<dims[0]*dims[1];i++,mp++,ap++)
			*mp=*ap;
			
	RiTransformPoints(fromspace, tospace, dims[0], m);
	
	for(mp=(float*)m,ap=a,i=0;i<dims[0]*dims[1];i++,mp++,ap++)
			*ap=*mp;
	
	MLPutRealArray(stdlink,a,dims,NULL,d);
	
	free(m);

	// not going to disown since we are returning it?
	return;
}

int gRiTransformBegin(void){ RiTransformBegin(); return RiLastError; }
int gRiTransformEnd(void){ RiTransformEnd(); return RiLastError; }

////
// attributes
////

int gRiAttribute(char* name)
{ 	
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiAttributeV(name, nparams, tokens, params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

/////
// geometry
////

int gRiPolygon(void)
{
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	// hack alert... presumes that P is first...
	// RiPolygonV(gAparams[0].dims[0],nparams,tokens,params);
	// need diff parser here
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

//	RiGeneralPolygon(RtInt nloops, RtInt nverts[], ...),

int
gRiPointsPolygons(int npolys, int* nverts, long nnnverts, int* verts, long nnverts)
{
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiPointsPolygonsV(npolys,nverts,verts,nparams,tokens,params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;
	
error:
	MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

//	RiPointsGeneralPolygons(RtInt npolys, RtInt nloops[], RtInt nverts[], RtInt verts[], ...),
//	RiBasis(RtBasis ubasis, RtInt ustep, RtBasis vbasis, RtInt vstep),

//	RiPatch(RtToken type, ...),
//RiPatchV(RtToken type, RtInt n, RtToken tokens[], RtPointer parms[]),

int gRiPatch(char* type)
{
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiPatchV(type,nparams,tokens,params);
	
	cleanTeeth(nparams,tokens,params);
	return RiLastError;
	
error:
		MLClearError(stdlink);
	MLFlush(stdlink);
	return err;
}

//	RiPatchMesh(RtToken type, RtInt nu, RtToken uwrap, RtInt nv, RtToken vwrap, ...),
//	RiNuPatch(RtInt nu, RtInt uorder, RtFloat uknot[], RtFloat umin, RtFloat umax,
//			RtInt nv, RtInt vorder, RtFloat vknot[], RtFloat vmin,
//			RtFloat vmax, ...),

int gRiSphere(double radius, double zmin, double zmax, double tmax)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiSphereV(radius, zmin, zmax, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiCone(double height, double radius, double tmax)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiConeV(height, radius, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiCylinder(double radius, double zmin, double zmax, double tmax)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiCylinderV(radius, zmin, zmax, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiHyperboloid(RtPoint point1, RtPoint point2, double tmax)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiHyperboloidV(point1, point2, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiParaboloid(double rmax, double zmin, double zmax, double tmax)
{
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiParaboloidV(rmax, zmin, zmax, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiDisk(double height, double radius, double tmax)
{
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiDiskV(height, radius, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiTorus(double majrad, double minrad, double phimin, double phimax, double tmax)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;

	RiTorusV(majrad, minrad, phimin, phimax, tmax,nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

// Needs Implementation
//RiBlobby(RtInt nleaf, RtInt ncode, RtInt code[], 
//		       RtInt nflt, RtFloat flt[],
//		       RtInt nstr, RtToken str[], ...);

int gRiCurves(char* type, int ncurves, int nvertices[], char* wrap)
{
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiCurvesV(type, ncurves, nvertices, wrap, nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiPoints(int nverts)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiPointsV(nverts, nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

// Needs implementation
//int gRiSubdivisionMesh(char* mask, int nf, int nverts[], int verts[], int ntags, char* tags[], int numargs[],int intargs[], double floatargs[]){ RiSubdivisionMesh(mask, nf, nverts[], verts[], ntags, tags[], numargs[],intargs[], floatargs[]); return RiLastError; }
//int gRiTrimCurve(int nloops, int ncurves[], int order[], double knot[],	double min[], double max[], int n[],double u[], double v[], double w[]){ RiTrimCurve(nloops, ncurves[], order[], knot[],	min[], max[], n[],u[], v[], w[]); return RiLastError; }
// int gRiProcedural(RtPointer data, RtBound bound, RtVoid (*subdivfunc)(RtPointer, double), RtVoid (*freefunc)(RtPointer)){ RiProcedural(RtPointer data, RtBound bound, RtVoid (*subdivfunc)(, ), RtVoid (*freefunc)()); return RiLastError; }

int gRiGeometry(char* type)
{ 
	RtToken *tokens;
	RtPointer *params;
	long nparams;
	int err;
	
	if((err=chompPairs(&nparams, &tokens, &params)))
		goto error;
	
	RiGeometryV(type, nparams,tokens,params);
	cleanTeeth(nparams,tokens,params);
	return RiLastError;

error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiSolidBegin(char* operation){ RiSolidBegin(operation); return RiLastError; }
int gRiSolidEnd(void){ RiSolidEnd(); return RiLastError; }

void gRiObjectBegin(void)
{
	RtObjectHandle oh = RiObjectBegin();
	MLPutFunction(stdlink,"RtObjectHandle",1);
	MLPutInteger(stdlink,(int)oh);
	return;

}

int gRiObjectEnd(void){ RiObjectEnd(); return RiLastError; }

int gRiObjectInstance(int op)
{
	RtObjectHandle obj;

	obj = (RtObjectHandle)op;
	RiObjectInstance(obj);
	return RiLastError;
}

int gRiMotionBegin(double times[], long len)
{ 
	int i;
	double *tp = times;
	float *d,*dp;
	
	d = (float*)malloc(len * sizeof(float));
	for(dp=d,i=0;i<len;i++)
		*dp++ = *tp++;
	RiMotionBeginV(len, d); 
	free(d);	
	return RiLastError;
}

int gRiMotionEnd(void){ RiMotionEnd(); return RiLastError; }

////
// archive
////

// no printf formatting supported
int gRiArchiveRecord(char* type, char *format) { RiArchiveRecord(type,format); return RiLastError;}

// callback not supported
int gRiReadArchive(char *name)
{
    RtToken *tokens;
    RtPointer *params;
    long nparams;
    int err;
    
    if((err=chompPairs(&nparams, &tokens, &params)))
        goto error;
    
    RiReadArchive(name,NULL,nparams,tokens,params);
    cleanTeeth(nparams,tokens,params);
    return RiLastError;
    
error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiArchiveBegin(char* name)
{
    RtToken *tokens;
    RtPointer *params;
    long nparams;
    int err;
    
    if((err=chompPairs(&nparams, &tokens, &params)))
        goto error;
    
    RiArchiveBegin(name,nparams,tokens,params);
    cleanTeeth(nparams,tokens,params);
    return RiLastError;
    
error:
	MLClearError(stdlink); MLFlush(stdlink);
	return err;
}

int gRiArchiveEnd(void){ RiArchiveEnd(); return RiLastError; }
