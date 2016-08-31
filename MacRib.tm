// 
// MacRib.tm 
// MathLink template file for RenderMan interface
//
// Copyright 2004 skidmore ebv labs. All rights reserved.
//
// $Id: MacRib.tm 20 2007-06-02 16:34:39Z flip $
//

:Evaluate: BeginPackage["RenderMan`"]

:Evaluate:  RenderMan::usage = "The RenderMan package is a mostly complete implementation of the RenderMan Interface standard."

:Evaluate:	$RenderManVersion::usage = "Package version"

:Evaluate:	RtContextHandle::usage = "RtContextHandle represents a RenderMan context structure pointer."
:Evaluate:	RtLightHandle::usage = "RtLightHandle represents a RenderMan light structure pointer."
:Evaluate:	RtObjectHandle::usage = "RtObjectHandle represents a RenderMan object structure pointer."

:Evaluate:		 RiLastError::usage = "RiLastError is the most recent error reported by RenderMan."

:Evaluate:		 RiGaussianFilter::usage = "RiGaussianFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiBoxFilter::usage = "RiBoxFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiTriangleFilter::usage = "RiTriangleFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiCatmullRomFilter::usage = "RiCatmullRomFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiSeparableCatmullRomFilter::usage = "RiSeparableCatmullRomFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiBlackmanHarrisFilter::usage = "RiBlackmanHarrisFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiLanczosFilter::usage = "RiLanczosFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiMitchellFilter::usage = "RiMitchellFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiSincFilter::usage = "RiSincFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiBesselFilter::usage = "RiBesselFilter[x,y,xwidth,ywidth]."
:Evaluate:		 RiDiskFilter::usage = "RiDiskFilter[x,y,xwidth,ywidth]."

:Evaluate:		 RiErrorIgnore::usage = "RiErrorIgnore[code,severity,msg]."
:Evaluate:		 RiErrorPrint::usage = "RiErrorPrint[code,severity,msg]."
:Evaluate:		 RiErrorPrintOnce::usage = "RiErrorPrintOnce[code,severity,msg]."
:Evaluate:		 RiErrorCondAbort::usage = "RiErrorCondAbort[code,severity,msg]."
:Evaluate:		 RiErrorAbort::usage = "RiErrorAbort[code,severity,msg]."
:Evaluate:		 RiErrorCleanup::usage = "RiErrorCleanup[]."

// NEEDS IMPLEMENTATION
// RtVoid	RiProcDelayedReadArchive(RtPointer data, RtFloat detail);
// RtVoid	RiProcRunProgram(RtPointer data, RtFloat detail);
// RtVoid	RiProcDynamicLoad(RtPointer data, RtFloat detail);

:Evaluate:		 RiGetContext::usage = "RiGetContext[]."
:Evaluate:		 RiContext::usage = "RiContext[context]."
:Evaluate:		 RiDeclare::usage = "RiDeclare[name,declaration]."

:Evaluate: RiBegin::usage = "RiBegin[name] begins RenderMan."
:Evaluate: RiEnd::usage = "RiEnd[] ends RenderMan output."
:Evaluate: RiFrameBegin::usage = "RiFrameBegin[frame] begins a frame."
:Evaluate: RiFrameEnd::usage = "RiFrameEnd[] ends a frame."
:Evaluate: RiWorldBegin::usage = "RiWorldBegin[] does a Genisis sort of thing."
:Evaluate: RiWorldEnd::usage = "RiWorldEnd[] pulls a Strangelove on the whole deal."

:Evaluate: RiFormat::usage = "RiFormat[xres,yres,aspect]."
:Evaluate: RiFrameAspectRatio::usage = "RiFrameAspectRatio[aspect]."
:Evaluate: RiScreenWindow::usage = "RiScreenWindow[left,right,bot,top]."
:Evaluate: RiCropWindow::usage = "RiCropWindow[xmin,xmax,ymin,ymax]."
:Evaluate: RiProjection::usage = "RiProjection[name,...]."
:Evaluate: RiClipping::usage = "RiClipping[hither,yon]."
:Evaluate: RiClippingPlane::usage = "RiClippingPlane[Nx,Ny,Nz,Px,Py,Pz]."
:Evaluate: RiDepthOfField::usage = "RiDepthOfField[fstop,focallength,focaldistance]."
:Evaluate: RiShutter::usage = "RiShutter[min,max]."
:Evaluate: RiPixelVariance::usage = "RiPixelVariance[variation]."
:Evaluate: RiPixelFidelity::usage = "RiPixelFidelity[variation]."
:Evaluate: RiPixelSamples::usage = "RiPixelSamples[xsamples,ysamples]."
///	RiPixelFilter(RtFilterFunc filterfunc, RtFloat xwidth, RtFloat ywidth),
:Evaluate: RiExposure::usage = "RiExposure[gain,gamma]."
:Evaluate: RiImager::usage = "RiImager[name,...]."
:Evaluate: RiQuantize::usage = "RiQuantize[type,one,min,max,dither]."
:Evaluate: RiDisplay::usage = "RiDisplay[name,type,mode,...]."
:Evaluate: RiHider::usage = "RiHider[type,...]."
:Evaluate: RiColorSamples::usage = "RiColorSamples[n,nRGB,RGBn]."
:Evaluate: RiRelativeDetail::usage = "RiRelativeDetail[relativedetail]."

:Evaluate: RiOption::usage = "RiOption[type,...]."

:Evaluate: RiAttributeBegin::usage = "RiAttributeBegin[]"
:Evaluate: RiAttributeEnd::usage = "RiAttributeEnd[]"
:Evaluate: RiColor::usage = "RiColor[r,g,b]"
:Evaluate: RiOpacity::usage = "RiOpacity[r,g,b]"
:Evaluate: RiTextureCoordinates::usage = "RiTextureCoordinates[s1,t1,s2,t2,s3,t3,s4,t4]"

