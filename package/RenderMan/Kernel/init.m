(* ::Package:: *)

(* :Title: RenderMan *)


(* :Authors: Flip Phillips *)


(* :Summary: This file contains declarations for all the major symbols in
 *  RenderMan.  When this file is loaded, it creates the symbols
 *  with the attribute Stub so that the correct package will be
 *  loaded when the symbol is first used.  *)

(* :Context: RenderMan` *)

(* :Package Version: 2.0.0 *)

(* :Mathematica Version: 6.0 *)

(* :Copyright: Copyright 2004-7, flip phillips, all rights reserved. *)

(* :History: $Id: init.m 22 2007-06-03 04:24:18Z flip $ *)

(* :Warning: *)

(* :Notes: I have structured this package using Bob Beretta's 
	excellent example from the Open GL package *)
	
(* :Requirement: This package uses a platform-specific RenderMan 
	executable *)

BeginPackage["RenderMan`"]

$RManDirectory = ToFileName[
	{First[Select[$Path, FileNames["RenderMan", #]=!={}&]]},
	"RenderMan"];

$RManLink::linkfail=
	"RenderMan has failed to connect to the MacRib executable.";

(* kickstart *)

RenderManStart[] := $RManLink = 
  If[StringQ[Global`$RManLinkName], 
   Install[LinkConnect[Global`$RManLinkName]], 
   Install["RenderMan`MacRib`"]]
If[$RManLink === $Failed, Message[$RManLink::linkfail]; Abort[]]

RenderManStop[] := Uninstall[$RManLink];

RenderManReset[] := (RenderManStop[]; RenderManStart[];)

(* go *)

RenderManStart[];

EndPackage[]

(* DeclarePackage["RenderMan`Bleh`",
  {}]
*)
Null
