filepath +:./modules/ErisMoon

#
#  Coords 
#
coord
{
	name		ErisMoonCoord
	parent		ErisBarycenter

	scale		0.01
	unit		10000.0
	entrydist	10
		
	position
	{
		static       0.0 0.0 0.0
	}
	
	#rotation
	#{
	#		static matrix 0.121922 0.666870 0.735132 0.000000 -0.728892 -0.442563 0.522355 0.000000 0.673685 -0.599518 0.432118 0.000000 0.000000 0.000000 0.000000 1.000000 
	#}

}


coord
{
    name            cDysnomia
    parent          ErisMoonCoord
    scale           0.1
    unit            1000.0
    entrydist       1000
    position
    {
        kepler      modules/ErisMoon/Dysnomia.SGO 14959800.0
    }
    orbitfile       DysnomiaOrbit.conf
    positionhook    DysnomiaMoon
}


#
#  Objects 
#

object DysnomiaMoon sgOrbitalObject
{
    coord           cDysnomia
    geometry        SG_SPHERE 37.35 100
#    texture         Hydra.jpg
    cameraradius    60.0
    targetradius    80.0
    lsize           10000
    lcolor          1.0 1.0 0.6 0.6
    guiName         /Solar System/Dwarf Planets/Eris/Moons/Dysnomia
}