:Evaluate: RiLightSource::usage = "RiLightSource[name,...]."
:Evaluate: RiAreaLightSource::usage = "RiAreaLightSource[name,...]."
:Evaluate: RiIlluminate::usage = "RiIlluminate[light,onoff]."
:Evaluate: RiSurface::usage = "RiSurface[name,...]."
:Evaluate: RiAtmosphere::usage = "RiAtmosphere[name,...]."
:Evaluate: RiInterior::usage = "RiInterior[name,...]."
:Evaluate: RiExterior::usage = "RiExterior[name,...]."
:Evaluate: RiShadingRate::usage = "RiShadingRate[size]."
:Evaluate: RiShadingInterpolation::usage = "RiShadingInterpolation[type]."
:Evaluate: RiMatte::usage = "RiMatte[onoff]."

:Evaluate: RiBound::usage = "RiBound[xmin, xmax, ymin, ymax, zmin, zmax]"
:Evaluate: RiDetail::usage = "RiDetail[xmin, xmax, ymin, ymax, zmin, zmax]"
:Evaluate: RiDetailRange::usage = "RiDetailRange[minvis, lowtran, uptran, maxvis]"
:Evaluate: RiGeometricApproximation::usage = "RiGeometricApproximation[type, value]"
:Evaluate: RiOrientation::usage = "RiOrientation[orientation]"
:Evaluate: RiReverseOrientation::usage = "RiReverseOrientation[]"
:Evaluate: RiSides::usage = "RiSides[sides]"

:Evaluate: RiIdentity::usage = "RiIdentity[]"
:Evaluate: RiTransform::usage = "RiTransform[matrix]"
:Evaluate: RiConcatTransform::usage = "RiConcatTransform[matrix]"
:Evaluate: RiPerspective::usage = "RiPerspective[fov]"
:Evaluate: RiTranslate::usage = "RiTranslate[dx,dy,dz]"
:Evaluate: RiRotate::usage = "RiRotate[angle,dx,dy,dz]"
:Evaluate: RiScale::usage = "RiScale[sx,sy,sz]"
:Evaluate: RiSkew::usage = "RiSkew[angle,dx1,dy1,dz1,dx2,dy2,dz2]"
:Evaluate: RiDeformation::usage = "RiDeformation[name,...]."
:Evaluate: RiDisplacement::usage = "RiDisplacement[name,...]."
:Evaluate: RiCoordinateSystem::usage = "RiCoordinateSystem[space]."
:Evaluate: RiCoordSysTransform::usage = "RiCoordSysTransform[space]."
:Evaluate: RiScopedCoordinateSystem::usage = "RiScopedCoordinateSystem[space]."

// :Evaluate: RiTransformPoints::usage = "RiTransformPoints[fromspace,tospace,points]."
:Evaluate: RiTransformBegin::usage = "RiTransformBegin[]."
:Evaluate: RiTransformEnd::usage = "RiTransformEnd[]."

:Evaluate: RiAttribute::usage = "RiAttribute[name,...]."

:Evaluate: RiPolygon::usage = "RiPolygon[points,normals,colors]."
:Evaluate: RiPointsPolygons::usage = "RiPointsPolygons[npolys,nverts,verts,...]"

:Evaluate: RiPatch::usage = "RiPatch[type,...]."

:Evaluate: RiSphere::usage = "RiSphere[radius,zmin,zmax,tmax,...]."
:Evaluate: RiCone::usage = "RiCone[height,radius,tmax,...]."
:Evaluate: RiCylinder::usage = "RiCylinder[radius,zmin,zmax,tmax,...]."
:Evaluate: RiHyperboloid::usage = "RiHyperboloid[point1,point2,tmax,...]."
:Evaluate: RiParaboloid::usage = "RiParaboloid[rmax,zmin,zmax,tmax,...]."
:Evaluate: RiDisk::usage = "RiDisk[height,radius,tmax,...]."
:Evaluate: RiTorus::usage = "RiTorus[majrad,minrad,phimin,phimax,tmax,...]."

:Evaluate: RiCurves::usage = "RiCurves[type,ncurves,nverts,wrap,...]."
:Evaluate: RiPoints::usage = "RiPoints[nverts,...]."

:Evaluate: RiGeometry::usage = "RiGeometry[type,...]."

:Evaluate: RiSolidBegin::usage = "RiSolidBegin[operation]."
:Evaluate: RiSolidEnd::usage = "RiSolidEnd[]."
:Evaluate: RiObjectBegin::usage = "RiObjectBegin[]."
:Evaluate: RiObjectEnd::usage = "RiObjectEnd[]."
:Evaluate: RiObjectInstance::usage = "RiObjectInstance[objecthandle]."
:Evaluate: RiMotionBegin::usage = "RiMotionBegin[times]."
:Evaluate: RiMotionEnd::usage = "RiMotionEnd[]."

:Evaluate: RiArchiveRecord::usage = "RiArchiveRecord[type,string]."
:Evaluate: RiReadArchive::usage = "RiReadArchive[name,...]."
:Evaluate: RiArchiveBegin::usage = "RiArchiveBegin[name,...]."
:Evaluate: RiArchiveEnd::usage = "RiArchiveEnd[]."

:Evaluate: Begin["`Private`"]

////
// globals
////
:Evaluate: $RenderManVersion = "$Id: MacRib.tm 20 2007-06-02 16:34:39Z flip $"


//RtInt	RiLastError;
:Begin:
:Function:       gRiLastError
:Pattern:        RiLastError
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

////
// filters
////

//RtFloat	RiGaussianFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiGaussianFilter
:Pattern:        RiGaussianFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiBoxFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiBoxFilter
:Pattern:        RiBoxFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:


