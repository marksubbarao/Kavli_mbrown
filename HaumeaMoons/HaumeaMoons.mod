filepath +:./modules/HaumeaMoons

#
#  Coords 
#
coord
{
	name		HaumeaMoonsCoord
	parent		HaumeaC

	scale		0.01
	unit		10000.0
	entrydist	10
		
	position
	{
		static       0.0 0.0 0.0
	}
	
	rotation
	{
		static matrix 0.121922 0.666870 0.735132 0.000000 -0.728892 -0.442563 0.522355 0.000000 0.673685 -0.599518 0.432118 0.000000 0.000000 0.000000 0.000000 1.000000 
	}

}

coord
{
    name            cNamaka
    parent          HaumeaMoonsCoord
    scale           0.1
    unit            1000.0
    entrydist       1000
    position
    {
        kepler      modules/HaumeaMoons/Namaka.SGO 14959800.0
    }
    orbitfile       NamakaOrbit.conf
    positionhook    NamakaMoon
}

coord
{
    name            cHiiaka
    parent          HaumeaMoonsCoord
    scale           0.1
    unit            1000.0
    entrydist       1000
    position
    {
        kepler      modules/HaumeaMoons/Hiiaka.SGO 14959800.0
    }
    orbitfile       HiiakaOrbit.conf
    positionhook    HiiakaMoon
}


#
#  Objects 
#

object NamakaMoon sgOrbitalObject
{
    coord           cNamaka
    geometry        SG_SPHERE 20.0 100
#    texture         Hydra.jpg
    cameraradius    17.0
    targetradius    44.0
    lsize           10000
    lcolor          1.0 1.0 0.6 0.6
    guiName         /Solar System/Dwarf Planets/Haumea/Moons/Namaka
}

object HiiakaMoon sgOrbitalObject
{
    coord           cHiiaka
    geometry        SG_SPHERE 88.0 100
#    texture         Nix.jpg
    cameraradius    31.0
    targetradius    176.0
    lsize           10000
    lcolor          1.0 1.0 0.6 0.6
    guiName         /Solar System/Dwarf Planets/Haumea/Moons/Hi'iaka
}

