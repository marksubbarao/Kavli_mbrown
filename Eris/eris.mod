filepath	+:modules/eris

coord
{
	name			ErisBarycenter
	parent			SolarSystem

	scale			0.01

	unit			1000000.0
	unitname		1K Km

	entrydist		1000

	positionfile	erisbarycenterpos.conf
	orbitfile		erisorbit.conf
	positionhook	Eris
}

coord
{
	name			Eris
	parent			ErisBarycenter
	
	scale			0.01 # SCALE: 1km/unit

	unit			10000.0
	unitname		10 Km

	entrydist		3000
}

object dwarfplanets sgForward
{
	[fw]	add	Pluto
	[fw]	add Ceres
	[fw]	add Eris
	[fw]	guisubprop orbital	/Solar System/Dwarf Planets
}


object Eris sgOrbitalObject
{
	coord	Eris
	
	geometry SG_dynamical_sphere eris.conf # 120 80  # 1200km
	scalefactor 1.0

	targetradius 500
	lsize 10000000
	
	guiName /Solar System/Dwarf Planets/Eris
		
	# Glare settings
	distantpoint lum	1e-10
	distantpoint slum	1.0
	distantpoint maxpointsize	3
	distantpoint maxpolysize	30
	distantpoint polysize		4
	distantpoint color	0.80 0.73 0.60 1.0 
}