//RtFloat	RiTriangleFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiTriangleFilter
:Pattern:        RiTriangleFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiCatmullRomFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiCatmullRomFilter
:Pattern:        RiCatmullRomFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiSeparableCatmullRomFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiSeparableCatmullRomFilter
:Pattern:        RiSeparableCatmullRomFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiBlackmanHarrisFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiBlackmanHarrisFilter
:Pattern:        RiBlackmanHarrisFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiLanczosFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiLanczosFilter
:Pattern:        RiLanczosFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiMitchellFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiMitchellFilter
:Pattern:        RiMitchellFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiSincFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiSincFilter
:Pattern:        RiSincFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiBesselFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiBesselFilter
:Pattern:        RiBesselFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:

//RtFloat	RiDiskFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
:Begin:
:Function:       RiDiskFilter
:Pattern:        RiDiskFilter[x_Real,y_Real,xwidth_Real,ywidth_Real]
:Arguments:      { x,y,xwidth,ywidth }
:ArgumentTypes:  { Real,Real,Real,Real }
:ReturnType:     Real
:End:


////
// error stuff
////

// RtVoid	RiErrorIgnore(RtInt code, RtInt severity, char *msg);
:Begin:
:Function:       gRiErrorIgnore
:Pattern:        RiErrorIgnore[code_Integer,severity_Integer,msg_String]
:Arguments:      {code,severity,msg }
:ArgumentTypes:  { Integer,Integer,String }
:ReturnType:     Integer
:End:

// RtVoid	RiErrorPrint(RtInt code, RtInt severity, char *msg);
:Begin:
:Function:       gRiErrorPrint
:Pattern:        RiErrorPrint[code_Integer,severity_Integer,msg_String]
:Arguments:      {code,severity,msg }
:ArgumentTypes:  { Integer,Integer,String }
:ReturnType:     Integer
:End:

// RtVoid	RiErrorPrintOnce(RtInt code, RtInt severity, char *msg);
:Begin:
:Function:       gRiErrorPrintOnce
:Pattern:        RiErrorPrintOnce[code_Integer,severity_Integer,msg_String]
:Arguments:      {code,severity,msg }
:ArgumentTypes:  { Integer,Integer,String }
:ReturnType:     Integer
:End:

// RtVoid	RiErrorCondAbort(RtInt code, RtInt severity, char *msg);
:Begin:
:Function:       gRiErrorCondAbort
:Pattern:        RiErrorCondAbort[code_Integer,severity_Integer,msg_String]
:Arguments:      {code,severity,msg }
:ArgumentTypes:  { Integer,Integer,String }
:ReturnType:     Integer
:End:

// RtVoid	RiErrorAbort(RtInt code, RtInt severity, char *msg);
:Begin:
:Function:       gRiErrorAbort
:Pattern:        RiErrorAbort[code_Integer,severity_Integer,msg_String]
:Arguments:      {code,severity,msg }
:ArgumentTypes:  { Integer,Integer,String }
:ReturnType:     Integer
:End:

