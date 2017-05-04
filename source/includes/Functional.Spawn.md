# Functional.Spawn Module
**Functional** -- Spawn dynamically new GROUPs in your missions.

![Banner Image](/includes/Pictures/SPAWN/SPAWN.JPG)



The documentation of the SPAWN class can be found further in this document.



#####  Demo Missions

#####  [SPAWN Demo Missions source code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/SPA%20-%20Spawning)

#####  [SPAWN Demo Missions, only for beta testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/SPA%20-%20Spawning)

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [SPAWN YouTube Channel](https://www.youtube.com/playlist?list=PL7ZUrU4zZUl1jirWIo4t4YxqN-HxjqRkL)



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **Aaron**: Posed the idea for Group position randomization at SpawnInZone and make the Unit randomization separate from the Group randomization.
* [**Entropy**](https://forums.eagle.ru/member.php?u=111471), **Afinegan**: Came up with the requirement for AIOnOff().

#####  Authors:

* **FlightControl**: Design & Programming

## SPAWN Class
<pre>
Inheritance : The SPAWN Class inherits from the following parents :
BASE
	`-- SPAWN
</pre>

The SPAWN class allows to spawn dynamically new groups.
Each SPAWN object needs to be have a related **template group** setup in the Mission Editor (ME),
which is a normal group with the **Late Activation** flag set.
This template group will never be activated in your mission.
SPAWN uses that **template group** to reference to all the characteristics
(air, ground, livery, unit composition, formation, skill level etc) of each new group to be spawned.

Therefore, when creating a SPAWN object, the [SPAWN:New()](#spawn-new-spawntemplateprefix) and [SPAWN:NewWithAlias()](#spawn-newwithalias-spawntemplateprefix-spawnaliasprefix) require
**the name of the template group** to be given as a string to those constructor methods.

Initialization settings can be applied on the SPAWN object,
which modify the behaviour or the way groups are spawned.
These initialization methods have the prefix **Init**.
There are also spawn methods with the prefix **Spawn** and will spawn new groups in various ways.

#####  IMPORTANT! The methods with prefix **Init** must be used before any methods with prefix **Spawn** method are used, or unexpected results may appear!!!

Because SPAWN can spawn multiple groups of a template group,
SPAWN has an **internal index** that keeps track
which was the latest group that was spawned.

**Limits** can be set on how many groups can be spawn in each SPAWN object,
using the method [SPAWN:InitLimit()](#spawn-initlimit-spawnmaxunitsalive-spawnmaxgroups). SPAWN has 2 kind of limits:

* The maximum amount of [Unit](#unit-module-)s that can be **alive** at the same time...
* The maximum amount of [Group](#group-module-)s that can be **spawned**... This is more of a **resource**-type of limit.

When new groups get spawned using the **Spawn** methods,
it will be evaluated whether any limits have been reached.
When no spawn limit is reached, a new group will be created by the spawning methods,
and the internal index will be increased with 1.

These limits ensure that your mission does not accidentally get flooded with spawned groups.
Additionally, it also guarantees that independent of the group composition,
at any time, the most optimal amount of groups are alive in your mission.
For example, if your template group has a group composition of 10 units, and you specify a limit of 100 units alive at the same time,
with unlimited resources = :InitLimit( 100, 0 ) and 10 groups are alive, but two groups have only one unit alive in the group,
then a sequent Spawn(Scheduled) will allow a new group to be spawned!!!

#####  IMPORTANT!! If a limit has been reached, it is possible that a **Spawn** method returns **nil**, meaning, no [Group](#group-module-) had been spawned!!!

Spawned groups get **the same name** as the name of the template group.
Spawned units in those groups keep _by default_ **the same name** as the name of the template group.
However, because multiple groups and units are created from the template group,
a suffix is added to each spawned group and unit.

Newly spawned groups will get the following naming structure at run-time:

1. Spawned groups will have the name _GroupName_#_nnn_, where _GroupName_ is the name of the **template group**,
and _nnn_ is a **counter from 0 to 999**.
2. Spawned units will have the name _GroupName_#_nnn_-_uu_,
where _uu_ is a **counter from 0 to 99** for each new spawned unit belonging to the group.

That being said, there is a way to keep the same unit names!
The method SPAWN-InitKeepUnitNames- will keep the same unit names as defined within the template group, thus:

3. Spawned units will have the name _UnitName_#_nnn_-_uu_,
where _UnitName_ is the **unit name as defined in the template group*,
and _uu_ is a **counter from 0 to 99** for each new spawned unit belonging to the group.

Some **additional notes that need to be considered!!**:

* templates are actually groups defined within the mission editor, with the flag "Late Activation" set.
As such, these groups are never used within the mission, but are used by the [SPAWN](#spawn-class-) module.
* It is important to defined BEFORE you spawn new groups,
a proper initialization of the SPAWN instance is done with the options you want to use.
* When designing a mission, NEVER name groups using a "#" within the name of the group Spawn template(s),
or the SPAWN module logic won't work anymore.

#####  SPAWN construction methods

Create a new SPAWN object with the [SPAWN:New()](#spawn-new-spawntemplateprefix) or the [SPAWN:NewWithAlias()](#spawn-newwithalias-spawntemplateprefix-spawnaliasprefix) methods:

* [SPAWN:New()](#spawn-new-spawntemplateprefix): Creates a new SPAWN object taking the name of the group that represents the GROUP template (definition).
* [SPAWN:NewWithAlias()](#spawn-newwithalias-spawntemplateprefix-spawnaliasprefix): Creates a new SPAWN object taking the name of the group that represents the GROUP template (definition), and gives each spawned [Group](#group-module-) an different name.

It is important to understand how the SPAWN class works internally. The SPAWN object created will contain internally a list of groups that will be spawned and that are already spawned.
The initialization methods will modify this list of groups so that when a group gets spawned, ALL information is already prepared when spawning. This is done for performance reasons.
So in principle, the group list will contain all parameters and configurations after initialization, and when groups get actually spawned, this spawning can be done quickly and efficient.

#####  SPAWN **Init**ialization methods

A spawn object will behave differently based on the usage of **initialization** methods, which all start with the **Init** prefix:

#####  Unit Names

* SPAWN-InitKeepUnitNames-: Keeps the unit names as defined within the mission editor, but note that anything after a # mark is ignored, and any spaces before and after the resulting name are removed. IMPORTANT! This method MUST be the first used after :New !!!

#####  Route randomization

* [SPAWN:InitRandomizeRoute()](#spawn-initrandomizeroute-spawnstartpoint-spawnendpoint-spawnradius-spawnheight): Randomize the routes of spawned groups, and for air groups also optionally the height.

#####  Group composition randomization

* [SPAWN:InitRandomizeTemplate()](#spawn-initrandomizetemplate-spawntemplateprefixtable): Randomize the group templates so that when a new group is spawned, a random group template is selected from one of the templates defined.

#####  Uncontrolled

* [SPAWN:InitUnControlled()](#spawn-inituncontrolled-uncontrolled): Spawn plane groups uncontrolled.

#####  Array formation

* [SPAWN:InitArray()](#spawn-initarray-spawnangle-spawnwidth-spawndeltax-spawndeltay): Make groups visible before they are actually activated, and order these groups like a batallion in an array.

#####  Position randomization

* [SPAWN:InitRandomizePosition()](#spawn-initrandomizeposition-randomizeposition-outerradius-innerradius): Randomizes the position of [Group](#group-module-)s that are spawned within a **radius band**, given an Outer and Inner radius, from the point that the spawn happens.
* [SPAWN:InitRandomizeUnits()](#spawn-initrandomizeunits-randomizeunits-outerradius-innerradius): Randomizes the [Unit](#unit-module-)s in the [Group](#group-module-) that is spawned within a **radius band**, given an Outer and Inner radius.
* [SPAWN:InitRandomizeZones()](#spawn-initrandomizezones-spawnzonetable): Randomizes the spawning between a predefined list of [Zone](#zone-module-)s that are declared using this function. Each zone can be given a probability factor.

#####  Enable / Disable AI when spawning a new [Group](#group-module-)

* SPAWN-InitAIOn-: Turns the AI On when spawning the new [Group](#group-module-) object.
* SPAWN-InitAIOff-: Turns the AI Off when spawning the new [Group](#group-module-) object.
* [SPAWN:InitAIOnOff()](#spawn-initaionoff-aionoff): Turns the AI On or Off when spawning the new [Group](#group-module-) object.

#####  Limit scheduled spawning

* [SPAWN:InitLimit()](#spawn-initlimit-spawnmaxunitsalive-spawnmaxgroups): Limits the amount of groups that can be alive at the same time and that can be dynamically spawned.

#####  Delay initial scheduled spawn

* [SPAWN:InitDelayOnOff()](#spawn-initdelayonoff-delayonoff): Turns the inital delay On/Off when scheduled spawning the first [Group](#group-module-) object.
* SPAWN-InitDelayOn-: Turns the inital delay On when scheduled spawning the first [Group](#group-module-) object.
* SPAWN-InitDelayOff-: Turns the inital delay Off when scheduled spawning the first [Group](#group-module-) object.

#####  Repeat spawned [Group](#group-module-)s upon landing

* SPAWN-InitRepeat- or SPAWN-InitRepeatOnEngineShutDown-: This method is used to re-spawn automatically the same group after it has landed.
* SPAWN-Spawn-: This method is used to re-spawn automatically the same group after it has landed and it shuts down the engines at the ramp.


#####  SPAWN **Spawn** methods

Groups can be spawned at different times and methods:

#####  **Single** spawning methods

* [SPAWN:ReSpawn()](#spawn-respawn-spawnindex): Spawn one new group based on the last spawned index.
* [SPAWN:ReSpawn()](#spawn-respawn-spawnindex): Re-spawn a group based on a given index.
* [SPAWN:SpawnFromVec3()](#spawn-spawnfromvec3-vec3-spawnindex): Spawn a new group from a Vec3 coordinate. (The group will can be spawned at a point in the air).
* [SPAWN:SpawnFromVec2()](#spawn-spawnfromvec2-vec2-spawnindex): Spawn a new group from a Vec2 coordinate. (The group will be spawned at land height ).
* [SPAWN:SpawnFromStatic()](#spawn-spawnfromstatic-hoststatic-spawnindex): Spawn a new group from a structure, taking the position of a [Static](#static-module-).
* [SPAWN:SpawnFromUnit()](#spawn-spawnfromunit-hostunit-spawnindex): Spawn a new group taking the position of a [Unit](#unit-module-).
* [SPAWN:SpawnInZone()](#spawn-spawninzone-zone-randomizegroup-spawnindex): Spawn a new group in a [Zone](#zone-module-).

Note that SPAWN-Spawn- and [SPAWN:ReSpawn()](#spawn-respawn-spawnindex) return a [CARGO_GROUP:New()](#cargo_group-new-cargogroup-type-name-reportradius-nearradius) object, that contains a reference to the DCSGroup object.
You can use the [GROUP](#group-module-) object to do further actions with the DCSGroup.

#####  **Scheduled** spawning methods

* [SPAWN:SpawnScheduled()](#spawn-spawnscheduled-spawntime-spawntimevariation): Spawn groups at scheduled but randomized intervals.
* SPAWN-SpawnScheduledStart-: Start or continue to spawn groups at scheduled time intervals.
* SPAWN-SpawnScheduledStop-: Stop the spawning of groups at scheduled time intervals.



#####  Retrieve alive GROUPs spawned by the SPAWN object

The SPAWN class administers which GROUPS it has reserved (in stock) or has created during mission execution.
Every time a SPAWN object spawns a new GROUP object, a reference to the GROUP object is added to an internal table of GROUPS.
SPAWN provides methods to iterate through that internal GROUP object reference table:

* SPAWN-GetFirstAliveGroup-: Will find the first alive GROUP it has spawned, and return the alive GROUP object and the first Index where the first alive GROUP object has been found.
* [SPAWN:GetNextAliveGroup()](#spawn-getnextalivegroup-spawnindexstart): Will find the next alive GROUP object from a given Index, and return a reference to the alive GROUP object and the next Index where the alive GROUP has been found.
* SPAWN-GetLastAliveGroup-: Will find the last alive GROUP object, and will return a reference to the last live GROUP object and the last Index where the last alive GROUP object has been found.

You can use the methods SPAWN-GetFirstAliveGroup- and sequently [SPAWN:GetNextAliveGroup()](#spawn-getnextalivegroup-spawnindexstart) to iterate through the alive GROUPS within the SPAWN object, and to actions... See the respective methods for an example.
The method [SPAWN:GetGroupFromIndex()](#spawn-getgroupfromindex-spawnindex) will return the GROUP object reference from the given Index, dead or alive...

#####  Spawned cleaning of inactive groups

Sometimes, it will occur during a mission run-time, that ground or especially air objects get damaged, and will while being damged stop their activities, while remaining alive.
In such cases, the SPAWN object will just sit there and wait until that group gets destroyed, but most of the time it won't,
and it may occur that no new groups are or can be spawned as limits are reached.
To prevent this, a [SPAWN:InitCleanUp()](#spawn-initcleanup-spawncleanupinterval) initialization method has been defined that will silently monitor the status of each spawned group.
Once a group has a velocity = 0, and has been waiting for a defined interval, that group will be cleaned or removed from run-time.
There is a catch however :-) If a damaged group has returned to an airbase within the coalition, that group will not be considered as "lost"...
In such a case, when the inactive group is cleaned, a new group will Re-spawned automatically.
This models AI that has succesfully returned to their airbase, to restart their combat activities.
Check the [SPAWN:InitCleanUp()](#spawn-initcleanup-spawncleanupinterval) for further info.

#####  Catch the [Group](#group-module-) Spawn Event in a callback function!

When using the @{#SPAWN.SpawnScheduled)() method, new [Group](#group-module-)s are created following the spawn time interval parameters.
When a new [Group](#group-module-) is spawned, you maybe want to execute actions with that group spawned at the spawn event.
The SPAWN class supports this functionality through the method [SPAWN:OnSpawnGroup()](#spawn-onspawngroup-spawncallbackfunction-a) **function( SpawnedGroup ) end ** ),
which takes a function as a parameter that you can define locally.
Whenever a new [Group](#group-module-) is spawned, the given function is called, and the [Group](#group-module-) that was just spawned, is given as a parameter.
As a result, your spawn event handling function requires one parameter to be declared, which will contain the spawned [Group](#group-module-) object.
A coding example is provided at the description of the [SPAWN:OnSpawnGroup()](#spawn-onspawngroup-spawncallbackfunction-a) **function( SpawnedGroup ) end ** ) method.

#####  Delay the initial spawning

When using the @{#SPAWN.SpawnScheduled)() method, the default behaviour of this method will be that it will spawn the initial (first) [Group](#group-module-)
immediately when :SpawnScheduled() is initiated. The methods [SPAWN:InitDelayOnOff()](#spawn-initdelayonoff-delayonoff) and SPAWN-InitDelayOn- can be used to
activate a delay before the first [Group](#group-module-) is spawned. For completeness, a method SPAWN-InitDelayOff- is also available, that
can be used to switch off the initial delay. Because there is no delay by default, this method would only be used when a
SPAWN-SpawnScheduledStop- ; [SPAWN:New()](#spawn-new-spawntemplateprefix) sequence would have been used.




SPAWN Class

<h4> Attributes </h4>

* ClassName self
* <u>String</u> SpawnTemplatePrefix
* <u>String</u> SpawnAliasPrefix
* <u>Number</u> AliveUnits
* <u>Number</u> MaxAliveUnits
* <u>Number</u> SpawnIndex
* <u>Number</u> MaxAliveGroups
* [SpawnZoneTable](#spawn-spawnzonetable-class-)SpawnZoneTable


### SPAWN:New(SpawnTemplatePrefix)
``` lua
-- NATO helicopters engaging in the battle field.
Spawn_BE_KA50 = SPAWN:New( 'BE KA-50@RAMP-Ground Defense' )
@usage local Plane = SPAWN:New( "Plane" ) -- Creates a new local variable that can initiate new planes with the name "Plane#ddd" using the template "Plane" as defined within the ME.
```
Creates the main object to spawn a [Group](#group-module-) defined in the DCS ME.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>String</u> SpawnTemplatePrefix : is the name of the Group in the ME that defines the Template.  Each new group will have the name starting with SpawnTemplatePrefix.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:NewWithAlias(SpawnTemplatePrefix, SpawnAliasPrefix)
``` lua
-- NATO helicopters engaging in the battle field.
Spawn_BE_KA50 = SPAWN:NewWithAlias( 'BE KA-50@RAMP-Ground Defense', 'Helicopter Attacking a City' )
@usage local PlaneWithAlias = SPAWN:NewWithAlias( "Plane", "Bomber" ) -- Creates a new local variable that can instantiate new planes with the name "Bomber#ddd" using the template "Plane" as defined within the ME.
```
Creates a new SPAWN instance to create new groups based on the defined template and using a new alias for each new group.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>String</u> SpawnTemplatePrefix : is the name of the Group in the ME that defines the Template.
* <u>String</u> SpawnAliasPrefix : is the name that will be given to the Group at runtime.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitLimit(SpawnMaxUnitsAlive, SpawnMaxGroups)
``` lua
-- NATO helicopters engaging in the battle field.
-- This helicopter group consists of one Unit. So, this group will SPAWN maximum 2 groups simultaneously within the DCSRTE.
-- There will be maximum 24 groups spawned during the whole mission lifetime.
Spawn_BE_KA50 = SPAWN:New( 'BE KA-50@RAMP-Ground Defense' ):InitLimit( 2, 24 )
```
Limits the Maximum amount of Units that can be alive at the same time, and the maximum amount of groups that can be spawned.
Note that this method is exceptionally important to balance the performance of the mission. Depending on the machine etc, a mission can only process a maximum amount of units.
If the time interval must be short, but there should not be more Units or Groups alive than a maximum amount of units, then this method should be used...
When a [SPAWN:New()](#spawn-new-spawntemplateprefix) is executed and the limit of the amount of units alive is reached, then no new spawn will happen of the group, until some of these units of the spawn object will be destroyed.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnMaxUnitsAlive : The maximum amount of units that can be alive at runtime.
* <u>Number</u> SpawnMaxGroups : The maximum amount of groups that can be spawned. When the limit is reached, then no more actual spawns will happen of the group.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitKeepUnitNames()
Keeps the unit names as defined within the mission editor,
but note that anything after a # mark is ignored,
and any spaces before and after the resulting name are removed.
IMPORTANT! This method MUST be the first used after :New !!!

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRandomizeRoute(SpawnStartPoint, SpawnEndPoint, SpawnRadius, SpawnHeight)
``` lua
-- NATO helicopters engaging in the battle field.
-- The KA-50 has waypoints Start point ( =0 or SP ), 1, 2, 3, 4, End point (= 5 or DP).
-- Waypoints 2 and 3 will only be randomized. The others will remain on their original position with each new spawn of the helicopter.
-- The randomization of waypoint 2 and 3 will take place within a radius of 2000 meters.
Spawn_BE_KA50 = SPAWN:New( 'BE KA-50@RAMP-Ground Defense' ):InitRandomizeRoute( 2, 2, 2000 )
```
Randomizes the defined route of the SpawnTemplatePrefix group in the ME. This is very useful to define extra variation of the behaviour of groups.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnStartPoint : is the waypoint where the randomization begins.
* <u>Number</u> SpawnEndPoint : is the waypoint where the randomization ends counting backwards.
* <u>Number</u> SpawnRadius : is the radius in meters in which the randomization of the new waypoints, with the original waypoint of the original template located in the middle ...
* <u>Number</u> SpawnHeight : (optional) Specifies the **additional** height in meters that can be added to the base height specified at each waypoint in the ME.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRandomizePosition(RandomizePosition, OuterRadius, InnerRadius)
Randomizes the position of [Group](#group-module-)s that are spawned within a **radius band**, given an Outer and Inner radius, from the point that the spawn happens.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Boolean</u> RandomizePosition : If true, SPAWN will perform the randomization of the [Group](#group-module-)s position between a given outer and inner radius.
* [Distance](#distance-class-) OuterRadius : (optional) The outer radius in meters where the new group will be spawned.
* [Distance](#distance-class-) InnerRadius : (optional) The inner radius in meters where the new group will NOT be spawned.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRandomizeUnits(RandomizeUnits, OuterRadius, InnerRadius)
``` lua
-- NATO helicopters engaging in the battle field.
-- The KA-50 has waypoints Start point ( =0 or SP ), 1, 2, 3, 4, End point (= 5 or DP).
-- Waypoints 2 and 3 will only be randomized. The others will remain on their original position with each new spawn of the helicopter.
-- The randomization of waypoint 2 and 3 will take place within a radius of 2000 meters.
Spawn_BE_KA50 = SPAWN:New( 'BE KA-50@RAMP-Ground Defense' ):InitRandomizeRoute( 2, 2, 2000 )
```
Randomizes the UNITs that are spawned within a radius band given an Outer and Inner radius.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Boolean</u> RandomizeUnits : If true, SPAWN will perform the randomization of the [UNIT](#unit-module-)s position within the group between a given outer and inner radius.
* [Distance](#distance-class-) OuterRadius : (optional) The outer radius in meters where the new group will be spawned.
* [Distance](#distance-class-) InnerRadius : (optional) The inner radius in meters where the new group will NOT be spawned.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRandomizeTemplate(SpawnTemplatePrefixTable)
``` lua
-- NATO Tank Platoons invading Gori.
-- Choose between 13 different 'US Tank Platoon' configurations for each new SPAWN the Group to be spawned for the
-- 'US Tank Platoon Left', 'US Tank Platoon Middle' and 'US Tank Platoon Right' SpawnTemplatePrefixes.
-- Each new SPAWN will randomize the route, with a defined time interval of 200 seconds with 40% time variation (randomization) and
-- with a limit set of maximum 12 Units alive simulteneously  and 150 Groups to be spawned during the whole mission.
Spawn_US_Platoon = { 'US Tank Platoon 1', 'US Tank Platoon 2', 'US Tank Platoon 3', 'US Tank Platoon 4', 'US Tank Platoon 5',
'US Tank Platoon 6', 'US Tank Platoon 7', 'US Tank Platoon 8', 'US Tank Platoon 9', 'US Tank Platoon 10',
'US Tank Platoon 11', 'US Tank Platoon 12', 'US Tank Platoon 13' }
Spawn_US_Platoon_Left = SPAWN:New( 'US Tank Platoon Left' ):InitLimit( 12, 150 ):Schedule( 200, 0.4 ):InitRandomizeTemplate( Spawn_US_Platoon ):InitRandomizeRoute( 3, 3, 2000 )
Spawn_US_Platoon_Middle = SPAWN:New( 'US Tank Platoon Middle' ):InitLimit( 12, 150 ):Schedule( 200, 0.4 ):InitRandomizeTemplate( Spawn_US_Platoon ):InitRandomizeRoute( 3, 3, 2000 )
Spawn_US_Platoon_Right = SPAWN:New( 'US Tank Platoon Right' ):InitLimit( 12, 150 ):Schedule( 200, 0.4 ):InitRandomizeTemplate( Spawn_US_Platoon ):InitRandomizeRoute( 3, 3, 2000 )
```
This method is rather complicated to understand. But I'll try to explain.
This method becomes useful when you need to spawn groups with random templates of groups defined within the mission editor,
but they will all follow the same Template route and have the same prefix name.
In other words, this method randomizes between a defined set of groups the template to be used for each new spawn of a group.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>String</u> SpawnTemplatePrefixTable : A table with the names of the groups defined within the mission editor, from which one will be choosen when a new group will be spawned.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRandomizeZones(SpawnZoneTable)
``` lua
-- NATO Tank Platoons invading Gori.
-- Choose between 3 different zones for each new SPAWN the Group to be executed, regardless of the zone type.
```
This method provides the functionality to randomize the spawning of the Groups at a given list of zones of different types.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>List[]</u> SpawnZoneTable : A table with [Zone](#zone-module-) objects. If this table is given, then each spawn will be executed within the given list of [Zone](#zone-module-)s objects.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRepeat()
``` lua
-- RU Su-34 - AI Ship Attack
-- Re-SPAWN the Group(s) after each landing and Engine Shut-Down automatically.
SpawnRU_SU34 = SPAWN:New( 'TF1 RU Su-34 Krymsk@AI - Attack Ships' ):Schedule( 2, 3, 1800, 0.4 ):SpawnUncontrolled():InitRandomizeRoute( 1, 1, 3000 ):RepeatOnEngineShutDown()
```
For planes and helicopters, when these groups go home and land on their home airbases and farps, they normally would taxi to the parking spot, shut-down their engines and wait forever until the Group is removed by the runtime environment.
This method is used to re-spawn automatically (so no extra call is needed anymore) the same group after it has landed.
This will enable a spawned group to be re-spawned after it lands, until it is destroyed...
Note: When the group is respawned, it will re-spawn from the original airbase where it took off.
So ensure that the routes for groups that respawn, always return to the original airbase, or players may get confused ...

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRepeatOnLanding()
Respawn group after landing.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitRepeatOnEngineShutDown()
Respawn after landing when its engines have shut down.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitCleanUp(SpawnCleanUpInterval)
``` lua Spawn_Helicopter:CleanUp( 20 )  -- CleanUp the spawning of the helicopters every 20 seconds when they become inactive.
```
CleanUp groups when they are still alive, but inactive.
When groups are still alive and have become inactive due to damage and are unable to contribute anything, then this group will be removed at defined intervals in seconds.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>String</u> SpawnCleanUpInterval : The interval to check for inactive groups within seconds.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitArray(SpawnAngle, SpawnWidth, SpawnDeltaX, SpawnDeltaY)
``` lua
-- Define an array of Groups.
Spawn_BE_Ground = SPAWN:New( 'BE Ground' ):InitLimit( 2, 24 ):InitArray( 90, "Diamond", 10, 100, 50 )
```
Makes the groups visible before start (like a batallion).
The method will take the position of the group as the first position in the array.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnAngle :         The angle in degrees how the groups and each unit of the group will be positioned.
* <u>Number</u> SpawnWidth : 	     The amount of Groups that will be positioned on the X axis.
* <u>Number</u> SpawnDeltaX :        The space between each Group on the X-axis.
* <u>Number</u> SpawnDeltaY : 	     The space between each Group on the Y-axis.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:InitAIOnOff(AIOnOff)
Turns the AI On or Off for the [Group](#group-module-) when spawning.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Boolean</u> AIOnOff : A value of true sets the AI On, a value of false sets the AI Off.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)
 The SPAWN object


### SPAWN:InitAIOn()
Turns the AI On for the [Group](#group-module-) when spawning.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)
 The SPAWN object


### SPAWN:InitAIOff()
Turns the AI Off for the [Group](#group-module-) when spawning.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)
 The SPAWN object


### SPAWN:InitDelayOnOff(DelayOnOff)
Turns the Delay On or Off for the first [Group](#group-module-) scheduled spawning.
The default value is that for scheduled spawning, there is an initial delay when spawning the first [Group](#group-module-).

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Boolean</u> DelayOnOff : A value of true sets the Delay On, a value of false sets the Delay Off.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)
 The SPAWN object


### SPAWN:InitDelayOn()
Turns the Delay On for the [Group](#group-module-) when spawning.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)
 The SPAWN object


### SPAWN:InitDelayOff()
Turns the Delay Off for the [Group](#group-module-) when spawning.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)
 The SPAWN object


### SPAWN:Spawn()
Will spawn a group based on the internal index.
Note: Uses [DATABASE](#database-module-) module defined in MOOSE.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [GROUP](#group-class-)  The group that was spawned. You can use this group for further actions.


### SPAWN:ReSpawn(SpawnIndex)
Will re-spawn a group based on a given index.
Note: Uses [DATABASE](#database-module-) module defined in MOOSE.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>String</u> SpawnIndex : The index of the group to be spawned.

<h4> Returns </h4>
* [GROUP](#group-class-)  The group that was spawned. You can use this group for further actions.


### SPAWN:SpawnWithIndex(SpawnIndex)
Will spawn a group with a specified index number.
Uses [DATABASE](#database-module-) global object defined in MOOSE.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>String</u> SpawnIndex : The index of the group to be spawned.

<h4> Returns </h4>
* [GROUP](#group-class-)  The group that was spawned. You can use this group for further actions.


### SPAWN:SpawnScheduled(SpawnTime, SpawnTimeVariation)
``` lua
-- NATO helicopters engaging in the battle field.
-- The time interval is set to SPAWN new helicopters between each 600 seconds, with a time variation of 50%.
-- The time variation in this case will be between 450 seconds and 750 seconds.
-- This is calculated as follows:
--      Low limit:   600 * ( 1 - 0.5 / 2 ) = 450
--      High limit:  600 * ( 1 + 0.5 / 2 ) = 750
-- Between these two values, a random amount of seconds will be choosen for each new spawn of the helicopters.
Spawn_BE_KA50 = SPAWN:New( 'BE KA-50@RAMP-Ground Defense' ):Schedule( 600, 0.5 )
```
Spawns new groups at varying time intervals.
This is useful if you want to have continuity within your missions of certain (AI) groups to be present (alive) within your missions.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnTime : The time interval defined in seconds between each new spawn of new groups.
* <u>Number</u> SpawnTimeVariation : The variation to be applied on the defined time interval between each new spawn.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:SpawnScheduleStart()
Will re-start the spawning scheduler.
Note: This method is only required to be called when the schedule was stopped.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:SpawnScheduleStop()
Will stop the scheduled spawning scheduler.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:OnSpawnGroup(SpawnCallBackFunction, A)
``` lua
-- Declare SpawnObject and call a function when a new Group is spawned.
local SpawnObject = SPAWN
:New( "SpawnObject" )
:InitLimit( 2, 10 )
:OnSpawnGroup(
function( SpawnGroup )
SpawnGroup:E( "I am spawned" )
end
)
:SpawnScheduled( 300, 0.3 )
```
Allows to place a CallFunction hook when a new group spawns.
The provided method will be called when a new group is spawned, including its given parameters.
The first parameter of the SpawnFunction is the [GROUP](#group-class-) that was spawned.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Function()</u> SpawnCallBackFunction : The function to be called when a group spawns.
* SpawnFunctionArguments A : random amount of arguments to be provided to the function when the group spawns.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:SpawnFromVec3(Vec3, SpawnIndex)
Will spawn a group from a Vec3 in 3D space.
This method is mostly advisable to be used if you want to simulate spawning units in the air, like helicopters or airplanes.
Note that each point in the route assigned to the spawning group is reset to the point of the spawn.
You can use the returned group to further define the route to be followed.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* [Vec3](#vec3-class-) Vec3 : The Vec3 coordinates where to spawn the group.
* <u>Number</u> SpawnIndex : (optional) The index which group to spawn within the given zone.

<h4> Returns </h4>
* [GROUP](#group-class-)  that was spawned.
* <u>Nil</u>  Nothing was spawned.


### SPAWN:SpawnFromVec2(Vec2, SpawnIndex)
Will spawn a group from a Vec2 in 3D space.
This method is mostly advisable to be used if you want to simulate spawning groups on the ground from air units, like vehicles.
Note that each point in the route assigned to the spawning group is reset to the point of the spawn.
You can use the returned group to further define the route to be followed.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* [Vec2](#vec2-class-) Vec2 : The Vec2 coordinates where to spawn the group.
* <u>Number</u> SpawnIndex : (optional) The index which group to spawn within the given zone.

<h4> Returns </h4>
* [GROUP](#group-class-)  that was spawned.
* <u>Nil</u>  Nothing was spawned.


### SPAWN:SpawnFromUnit(HostUnit, SpawnIndex)
Will spawn a group from a hosting unit. This method is mostly advisable to be used if you want to simulate spawning from air units, like helicopters, which are dropping infantry into a defined Landing Zone.
Note that each point in the route assigned to the spawning group is reset to the point of the spawn.
You can use the returned group to further define the route to be followed.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* [UNIT](#unit-class-) HostUnit : The air or ground unit dropping or unloading the group.
* <u>Number</u> SpawnIndex : (optional) The index which group to spawn within the given zone.

<h4> Returns </h4>
* [GROUP](#group-class-)  that was spawned.
* <u>Nil</u>  Nothing was spawned.


### SPAWN:SpawnFromStatic(HostStatic, SpawnIndex)
Will spawn a group from a hosting static. This method is mostly advisable to be used if you want to simulate spawning from buldings and structures (static buildings).
You can use the returned group to further define the route to be followed.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* [STATIC](#static-class-) HostStatic : The static dropping or unloading the group.
* <u>Number</u> SpawnIndex : (optional) The index which group to spawn within the given zone.

<h4> Returns </h4>
* [GROUP](#group-class-)  that was spawned.
* <u>Nil</u>  Nothing was spawned.


### SPAWN:SpawnInZone(Zone, RandomizeGroup, SpawnIndex)
Will spawn a Group within a given [Zone](#zone-module-).
The [Zone](#zone-module-) can be of any type derived from [ZONE_BASE](#zone_base-class-).
Once the [Group](#group-module-) is spawned within the zone, the [Group](#group-module-) will continue on its route.
The **first waypoint** (where the group is spawned) is replaced with the zone location coordinates.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* [ZONE](#zone-class-) Zone : The zone where the group is to be spawned.
* <u>Boolean</u> RandomizeGroup : (optional) Randomization of the [Group](#group-module-) position in the zone.
* <u>Number</u> SpawnIndex : (optional) The index which group to spawn within the given zone.

<h4> Returns </h4>
* [GROUP](#group-class-)  that was spawned.
* <u>Nil</u>  when nothing was spawned.


### SPAWN:InitUnControlled(UnControlled)
(**AIR**) Will spawn a plane group in UnControlled or Controlled mode...
This will be similar to the uncontrolled flag setting in the ME.
You can use UnControlled mode to simulate planes startup and ready for take-off but aren't moving (yet).
ReSpawn the plane in Controlled mode, and the plane will move...

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Boolean</u> UnControlled : true if UnControlled, false if Controlled.

<h4> Returns </h4>
* [SPAWN](#spawn-class-)



### SPAWN:SpawnGroupName(SpawnIndex)
Will return the SpawnGroupName either with with a specific count number or without any count.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnIndex : Is the number of the Group that is to be spawned.

<h4> Returns </h4>
* <u>String</u> 


### SPAWN:GetFirstAliveGroup()
``` lua
-- Find the first alive [Group](#group-module-) object of the SpawnPlanes SPAWN object [Group](#group-module-) collection that it has spawned during the mission.
local GroupPlane, Index = SpawnPlanes:GetFirstAliveGroup()
while GroupPlane ~= nil do
-- Do actions with the GroupPlane object.
GroupPlane, Index = SpawnPlanes:GetNextAliveGroup( Index )
end
```
Will find the first alive [Group](#group-module-) it has spawned, and return the alive [Group](#group-module-) object and the first Index where the first alive [Group](#group-module-) object has been found.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [GROUP,](#group,-class-)  <u>Number</u> The [Group](#group-module-) object found, the new Index where the group was found.
* <u>Nil</u>,  <u>Nil</u> When no group is found, <u>Nil</u> is returned.


### SPAWN:GetNextAliveGroup(SpawnIndexStart)
``` lua
-- Find the first alive [Group](#group-module-) object of the SpawnPlanes SPAWN object [Group](#group-module-) collection that it has spawned during the mission.
local GroupPlane, Index = SpawnPlanes:GetFirstAliveGroup()
while GroupPlane ~= nil do
-- Do actions with the GroupPlane object.
GroupPlane, Index = SpawnPlanes:GetNextAliveGroup( Index )
end
```
Will find the next alive [Group](#group-module-) object from a given Index, and return a reference to the alive [Group](#group-module-) object and the next Index where the alive [Group](#group-module-) has been found.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnIndexStart : A Index holding the start position to search from. This method can also be used to find the first alive [Group](#group-module-) object from the given Index.

<h4> Returns </h4>
* [GROUP,](#group,-class-)  <u>Number</u> The next alive [Group](#group-module-) object found, the next Index where the next alive [Group](#group-module-) object was found.
* <u>Nil</u>,  <u>Nil</u> When no alive [Group](#group-module-) object is found from the start Index position, <u>Nil</u> is returned.


### SPAWN:GetLastAliveGroup()
``` lua
-- Find the last alive [Group](#group-module-) object of the SpawnPlanes SPAWN object [Group](#group-module-) collection that it has spawned during the mission.
local GroupPlane, Index = SpawnPlanes:GetLastAliveGroup()
if GroupPlane then -- GroupPlane can be nil!!!
-- Do actions with the GroupPlane object.
end
```
Will find the last alive [Group](#group-module-) object, and will return a reference to the last live [Group](#group-module-) object and the last Index where the last alive [Group](#group-module-) object has been found.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self

<h4> Returns </h4>
* [GROUP,](#group,-class-)  <u>Number</u> The last alive [Group](#group-module-) object found, the last Index where the last alive [Group](#group-module-) object was found.
* <u>Nil</u>,  <u>Nil</u> When no alive [Group](#group-module-) object is found, <u>Nil</u> is returned.


### SPAWN:GetGroupFromIndex(SpawnIndex)
Get the group from an index.
Returns the group from the SpawnGroups list.
If no index is given, it will return the first group in the list.

<h4> Parameters </h4>
* [SPAWN](#spawn-class-)
self
* <u>Number</u> SpawnIndex : The index of the group to return.

<h4> Returns </h4>
* [GROUP](#group-class-) 


### SPAWN.GetSpawnIndexFromGroup()

<h4> Parameters </h4>
<h4> Returns </h4>

## SPAWN.SpawnZoneTable Class
<pre>
The SPAWN.SpawnZoneTable class does not inherit
</pre>
<h4> Attributes </h4>

* <u>List[]</u>[Core.Zone#ZONE_BASE] SpawnZone


