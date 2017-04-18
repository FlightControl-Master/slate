# Core.SpawnStatic Module
**Core** -- Spawn dynamically new STATICs in your missions.

![Banner Image](/includes/Pictures/SPAWNSTATIC/Dia1.JPG)



SPAWNSTATIC spawns static structures in your missions dynamically. See below the SPAWNSTATIC class documentation.



#####  Demo Missions

#####  [SPAWNSTATIC Demo Missions source code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/SPS - Spawning Statics)

#####  [SPAWNSTATIC Demo Missions, only for beta testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/SPS%20-%20Spawning%20Statics)

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [SPAWNSTATIC YouTube Channel]()



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

#####  Authors:

* **FlightControl**: Design & Programming

## SPAWNSTATIC Class
<pre>
Inheritance : The SPAWNSTATIC Class inherits from the following parents :
BASE
	`-- SPAWNSTATIC
</pre>

The SPAWNSTATIC class allows to spawn dynamically new [Static](#static-module-)s.
Through creating a copy of an existing static object template as defined in the Mission Editor (ME),
SPAWNSTATIC can retireve the properties of the defined static object template (like type, category etc), and "copy"
these properties to create a new static object and place it at the desired coordinate.

New spawned [Static](#static-module-)s get **the same name** as the name of the template Static,
or gets the given name when a new name is provided at the Spawn method.
By default, spawned [Static](#static-module-)s will follow a naming convention at run-time:

* Spawned [Static](#static-module-)s will have the name _StaticName_#_nnn_, where _StaticName_ is the name of the **Template Static**,
and _nnn_ is a **counter from 0 to 99999**.


#####  SPAWNSTATIC construction methods

Create a new SPAWNSTATIC object with the [SPAWNSTATIC:NewFromStatic()](#spawnstatic-newfromstatic-spawntemplateprefix):

* [SPAWNSTATIC:NewFromStatic()](#spawnstatic-newfromstatic-spawntemplateprefix): Creates a new SPAWNSTATIC object given a name that is used as the base of the naming of each spawned Static.

#####  **Spawn** methods

Groups can be spawned at different times and methods:

* [SPAWNSTATIC:SpawnFromPointVec2()](#spawnstatic-spawnfrompointvec2-pointvec2-heading-(optional)): Spawn a new group from a POINT_VEC2 coordinate.
(The group will be spawned at land height ).
* [SPAWNSTATIC:SpawnFromZone()](#spawnstatic-spawnfromzone-zone-heading-(optional)): Spawn a new group in a [Zone](#zone-module-).





### SPAWNSTATIC:NewFromStatic(SpawnTemplatePrefix)

<h4> Parameters </h4>
* [SPAWNSTATIC](#spawnstatic-class-)
self
* <u>String</u> SpawnTemplatePrefix : is the name of the Group in the ME that defines the Template.  Each new group will have the name starting with SpawnTemplatePrefix.

<h4> Returns </h4>
* [SPAWNSTATIC](#spawnstatic-class-)



### SPAWNSTATIC:NewFromType(SpawnTypeName)

<h4> Parameters </h4>
* [SPAWNSTATIC](#spawnstatic-class-)
self
* <u>String</u> SpawnTypeName : is the name of the type.

<h4> Returns </h4>
* [SPAWNSTATIC](#spawnstatic-class-)



### SPAWNSTATIC:SpawnFromPointVec2(PointVec2, Heading, (optional))

<h4> Parameters </h4>
* [SPAWNSTATIC](#spawnstatic-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : The 2D coordinate where to spawn the static.
* <u>Number</u> Heading : The heading of the static, which is a number in degrees from 0 to 360.
* <u>String</u> (optional) : The name of the new static.

<h4> Returns </h4>
* [SPAWNSTATIC](#spawnstatic-class-)



### SPAWNSTATIC:SpawnFromZone(Zone, Heading, (optional))

<h4> Parameters </h4>
* [SPAWNSTATIC](#spawnstatic-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The Zone where to spawn the static.
* <u>Number</u> Heading : The heading of the static, which is a number in degrees from 0 to 360.
* <u>String</u> (optional) : The name of the new static.

<h4> Returns </h4>
* [SPAWNSTATIC](#spawnstatic-class-)



## SPAWNSTATIC.SpawnZoneTable Class
<pre>
The SPAWNSTATIC.SpawnZoneTable class does not inherit
</pre>
<h4> Attributes </h4>

* <u>List[]</u>[Core.Zone#ZONE_BASE] SpawnZone