// RtVoid   RiErrorCleanup(void);
:Begin:
:Function:       gRiErrorCleanup
:Pattern:        RiErrorCleanup[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

////
// procs
////
// NEEDS IMPLEMENTATION
// RtVoid	RiProcDelayedReadArchive(RtPointer data, RtFloat detail);
// RtVoid	RiProcRunProgram(RtPointer data, RtFloat detail);
// RtVoid	RiProcDynamicLoad(RtPointer data, RtFloat detail);

////
// context
//

//RtContextHandle RiGetContext(void);
:Begin:
:Function:       gRiGetContext
:Pattern:        RiGetContext[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Manual
:End:

//RtVoid RiContext(RtContextHandle);
:Begin:
:Function:       gRiContext
:Pattern:        RiContext[RtContextHandle[context_Integer]]
:Arguments:      {context}
:ArgumentTypes:  {Integer}
:ReturnType:     Integer
:End:

////
// declare me
////
// RtToken RiDeclare(char *name, char *declaration);
:Begin:
:Function:       gRiDeclare
:Pattern:        RiDeclare[name_String,declaration_String]
:Arguments:      {name,declaration}
:ArgumentTypes:  {String,String}
:ReturnType:     Manual
:End:

////
// main state stuff
////

// RtVoid RiBegin(RtToken name)
:Begin:
:Function:       gRiBegin
:Pattern:        RiBegin[name_String]
:Arguments:      { name }
:ArgumentTypes:  { String }
:ReturnType:     Integer
:End:

// RtVoid 	RiEnd(void)
:Begin:
:Function:       gRiEnd
:Pattern:        RiEnd[]
:Arguments:      { }
:ArgumentTypes:  { }
:ReturnType:     Integer
:End:

// RtVoid 		RiFrameBegin(RtInt frame)
:Begin:
:Function:       gRiFrameBegin
:Pattern:        RiFrameBegin[frame_Integer]
:Arguments:      { frame }
:ArgumentTypes:  { Integer }
:ReturnType:     Integer
:End:

// RtVoid 			RiFrameEnd(void)
:Begin:
:Function:       gRiFrameEnd
:Pattern:        RiFrameEnd[]
:Arguments:      {  }
:ArgumentTypes:  {  }
:ReturnType:     Integer
:End:

// RtVoid 				RiWorldBegin(void)
:Begin:
:Function:       gRiWorldBegin
:Pattern:        RiWorldBegin[]
:Arguments:      {  }
:ArgumentTypes:  {  }
:ReturnType:     Integer
:End:

// RtVoid 			RiWorldEnd(void)
:Begin:
:Function:       gRiWorldEnd
:Pattern:        RiWorldEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

////
// formatting
////

//	RiFormat(RtInt xres, RtInt yres, RtFloat aspect),
:Begin:
:Function:       gRiFormat
:Pattern:        RiFormat[xres_Integer,yres_Integer,aspect_Real]
:Arguments:      {xres,yres,aspect}
:ArgumentTypes:  {Integer,Integer,Real}
:ReturnType:     Integer
:End:

//	RiFrameAspectRatio(RtFloat aspect),
:Begin:
:Function:       gRiFrameAspectRatio
:Pattern:        RiFrameAspectRatio[aspect_Real]
:Arguments:      {aspect}
:ArgumentTypes:  {Real}
:ReturnType:     Integer
:End:

//	RiScreenWindow(RtFloat left, RtFloat right, RtFloat bot, RtFloat top),
:Begin:
:Function:       gRiScreenWindow
:Pattern:        RiScreenWindow[left_Real,right_Real,bot_Real,top_Real]
:Arguments:      {left,right,bot,top}
:ArgumentTypes:  {Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiCropWindow(RtFloat xmin, RtFloat xmax, RtFloat ymin, RtFloat ymax),
:Begin:
:Function:       gRiCropWindow
:Pattern:        RiCropWindow[xmin_Real,xmax_Real,ymin_Real,ymax_Real]
:Arguments:      {xmin,xmax,ymin,ymax}
:ArgumentTypes:  {Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiProjection(RtToken name, ...),
:Begin:
:Function:       gRiProjection
:Pattern:        RiProjection[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiClipping(RtFloat hither, RtFloat yon),
:Begin:
:Function:       gRiClipping
:Pattern:        RiClipping[hither_Real,yon_Real]
:Arguments:      {hither,yon}
:ArgumentTypes:  {Real,Real}
:ReturnType:     Integer
:End:

//	RiClippingPlane(RtFloat Nx, RtFloat Ny, RtFloat Nz, RtFloat Px, RtFloat Py, RtFloat Pz),	
:Begin:
:Function:       gRiClippingPlane
:Pattern:        RiClippingPlane[Nx_Real,Ny_Real,Nz_Real,Px_Real,Py_Real,Pz_Real]
:Arguments:      {Nx,Ny,Nz,Px,Py,Pz}
:ArgumentTypes:  {Real,Real,Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiDepthOfField(RtFloat fstop, RtFloat focallength, RtFloat focaldistance),
:Begin:
:Function:       gRiDepthOfField
:Pattern:        RiDepthOfField[fstop_Real,focallength_Real,focaldistance_Real]
:Arguments:      {fstop,focallength,focaldistance}
:ArgumentTypes:  {Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiShutter(RtFloat min, RtFloat max);
:Begin:
:Function:       gRiShutter
:Pattern:        RiShutter[min_Real,max_Real]
:Arguments:      {min,max}
:ArgumentTypes:  {Real,Real}
:ReturnType:     Integer
:End:

//	RiPixelVariance(RtFloat variation),
:Begin:
:Function:       gRiPixelVariance
:Pattern:        RiPixelVariance[variation_Real]
:Arguments:      {variation}
:ArgumentTypes:  {Real}
:ReturnType:     Integer
:End:

//	RiPixelFidelity(RtFloat variation),
:Begin:
:Function:       gRiPixelFidelity
:Pattern:        RiPixelFidelity[variation_Real]
:Arguments:      {variation}
:ArgumentTypes:  {Real}
:ReturnType:     Integer
:End:

//	RiPixelSamples(RtFloat xsamples, RtFloat ysamples),
:Begin:
:Function:       gRiPixelSamples
:Pattern:        RiPixelSamples[xsamples_Real,ysamples_Real]
:Arguments:      {xsamples,ysamples}
:ArgumentTypes:  {Real,Real}
:ReturnType:     Integer
:End:

///	RiPixelFilter(RtFilterFunc filterfunc, RtFloat xwidth, RtFloat ywidth),
/// Needs Implementation

//	RiExposure(RtFloat gain, RtFloat gamma),
:Begin:
:Function:       gRiExposure
:Pattern:        RiExposure[gain_Real,gamma_Real]
:Arguments:      {gain,gamma}
:ArgumentTypes:  {Real,Real}
:ReturnType:     Integer
:End:

// RiImager(RtToken name, ...),
//	RiImagerV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiImager
:Pattern:        RiImager[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiQuantize(RtToken type, RtInt one, RtInt min, RtInt max, RtFloat ampl),
:Begin:
:Function:       gRiQuantize
:Pattern:        RiQuantize[type_String,one_Integer,min_Integer,max_Integer,dither_Real]
:Arguments:      {type,one,min,max,dither}
:ArgumentTypes:  {String,Integer,Integer,Integer,Real}
:ReturnType:     Integer
:End:

//	RiDisplay(char *name, RtToken type, RtToken mode, ...),
//	RiDisplayV(char *name, RtToken type, RtToken mode,RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiDisplay
:Pattern:        RiDisplay[name_String,type_String,mode_String,rest_:{}]
:Arguments:      {name,type,mode,rest}
:ArgumentTypes:  {String,String,String,Manual}
:ReturnType:     Integer
:End:

//	RiHider(RtToken type, ...),
//	RiHiderV(RtToken type, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiHider
:Pattern:        RiHider[type_String,rest_:{}]
:Arguments:      {type,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiColorSamples(RtInt n, RtFloat nRGB[], RtFloat RGBn[]),
:Begin:
:Function:       gRiColorSamples
:Pattern:        RiColorSamples[n_Integer,nRGB_List,RGBn_List]
:Arguments:      {n,nRGB,RGBn}
:ArgumentTypes:  {Integer,RealList,RealList}
:ReturnType:     Integer
:End:

//	RiRelativeDetail(RtFloat relativedetail),
:Begin:
:Function:       gRiRelativeDetail
:Pattern:        RiRelativeDetail[relativedetail_Real]
:Arguments:      {relativedetail}
:ArgumentTypes:  {Real}
:ReturnType:     Integer
:End:

//	RiOption(RtToken name, ...),
//	RiOptionV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiOption
:Pattern:        RiOption[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiAttributeBegin(void),
:Begin:
:Function:       gRiAttributeBegin
:Pattern:        RiAttributeBegin[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiAttributeEnd(void),
:Begin:
:Function:       gRiAttributeEnd
:Pattern:        RiAttributeEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiColor(RtColor color),
:Begin:
:Function:       gRiColor
:Pattern:        RiColor[r_Real,g_Real,b_Real]
:Arguments:      {r,g,b}
:ArgumentTypes:  {Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiOpacity(RtColor color),
:Begin:
:Function:       gRiOpacity
:Pattern:        RiOpacity[r_Real,g_Real,b_Real]
:Arguments:      {r,g,b}
:ArgumentTypes:  {Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiTextureCoordinates(RtFloat s1, RtFloat t1, RtFloat s2, RtFloat t2, RtFloat s3, RtFloat t3, RtFloat s4, RtFloat t4);
:Begin:
:Function:       gRiTextureCoordinates
:Pattern:        RiTextureCoordinates[s1_Real,t1_Real,s2_Real,t2_Real,s3_Real,t3_Real,s4_Real,t4_Real]
:Arguments:      {s1,t1,s2,t2,s3,t3,s4,t4}
:ArgumentTypes:  {Real,Real,Real,Real,Real,Real,Real,Real}
:ReturnType:     Integer
:End:

////
// lighting
////

//	RiLightSource(RtToken name, ...),
//	RiLightSourceV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiLightSource
:Pattern:        RiLightSource[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Manual
:End:

//	RiAreaLightSource(RtToken name, ...),
//	RiAreaLightSourceV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiAreaLightSource
:Pattern:        RiAreaLightSource[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Manual
:End:

//	RiIlluminate(RtLightHandle light, RtBoolean onoff),
:Begin:
:Function:       gRiIlluminate
:Pattern:        RiIlluminate[RtLightHandle[handle_Integer],onoff_?(Function[m,TrueQ[m]||TrueQ[Not[m]]])]
:Arguments:      {handle,onoff}
:ArgumentTypes:  {Integer,Symbol}
:ReturnType:     Integer
:End:

//	RiSurface(RtToken name, ...),
//	RiSurfaceV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiSurface
:Pattern:        RiSurface[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiAtmosphere(RtToken name, ...),
//	RiAtmosphereV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiAtmosphere
:Pattern:        RiAtmosphere[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiInterior(RtToken name, ...),
//	RiInteriorV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiInterior
:Pattern:        RiInterior[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiExterior(RtToken name, ...),
//	RiExteriorV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiExterior
:Pattern:        RiExterior[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiShadingRate(RtFloat size),
:Begin:
:Function:       gRiShadingRate
:Pattern:        RiShadingRate[size_Real]
:Arguments:      {size}
:ArgumentTypes:  {Real}
:ReturnType:     Integer
:End:

//	RiShadingInterpolation(RtToken type),
:Begin:
:Function:       gRiShadingInterpolation
:Pattern:        RiShadingInterpolation[type_String]
:Arguments:      {type}
:ArgumentTypes:  {String}
:ReturnType:     Integer
:End:

//  RiMatte(RtBoolean onoff);
:Begin:
:Function:       gRiMatte
:Pattern:        RiMatte[onoff_?(Function[m,TrueQ[m]||TrueQ[Not[m]]])]
:Arguments:      {onoff}
:ArgumentTypes:  {Symbol}
:ReturnType:     Integer
:End:

////
// Geometry
////

//	RiBound(RtBound bound),
:Begin:
:Function:       gRiBound
:Pattern:        RiBound[xmin_Real,xmax_Real,ymin_Real,ymax_Real,zmin_Real,zmax_Real]
:Arguments:      {xmin, xmax, ymin, ymax, zmin, zmax}
:ArgumentTypes:  {Real,Real,Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiDetail(RtBound bound),
:Begin:
:Function:       gRiDetail
:Pattern:        RiDetail[xmin_Real,xmax_Real,ymin_Real,ymax_Real,zmin_Real,zmax_Real]
:Arguments:      {xmin, xmax, ymin, ymax, zmin, zmax}
:ArgumentTypes:  {Real,Real,Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiDetailRange(RtFloat minvis, RtFloat lowtran, RtFloat uptran,	 RtFloat maxvis),
:Begin:
:Function:       gRiDetailRange
:Pattern:        RiDetailRange[minvis_Real, lowtran_Real, uptran_Real, maxvis_Real]
:Arguments:      {minvis, lowtran, uptran, maxvis}
:ArgumentTypes:  {Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiGeometricApproximation(RtToken type, RtFloat value),
:Begin:
:Function:       gRiGeometricApproximation
:Pattern:        RiGeometricApproximation[type_String, value_Real]
:Arguments:      {type, value}
:ArgumentTypes:  {String,Real}
:ReturnType:     Integer
:End:

//	RiOrientation(RtToken orientation),
:Begin:
:Function:       gRiOrientation
:Pattern:        RiOrientation[orientation_String]
:Arguments:      {orientation}
:ArgumentTypes:  {String}
:ReturnType:     Integer
:End:

//	RiReverseOrientation(void),
:Begin:
:Function:       gRiReverseOrientation
:Pattern:        RiReverseOrientation[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiSides(RtInt sides);
:Begin:
:Function:       gRiSides
:Pattern:        RiSides[sides_Integer]
:Arguments:      {sides}
:ArgumentTypes:  {Integer}
:ReturnType:     Integer
:End:

////
// Transformations
////

//	RiIdentity(void),
:Begin:
:Function:       gRiIdentity
:Pattern:        RiIdentity[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiTransform(RtMatrix transform),
:Begin:
:Function:       gRiTransform
:Pattern:        RiTransform[m_List]
:Arguments:      {m}
:ArgumentTypes:  {Manual}
:ReturnType:     Integer
:End:

//	RiConcatTransform(RtMatrix transform),
:Begin:
:Function:       gRiConcatTransform
:Pattern:        RiConcatTransform[m_List]
:Arguments:      {m}
:ArgumentTypes:  {Manual}
:ReturnType:     Integer
:End:

//	RiPerspective(RtFloat fov),
:Begin:
:Function:       gRiPerspective
:Pattern:        RiPerspective[fov_Real]
:Arguments:      {sides}
:ArgumentTypes:  {Real}
:ReturnType:     Integer
:End:

//	RiTranslate(RtFloat dx, RtFloat dy, RtFloat dz),
:Begin:
:Function:       gRiTranslate
:Pattern:        RiTranslate[dx_Real,dy_Real,dz_Real]
:Arguments:      {dx,dy,dz}
:ArgumentTypes:  {Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiRotate(RtFloat angle, RtFloat dx, RtFloat dy, RtFloat dz),
:Begin:
:Function:       gRiRotate
:Pattern:        RiRotate[angle_Real,dx_Real,dy_Real,dz_Real]
:Arguments:      {angle,dx,dy,dz}
:ArgumentTypes:  {Real,Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiScale(RtFloat sx, RtFloat sy, RtFloat sz),
:Begin:
:Function:       gRiScale
:Pattern:        RiScale[sx_Real,sy_Real,sz_Real]
:Arguments:      {sx,sy,sz}
:ArgumentTypes:  {Real,Real,Real}
:ReturnType:     Integer
:End:

//	RiSkew(RtFloat angle, RtFloat dx1, RtFloat dy1, RtFloat dz1,	
//     RtFloat dx2, RtFloat dy2, RtFloat dz2),
:Begin:
:Function:       gRiSkew
:Pattern:        RiSkew[angle_Real,dx1_Real,dy1_Real,dz1_Real,dx2_Real,dy2_Real,dz2_Real]
:Arguments:      {angle,dx1,dy1,dz1,dx2,dy2,dz2}
:ArgumentTypes:  {Real,Real,Real,Real,Real,Real,Real}
:ReturnType:     Integer
:End:

////
// shaders
//////

//	RiDeformation(RtToken name, ...),
//	RiDeformationV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiDeformation
:Pattern:        RiDeformation[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiDisplacement(RtToken name, ...),
//	RiDisplacementV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiDisplacement
:Pattern:        RiDisplacement[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiCoordinateSystem(RtToken space),
:Begin:
:Function:       gRiCoordinateSystem
:Pattern:        RiCoordinateSystem[space_String]
:Arguments:      { space }
:ArgumentTypes:  { String }
:ReturnType:     Integer
:End:

//	RiScopedCoordinateSystem(RtToken space),
:Begin:
:Function:       gRiScopedCoordinateSystem
:Pattern:        RiScopedCoordinateSystem[space_String]
:Arguments:      { space }
:ArgumentTypes:  { String }
:ReturnType:     Integer
:End:

//	RiCoordSysTransform(RtToken space);
:Begin:
:Function:       gRiCoordSysTransform
:Pattern:        RiCoordSysTransform[space_String]
:Arguments:      { space }
:ArgumentTypes:  { String }
:ReturnType:     Integer
:End:

// not available...
// RtPoint *RiTransformPoints(RtToken fromspace, RtToken tospace, RtInt n, RtPoint points[]);
//:Begin:
//:Function:       gRiTransformPoints
//:Pattern:        RiTransformPoints[fromspace_String,tospace_String,points_List]
//:Arguments:      {fromspace,tospace,points}
//:ArgumentTypes:  {String,String,Manual}
//:ReturnType:     Manual
//:End:


//////
// xfm state
/////

// RiTransformBegin(void),
:Begin:
:Function:       gRiTransformBegin
:Pattern:        RiTransformBegin[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiTransformEnd(void);
:Begin:
:Function:       gRiTransformEnd
:Pattern:        RiTransformEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiAttribute(RtToken name, ...),
//	RiAttributeV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiAttribute
:Pattern:        RiAttribute[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

////
// patch geometry
////

//	RiPolygon(RtInt nverts, ...),
//	RiPolygonV(RtInt nverts, RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiPolygon
:Pattern:        RiPolygon[points_List,rest_:{}]
:Arguments:      {points,rest}
:ArgumentTypes:  {Manual}
:ReturnType:     Integer
:End:

//	RiPointsPolygons(RtInt npolys, RtInt nverts[], RtInt verts[], ...),
:Begin:
:Function:       gRiPointsPolygons
:Pattern:        RiPointsPolygons[npolys_Integer,nverts_List,verts_List,rest_:{}]
:Arguments:      {npolys,nverts,verts,rest}
:ArgumentTypes:  {Integer,IntegerList,IntegerList,Manual}
:ReturnType:     Integer
:End:

// Needs Implementation
//	RiGeneralPolygon(RtInt nloops, RtInt nverts[], ...),
//	RiPointsGeneralPolygons(RtInt npolys, RtInt nloops[], RtInt nverts[], RtInt verts[], ...),
//	RiBasis(RtBasis ubasis, RtInt ustep, RtBasis vbasis, RtInt vstep),

//	RiPatch(RtToken type, ...),
:Begin:
:Function:       gRiPatch
:Pattern:        RiPatch[type_String,rest_:{}]
:Arguments:      {type,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiPatchMesh(RtToken type, RtInt nu, RtToken uwrap,	RtInt nv, RtToken vwrap, ...),
//	RiNuPatch(RtInt nu, RtInt uorder, RtFloat uknot[], RtFloat umin, RtFloat umax,
//			RtInt nv, RtInt vorder, RtFloat vknot[], RtFloat vmin,
//			RtFloat vmax, ...),

////
// geometric primitives
////

//	RiSphere(RtFloat radius, RtFloat zmin, RtFloat zmax, RtFloat tmax, ...),
//	RiSphereV(RtFloat radius, RtFloat zmin, RtFloat zmax, RtFloat tmax,
//			RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiSphere
:Pattern:        RiSphere[radius_Real,zmin_Real,zmax_Real,tmax_Real,rest_:{}]
:Arguments:      {radius,zmin,zmax,tmax,rest}
:ArgumentTypes:  {Real,Real,Real,Real,Manual}
:ReturnType:     Integer
:End:

//	RiCone(RtFloat height, RtFloat radius, RtFloat tmax, ...),
//	RiConeV(RtFloat height, RtFloat radius, RtFloat tmax,
//			RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiCone
:Pattern:        RiCone[height_Real,radius_Real,tmax_Real,rest_:{}]
:Arguments:      {height,radius,tmax,rest}
:ArgumentTypes:  {Real,Real,Real,Manual}
:ReturnType:     Integer
:End:


//	RiCylinder(RtFloat radius, RtFloat zmin, RtFloat zmax, RtFloat tmax, ...),
//	RiCylinderV(RtFloat radius, RtFloat zmin, RtFloat zmax, RtFloat tmax,
//			RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiCylinder
:Pattern:        RiCylinder[radius_Real,zmin_Real,zmax_Real,tmax_Real,rest_:{}]
:Arguments:      {radius,zmin,zmax,tmax,rest}
:ArgumentTypes:  {Real,Real,Real,Real,Manual}
:ReturnType:     Integer
:End:

//	RiHyperboloid(RtPoint point1, RtPoint point2, RtFloat tmax, ...),
//	RiHyperboloidV(RtPoint point1, RtPoint point2, RtFloat tmax,
//			RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiHyperboloid
:Pattern:        RiHyperboloid[point1_List,point2_List,tmax_Real,rest_:{}]
:Arguments:      {point1,point2,tmax,rest}
:ArgumentTypes:  {RealList,RealList,Real,Manual}
:ReturnType:     Integer
:End:
	
//	RiParaboloid(RtFloat rmax, RtFloat zmin, RtFloat zmax, RtFloat tmax, ...),
//	RiParaboloidV(RtFloat rmax, RtFloat zmin, RtFloat zmax, RtFloat tmax,
//			RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiParaboloid
:Pattern:        RiParaboloid[rmax_Real,zmin_Real,zmax_Real,tmax_Real,rest_:{}]
:Arguments:      {rmax,zmin,zmax,tmax,rest}
:ArgumentTypes:  {Real,Real,Real,Real,Manual}
:ReturnType:     Integer
:End:

//	RiDisk(RtFloat height, RtFloat radius, RtFloat tmax, ...),
//	RiDiskV(RtFloat height, RtFloat radius, RtFloat tmax,
//			RtInt n, RtToken tokens[], RtPointer parms[]),
:Begin:
:Function:       gRiDisk
:Pattern:        RiDisk[height_Real,radius_Real,tmax_Real,rest_:{}]
:Arguments:      {height,radius,tmax,rest}
:ArgumentTypes:  {Real,Real,Real,Manual}
:ReturnType:     Integer
:End:

//	RiTorus(RtFloat majrad, RtFloat minrad, RtFloat phimin, RtFloat phimax,
//			RtFloat tmax, ...),
//	RiTorusV(RtFloat majrad, RtFloat minrad, RtFloat phimin, RtFloat phimax,
//			RtFloat tmax, RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiTorus
:Pattern:        RiTorus[majrad_Real,minrad_Real,phimin_Real,phimax_Real,tmax_Real,rest_:{}]
:Arguments:      {majrad,minrad,phimin,phimax,tmax,rest}
:ArgumentTypes:  {Real,Real,Real,Real,Real,Manual}
:ReturnType:     Integer
:End:

// Needs Implementation
//RiBlobby(RtInt nleaf, RtInt ncode, RtInt code[], 
//		       RtInt nflt, RtFloat flt[],
//		       RtInt nstr, RtToken str[], ...);
//RiBlobbyV(RtInt nleaf, RtInt ncode, RtInt  code[], 
//			RtInt nflt, RtFloat flt[],
//			RtInt nstr, RtToken str[],
//			RtInt n , RtToken tokens[], RtPointer parms[]);

//	RiCurves(RtToken type, RtInt ncurves, RtInt nvertices[], RtToken wrap, ...),
:Begin:
:Function:       gRiCurves
:Pattern:        RiCurves[type_String,ncurves_Integer,nverts_List,wrap_String,rest_]
:Arguments:      {type,ncurves,nverts,wrap,rest}
:ArgumentTypes:  {String,Integer,IntegerList,String,Manual}
:ReturnType:     Integer
:End:

//	RiPoints(RtInt nverts,...),
:Begin:
:Function:       gRiPoints
:Pattern:        RiPoints[nverts_Integer,rest_]
:Arguments:      {nverts,rest}
:ArgumentTypes:  {Integer,Manual}
:ReturnType:     Integer
:End:


//	RiSubdivisionMesh(RtToken mask, RtInt nf, RtInt nverts[],
//			  RtInt verts[],
//			  RtInt ntags, RtToken tags[], RtInt numargs[],
//			  RtInt intargs[], RtFloat floatargs[], ...),

//	RiTrimCurve(RtInt nloops, RtInt ncurves[], RtInt order[], RtFloat knot[],
//			RtFloat min[], RtFloat max[], RtInt n[],
//			RtFloat u[], RtFloat v[], RtFloat w[]),

//	RiProcedural(RtPointer data, RtBound bound,
//			RtVoid (*subdivfunc)(RtPointer, RtFloat),
//			RtVoid (*freefunc)(RtPointer)),

//	RiGeometry(RtToken type, ...),
:Begin:
:Function:       gRiGeometry
:Pattern:        RiGeometry[type_String,rest_:{}]
:Arguments:      {type,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

//	RiSolidBegin(RtToken operation),
:Begin:
:Function:       gRiSolidBegin
:Pattern:        RiSolidBegin[operation_String]
:Arguments:      {operation}
:ArgumentTypes:  {String}
:ReturnType:     Integer
:End:

//	RiSolidEnd(void);
:Begin:
:Function:       gRiSolidEnd
:Pattern:        RiSolidEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiObjectBegin(void);
:Begin:
:Function:       gRiObjectBegin
:Pattern:        RiObjectBegin[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Manual
:End:

//	RiObjectEnd(void),
:Begin:
:Function:       gRiObjectEnd
:Pattern:        RiObjectEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

//	RiObjectInstance(RtObjectHandle handle),
:Begin:
:Function:       gRiObjectInstance
:Pattern:        RiObjectInstance[RtObjectHandle[object_Integer]]
:Arguments:      {object}
:ArgumentTypes:  {Integer}
:ReturnType:     Integer
:End:

/////
// motion
////

//	RiMotionBegin(RtInt n, ...),
//	RiMotionBeginV(RtInt n, RtFloat times[]),
:Begin:
:Function:       gRiMotionBegin
:Pattern:        RiMotionBegin[times_List]
:Arguments:      {times}
:ArgumentTypes:  {RealList}
:ReturnType:     Integer
:End:

//	RiMotionEnd(void);
:Begin:
:Function:       gRiMotionEnd
:Pattern:        RiMotionEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

////
// texturemaps
////

// Not Implemented - not documented either?
//	RiResource(RtToken handle, RtToken type, ...),

//	RiMakeTexture(char *pic, char *tex, RtToken swrap, RtToken twrap,
//		RtFilterFunc filterfunc, RtFloat swidth, RtFloat twidth, ...),
//	RiMakeTextureV(char *pic, char *tex, RtToken swrap, RtToken twrap,
//		RtFilterFunc filterfunc, RtFloat swidth, RtFloat twidth,
//		RtInt n, RtToken tokens[], RtPointer parms[]),
//	RiMakeBump(char *pic, char *tex, RtToken swrap, RtToken twrap,
//		RtFilterFunc filterfunc, RtFloat swidth, RtFloat twidth, ...),
//	RiMakeBumpV(char *pic, char *tex, RtToken swrap, RtToken twrap,
//		RtFilterFunc filterfunc, RtFloat swidth, RtFloat twidth,
//		RtInt n, RtToken tokens[], RtPointer parms[]),
//	RiMakeLatLongEnvironment(char *pic, char *tex, RtFilterFunc filterfunc,
//		RtFloat swidth, RtFloat twidth, ...),
//	RiMakeLatLongEnvironmentV(char *pic, char *tex, RtFilterFunc filterfunc,
//		RtFloat swidth, RtFloat twidth,
//		RtInt n, RtToken tokens[], RtPointer parms[]),
//	RiMakeCubeFaceEnvironment(char *px, char *nx, char *py, char *ny,
//		char *pz, char *nz, char *tex, RtFloat fov,
//		RtFilterFunc filterfunc, RtFloat swidth, RtFloat ywidth, ...),
//	RiMakeCubeFaceEnvironmentV(char *px, char *nx, char *py, char *ny,
//		char *pz, char *nz, char *tex, RtFloat fov,
//		RtFilterFunc filterfunc, RtFloat swidth, RtFloat ywidth,
//		RtInt n, RtToken tokens[], RtPointer parms[]),
//	RiMakeShadow(char *pic, char *tex, ...),
//	RiMakeShadowV(char *pic, char *tex,
//		      RtInt n, RtToken tokens[], RtPointer parms[]),
//  RiMakeBrickMap(int nptcs, char **ptcs, char *bkm, ...),
//	RiMakeBrickMapV(int nptcs, char **ptcs, char *bkm,
//			RtInt n, RtToken tokens[], RtPointer parms[]);

//	RiErrorHandler(RtErrorHandler handler);


////
// archive
////

// RiArchiveRecord(RtToken type, char *format, ...),
:Begin:
:Function:       gRiArchiveRecord
:Pattern:        RiArchiveRecord[type_String,string_String]
:Arguments:      {type,string}
:ArgumentTypes:  {String,String}
:ReturnType:     Integer
:End:

// RiReadArchive(RtToken name, RtVoid (*callback)(RtToken,char*,...), ...),
// RiReadArchiveV(RtToken name, RtVoid (*callback)(RtToken,char*,...), RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiReadArchive
:Pattern:        RiReadArchive[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

// RiArchiveBegin(RtToken name, ...),
// RiArchiveBeginV(RtToken name, RtInt n, RtToken tokens[], RtPointer parms[]);
:Begin:
:Function:       gRiArchiveBegin
:Pattern:        RiArchiveBegin[name_String,rest_:{}]
:Arguments:      {name,rest}
:ArgumentTypes:  {String,Manual}
:ReturnType:     Integer
:End:

// RiArchiveEnd(void);
:Begin:
:Function:       gRiArchiveEnd
:Pattern:        RiArchiveEnd[]
:Arguments:      {}
:ArgumentTypes:  {}
:ReturnType:     Integer
:End:

////
// conditionals
////

// RiIfBegin(char *expr, ...),
// RiIfBeginV(char *expr, RtInt n, RtToken tokens[], RtPointer parms[]),
// RiElseIf(char *expr, ...),
// RiElseIfV(char *expr, RtInt n, RtToken tokens[], RtPointer parms[]),
// RiElse(void),
// RiIfEnd(void);

:Evaluate: End[ ]

:Evaluate: EndPackage[ ]