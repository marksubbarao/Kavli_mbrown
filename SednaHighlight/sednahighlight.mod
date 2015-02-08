filepath	+:modules/SednaHighlight

coord
{
	name			SednaHighlightC
	parent			SolarSystem

	scale			1

	unit			10000.0
	unitname		10K Km

	entrydist		100000

	positionfile	position.conf
	orbitfile		SednaHighlightorbit.conf
	positionhook	SednaHighlight
}


object SednaHighlight sgOrbitalObject
{
	coord	SednaHighlightC
	
	geometry SG_SPHERE 104.1 80  # 1041 km
	#texture ceres.dds
	#scalefactor 1.0

	targetradius 210
	lsize	3000000
	
	guiName /Solar System/Dwarf Planets/SednaHighlight
		
	# Glare settings
	distantpoint lum	1e-10
	distantpoint slum	1.0
	distantpoint maxpointsize	3
	distantpoint maxpolysize	30
	distantpoint polysize		4
	distantpoint color	0.80 0.73 0.60 1.0 
}

