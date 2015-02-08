filepath +:./modules/JMDelhiJP5

coord
{
	name			JMDelhiJP5
	parent			Earth
	
	scale			0.01 # SCALE: 1km/unit
	
	positionfile	JMDelhiJP5-pos.conf
	
	unit			10000.0
	unitname		10 Km

	entrydist		1.0
}

object JMDelhiJP5 sgOrbitalObject
{
	coord JMDelhiJP5

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

	guiName /Panos/JMDelhiJP5
}


