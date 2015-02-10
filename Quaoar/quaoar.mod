filepath	+:modules/Quaoar

coord
{
	name			QuaoarC
	parent			SolarSystem

	scale			1

	unit			10000.0
	unitname		10K Km

	entrydist		100000

	positionfile	position.conf
	orbitfile		Quaoarorbit.conf
	positionhook	Quaoar
}


object Quaoar sgOrbitalObject
{
	coord	QuaoarC
	
	geometry SG_dynamical_Sphere Quaoar.conf #109.2 80  # 995 km
	#texture ceres.dds
	#scalefactor 1.0

	targetradius 210
	lsize	3000000
	
	guiName /Solar System/Dwarf Planets/Quaoar
		
	# Glare settings
	distantpoint lum	1e-10
	distantpoint slum	1.0
	distantpoint maxpointsize	3
	distantpoint maxpolysize	30
	distantpoint polysize		4
	distantpoint color	0.80 0.73 0.60 1.0 
}

