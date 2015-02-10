filepath	+:modules/Sedna

coord
{
	name			SednaC
	parent			SolarSystem

	scale			1

	unit			10000.0
	unitname		10K Km

	entrydist		100000

	positionfile	position.conf
	orbitfile		Sednaorbit.conf
	positionhook	Sedna
}


object Sedna sgOrbitalObject
{
	coord	SednaC
	
	geometry SG_dynamical_Sphere sedna.conf #SG_Sphere 104.1 80  # 1041 km


	scalefactor 1.0

	targetradius 210
	lsize	3000000
	
	guiName /Solar System/Dwarf Planets/Sedna
		
	# Glare settings
	distantpoint lum	1e-10
	distantpoint slum	1.0
	distantpoint maxpointsize	3
	distantpoint maxpolysize	30
	distantpoint polysize		4
	distantpoint color	0.80 0.73 0.60 1.0 
}

