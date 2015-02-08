filepath +:./modules/PlutoDiscoveryTelescope

coord
{
	name			PlutoDiscoveryTelescope
	parent			Earth
	
	scale			0.01 # SCALE: 1km/unit
	
	positionfile	PlutoDiscoveryTelescope-pos.conf
	
	unit			10000.0
	unitname		10 Km

	entrydist		1.0
}

object PlutoDiscoveryTelescope sgOrbitalObject
{
	coord PlutoDiscoveryTelescope

	rotation
	{
		surfacepositioner
		{
             ## Uncomment the static hpr line below to tweak the orientation of the panobubble.
             # static hpr 0.0 0.0 -90.0
		}
	}	
		
	geometry SG_SPHERE shader.conf 
		
	scalefactor 1.0
	
	targetradius 0.010
	cameraradius 0.001
	
	labeldist 50000 Solarsystem

	guiName /Solar System/Planets/Earth/PlutoDiscoveryTelescope
}


