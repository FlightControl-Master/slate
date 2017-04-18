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

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* <u>String</u> UnitName : The name of the DCS unit.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:Find(DCSUnit)

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* Dcs.DCSWrapper.Unit#Unit DCSUnit : An existing DCS Unit object reference.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:FindByName(UnitName)

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* <u>String</u> UnitName : The Unit Name.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:Name()

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

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [Vec3](#vec3-class-) SpawnVec3 : The position where to Spawn the new Unit at.
* <u>Number</u> Heading : The heading of the unit respawn.

<h4> Returns </h4>

### UNIT:IsActive()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is activated.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:IsAlive()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is alive and active.
* <u>Boolean</u>  false if Unit is alive but not active.
* <u>Nil</u>  if the Unit is not existing or is not alive.


### UNIT:GetCallsign()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The Callsign of the Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetPlayerName()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  Player Name
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetNumber()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The Unit number.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetGroup()

<h4> Parameters </h4>
* [UNIT](#unit-class-) self

<h4> Returns </h4>
* [GROUP](#group-class-)  The Group of the Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetPrefix()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The name of the DCS Unit.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetAmmo()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit.Ammo 
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetSensors()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit.Sensors 
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:HasSensors()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  returns true if the unit has specified types of sensors. This function is more preferable than Unit.getSensors() if you don't want to get information about all the unit's sensors, and just want to check if the unit has specified types of sensors.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:HasSEAD()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  returns true if the unit is SEADable.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetRadar()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  self Indicates if at least one of the unit's radar(s) is on.
* Dcs.DCSWrapper.Object#Object  The object of the radar's interest. Not nil only if at least one radar of the unit is tracking a target.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetFuel()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The relative amount of fuel (from 0.0 to 1.0).
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetUnits()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* #list<Wrapper.Unit#UNIT>  The UNITs wrappers.


### UNIT:GetLife()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The Unit's health value.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetLife0()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The Unit's initial health value.
* <u>Nil</u>  The DCS Unit is not existing or alive.


### UNIT:GetCategoryName()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  Category name = Helicopter, Airplane, Ground Unit, Ship


### UNIT:GetThreatLevel()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:IsInZone(Zone)

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the unit is within the [ZONE_BASE](#zone_base-class-)


### UNIT:IsNotInZone(Zone)

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the unit is not within the [ZONE_BASE](#zone_base-class-)


### UNIT:OtherUnitInRadius(AwaitUnit, The)

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

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [FLARECOLOR](#flarecolor-class-) FlareColor

<h4> Returns </h4>

### UNIT:FlareWhite()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:FlareYellow()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:FlareGreen()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:FlareRed()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:Smoke()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeGreen()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeRed()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeWhite()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeOrange()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:SmokeBlue()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>

### UNIT:IsAir()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Air category evaluation result.


### UNIT:IsGround()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Ground category evaluation result.


### UNIT:IsFriendly()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  IsFriendly evaluation result.


### UNIT:IsShip()

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Ship category evaluation result.


### UNIT:InAir()

<h4> Parameters </h4>
* [UNIT](#unit-class-) self

<h4> Returns </h4>
* <u>Boolean</u>  true if in the air.
* <u>Nil</u>  The UNIT is not existing or alive.


### UNIT:HandleEvent(Event, EventFunction)

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [EVENTS](#events-class-) Event
* <u>Function()</u> EventFunction : (optional) The function to be called when the event occurs for the unit.

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:UnHandleEvent(Event)

<h4> Parameters </h4>
* [UNIT](#unit-class-)
self
* [EVENTS](#events-class-) Event

<h4> Returns </h4>
* [UNIT](#unit-class-)



### UNIT:ResetEvents()

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


