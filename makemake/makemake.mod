filepath	+:modules/Makemake

coord
{
	name			MakemakeC
	parent			SolarSystem

	scale			1

	unit			10000.0
	unitname		10K Km

	entrydist		1000

	positionfile	position.conf
	orbitfile		Makemakeorbit.conf
	positionhook	Makemake
}


object Makemake sgOrbitalObject
{
	coord	MakemakeC
	
	geometry SG_dynamical_sphere makemake.conf #75.01 80  # 751 km
	#scalefactor 1.0

	targetradius 210
	lsize	300000000
	
	guiName /Solar System/Dwarf Planets/Makemake
		
	# Glare settings
	distantpoint lum	1e-10
	distantpoint slum	1.0
	distantpoint maxpointsize	3
	distantpoint maxpolysize	30
	distantpoint polysize		4
	distantpoint color	0.80 0.73 0.60 1.0 
}

