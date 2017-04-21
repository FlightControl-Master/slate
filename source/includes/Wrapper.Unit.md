# Wrapper.Unit Module
**Wrapper** - UNIT is a wrapper class for the DCS Class Unit.



The [UNIT](#unit-class-) class is a wrapper class to handle the DCS Unit objects:

* Support all DCS Unit APIs.
* Enhance with Unit specific APIs not in the DCS Unit API set.
* Handle local Unit Controller.
* Manage the "state" of the DCS Unit.

## UNIT Class
<pre>
Inheritance : The UNIT Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
				`-- CONTROLLABLE
					`-- UNIT
</pre>

### UNIT:Register(UnitName)
Create a new UNIT from DCSUnit.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* <u>String</u> UnitName : The name of the DCS unit.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:Find(DCSUnit)
Finds a UNIT from the _DATABASE using a DCSUnit object.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* Dcs.DCSWrapper.Unit#Unit DCSUnit : An existing DCS Unit object reference.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:FindByName(UnitName)
Find a UNIT in the _DATABASE using the name of an existing DCS Unit.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* <u>String</u> UnitName : The Unit Name.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:Name()
Return the name of the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The UNIT name.


### UNIT:GetDCSObject()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit 


### UNIT:ReSpawn(SpawnVec3, Heading)
Respawn the [Unit](#unit-module-) using a (tweaked) template of the parent Group.

This function will:

* Get the current position and heading of the group.
* When the unit is alive, it will tweak the template x, y and heading coordinates of the group and the embedded units to the current units positions.
* Then it will respawn the re-modelled group.


<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [Vec3](#vec3-class-) SpawnVec3 : The position where to Spawn the new Unit at.
* <u>Number</u> Heading : The heading of the unit respawn.

<h4> Returns </h4>

### UNIT:IsActive()
Returns if the unit is activated.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is activated.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:IsAlive()
Returns if the Unit is alive.
If the Unit is not alive, nil is returned.
If the Unit is alive and active, true is returned.
If the Unit is alive but not active, false is returned.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is alive and active.
* <u>Boolean</u>  false if Unit is alive but not active.
* <u>Nil</u>  if the Unit is not existing or is not alive.


### UNIT:GetCallsign()
Returns the Unit's callsign - the localized string.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The Callsign of the Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetPlayerName()
Returns name of the player that control the unit or nil if the unit is controlled by A.I.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  Player Name
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetNumber()
Returns the unit's number in the group.
The number is the same number the unit has in ME.
It may not be changed during the mission.
If any unit in the group is destroyed, the numbers of another units will not be changed.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The Unit number.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetGroup()
Returns the unit's group if it exist and nil otherwise.

<h4> Parameters </h4>
* [UNIT](#unit-class-) self

<h4> Returns </h4>
* [GROUP](#group-class-)  The Group of the Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetPrefix()
Returns the prefix name of the DCS Unit. A prefix name is a part of the name before a '#'-sign.
DCS Units spawned with the [SPAWN](#spawn-module-) class contain a '#'-sign to indicate the end of the (base) DCS Unit name.
The spawn sequence number and unit number are contained within the name after the '#' sign.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The name of the DCS Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetAmmo()
Returns the Unit's ammunition.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit.Ammo 
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetSensors()
Returns the unit sensors.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit.Sensors 
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:HasSensors()
Returns if the unit has sensors of a certain type.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  returns true if the unit has specified types of sensors. This function is more preferable than Unit.getSensors() if you don't want to get information about all the unit's sensors, and just want to check if the unit has specified types of sensors.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:HasSEAD()
Returns if the unit is SEADable.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  returns true if the unit is SEADable.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetRadar()
Returns two values:

* First value indicates if at least one of the unit's radar(s) is on.
* Second value is the object of the radar's interest. Not nil only if at least one radar of the unit is tracking a target.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  self Indicates if at least one of the unit's radar(s) is on.
* Dcs.DCSWrapper.Object#Object  The object of the radar's interest. Not nil only if at least one radar of the unit is tracking a target.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetFuel()
Returns relative amount of fuel (from 0.0 to 1.0) the unit has in its internal tanks. If there are additional fuel tanks the value may be greater than 1.0.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The relative amount of fuel (from 0.0 to 1.0).
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetUnits()
Returns the UNIT in a UNIT list of one element.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* #list<Wrapper.Unit#UNIT>  The UNITs wrappers.


### UNIT:GetLife()
Returns the unit's health. Dead units has health <= 1.0.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The Unit's health value.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetLife0()
Returns the Unit's initial health.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The Unit's initial health value.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetCategoryName()
Returns the category name of the #UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  Category name = Helicopter, Airplane, Ground Unit, Ship


### UNIT:GetThreatLevel()
Returns the Unit's A2G threat level on a scale from 1 to 10 ...
The following threat levels are foreseen:

* Threat level  0: Unit is unarmed.
* Threat level  1: Unit is infantry.
* Threat level  2: Unit is an infantry vehicle.
* Threat level  3: Unit is ground artillery.
* Threat level  4: Unit is a tank.
* Threat level  5: Unit is a modern tank or ifv with ATGM.
* Threat level  6: Unit is a AAA.
* Threat level  7: Unit is a SAM or manpad, IR guided.
* Threat level  8: Unit is a Short Range SAM, radar guided.
* Threat level  9: Unit is a Medium Range SAM, radar guided.
* Threat level 10: Unit is a Long Range SAM, radar guided.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:IsInZone(Zone)
Returns true if the unit is within a [Zone](#zone-module-).

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the unit is within the [ZONE_BASE](#zone_base-class-)


### UNIT:IsNotInZone(Zone)
Returns true if the unit is not within a [Zone](#zone-module-).

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the unit is not within the [ZONE_BASE](#zone_base-class-)


### UNIT:OtherUnitInRadius(AwaitUnit, The)
Returns true if there is an **other** DCS Unit within a radius of the current 2D point of the DCS Unit.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [UNIT](#unit-class-)
AwaitUnit : The other UNIT wrapper object.
* Radius The : radius in meters with the DCS Unit in the centre.

<h4> Returns </h4>
* true  If the other DCS Unit is within the radius of the 2D point of the DCS Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:Flare(FlareColor)
Signal a flare at the position of the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [FLARECOLOR](#flarecolor-class-) FlareColor

<h4> Returns </h4>

### UNIT:FlareWhite()
Signal a white flare at the position of the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:FlareYellow()
Signal a yellow flare at the position of the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:FlareGreen()
Signal a green flare at the position of the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:FlareRed()
Signal a red flare at the position of the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:Smoke()
Smoke the UNIT.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeGreen()
Smoke the UNIT Green.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeRed()
Smoke the UNIT Red.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeWhite()
Smoke the UNIT White.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeOrange()
Smoke the UNIT Orange.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeBlue()
Smoke the UNIT Blue.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:IsAir()
Returns if the unit is of an air category.
If the unit is a helicopter or a plane, then this method will return true, otherwise false.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Air category evaluation result.


### UNIT:IsGround()
Returns if the unit is of an ground category.
If the unit is a ground vehicle or infantry, this method will return true, otherwise false.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Ground category evaluation result.


### UNIT:IsFriendly()
Returns if the unit is a friendly unit.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  IsFriendly evaluation result.


### UNIT:IsShip()
Returns if the unit is of a ship category.
If the unit is a ship, this method will return true, otherwise false.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Ship category evaluation result.


### UNIT:InAir()
Returns true if the UNIT is in the air.

<h4> Parameters </h4>
* [UNIT](#unit-class-) self

<h4> Returns </h4>
* <u>Boolean</u>  true if in the air.
* <u>Nil</u>  The UNIT is not existing or alive.


### UNIT:HandleEvent(Event, EventFunction)
Subscribe to a DCS Event.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [EVENTS](#events-class-) Event
* <u>Function()</u> EventFunction : (optional) The function to be called when the event occurs for the unit.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:UnHandleEvent(Event)
UnSubscribe to a DCS event.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [EVENTS](#events-class-) Event

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:ResetEvents()
Reset the subscriptions.

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* [UNIT](#unit-class-)



## Unit.SensorType Class
<pre>
The Unit.SensorType class does not inherit
</pre>

<h4> Attributes </h4>

* OPTIC self
* RADAR self
* IRST self
* RWR self


