filepath	+:modules/SnowWhite

coord
{
	name			SnowWhiteC
	parent			SolarSystem

	scale			1

	unit			10000.0
	unitname		10K Km

	entrydist		100000

	positionfile	position.conf
	orbitfile		SnowWhiteorbit.conf
	positionhook	SnowWhite
}


object SnowWhite sgOrbitalObject
{
	coord	SnowWhiteC
	
	geometry SG_SPHERE 129.0 80  # 1290 km
	#texture ceres.dds
	#scalefactor 1.0

	targetradius 210
	lsize	3000000
	
	guiName /Solar System/Dwarf Planets/SnowWhite
		
	# Glare settings
	distantpoint lum	1e-10
	distantpoint slum	1.0
	distantpoint maxpointsize	3
	distantpoint maxpolysize	30
	distantpoint polysize		4
	distantpoint color	0.80 0.73 0.60 1.0 
}

