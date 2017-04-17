# Wrapper.Group Module
**Wrapper** -- GROUP is a wrapper class for the DCS Class Group.



The [GROUP](#group-class) class is a wrapper class to handle the DCS Group objects:

* Support all DCS Group APIs.
* Enhance with Group specific APIs not in the DCS Group API set.
* Handle local Group Controller.
* Manage the "state" of the DCS Group.

**IMPORTANT: ONE SHOULD NEVER SANATIZE these GROUP OBJECT REFERENCES! (make the GROUP object references nil).**

See the detailed documentation on the GROUP class.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-03-26: GROUP:**RouteRTB( RTBAirbase, Speed )** added.

2017-03-07: GROUP:**HandleEvent( Event, EventFunction )** added.
2017-03-07: GROUP:**UnHandleEvent( Event )** added.

2017-01-24: GROUP:**SetAIOnOff( AIOnOff )** added.

2017-01-24: GROUP:**SetAIOn()** added.

2017-01-24: GROUP:**SetAIOff()** added.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* [**Entropy**](https://forums.eagle.ru/member.php?u=111471), **Afinegan**: Came up with the requirement for AIOnOff().

#####  Authors:

* **FlightControl**: Design & Programming

## GROUP Class
<pre>
Inheritance : The GROUP Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
				`-- CONTROLLABLE
					`-- GROUP
</pre>
<h4> Attributes </h4>

* <u>String</u> GroupName : The name of the group.


### GROUP:Register(GroupName)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* Dcs.DCSWrapper.Group#Group GroupName : The DCS Group name

<h4> Returns </h4>
* [GROUP](#group-class)
self


### GROUP:Find(DCSGroup)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* Dcs.DCSWrapper.Group#Group DCSGroup : The DCS Group.

<h4> Returns </h4>
* [GROUP](#group-class)
The : GROUP.


### GROUP:FindByName(GroupName)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>String</u> GroupName : The DCS Group Name.

<h4> Returns </h4>
* [GROUP](#group-class)
The : GROUP.


### GROUP:GetDCSObject()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Group#Group The : DCS Group.


### GROUP:IsAlive()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if the Group is alive and active.
* <u>Boolean</u> false : if the Group is alive but inactive.
* <u>Nil</u> if : the group does not exist anymore.


### GROUP:Destroy()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>

### GROUP:GetCategory()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Group#Group.Category The : category ID


### GROUP:GetCategoryName()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>String</u> Category : name = Helicopter, Airplane, Ground Unit, Ship


### GROUP:GetCoalition()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* Dcs.DCSCoalitionWrapper.Object#coalition.side The : coalition side of the DCS Group.


### GROUP:GetCountry()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [country.id](#country.id-class) The : country identifier.
* <u>Nil</u> The : DCS Group is not existing or alive.


### GROUP:GetUnit(UnitNumber)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>Number</u> UnitNumber : The number of the UNIT wrapper class to be returned.

<h4> Returns </h4>
* [UNIT](#unit-class) The : UNIT wrapper class.


### GROUP:GetDCSUnit(UnitNumber)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>Number</u> UnitNumber : The number of the DCS Unit to be returned.

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit The : DCS Unit.


### GROUP:GetSize()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Number</u> The : DCS Group size.


### GROUP:GetInitialSize()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Number</u> The : DCS Group initial size.


### GROUP:GetDCSUnits()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>List[]</u> The : DCS Units.


### GROUP:Activate()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>

### GROUP:GetTypeName()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>String</u> The : type name of the group.


### GROUP:GetCallsign()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>String</u> The : CallSign of the first DCS Unit of the DCS Group.


### GROUP:GetVec2()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) Current : Vec2 point of the first DCS Unit of the DCS Group.


### GROUP:GetVec3()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [Vec3](#vec3-class) Current : Vec3 of the first DCS Unit of the GROUP.


### GROUP:GetPointVec2()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) The : 2D point vector of the first DCS Unit of the GROUP.
* <u>Nil</u> The : first UNIT is not existing or alive.


### GROUP:GetRandomVec3(Radius)
``` lua
-- If Radius is ignored, returns the [Vec3](#vec3-class) of first UNIT of the GROUP
```

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>Number</u> Radius

<h4> Returns </h4>
* [Vec3](#vec3-class) The : random 3D point vector around the first UNIT of the GROUP.
* <u>Nil</u> The : GROUP is invalid or empty


### GROUP:GetHeading()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Number</u> mean : heading of the GROUP
* <u>Nil</u> The : first UNIT is not existing or alive.


### GROUP:IsCompletelyInZone(Zone)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [ZONE_BASE](#zone_base-class) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u> Returns : true if the Group is completely within the [ZONE_BASE](#zone_base-class)


### GROUP:IsPartlyInZone(Zone)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [ZONE_BASE](#zone_base-class) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u> Returns : true if the Group is partially within the [ZONE_BASE](#zone_base-class)


### GROUP:IsNotInZone(Zone)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [ZONE_BASE](#zone_base-class) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u> Returns : true if the Group is not within the [ZONE_BASE](#zone_base-class)


### GROUP:IsAir()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> Air : category evaluation result.


### GROUP:IsHelicopter()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if DCS Group contains Helicopters.


### GROUP:IsAirPlane()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if DCS Group contains AirPlanes.


### GROUP:IsGround()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if DCS Group contains Ground troops.


### GROUP:IsShip()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if DCS Group contains Ships.


### GROUP:AllOnGround()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Boolean</u> All : units on the ground result.


### GROUP:SetAIOnOff(AIOnOff)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>Boolean</u> AIOnOff : The value true turns the AI On, the value false turns the AI Off.

<h4> Returns </h4>
* [GROUP](#group-class)
The : GROUP.


### GROUP:SetAIOn()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [GROUP](#group-class)
The : GROUP.


### GROUP:SetAIOff()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [GROUP](#group-class)
The : GROUP.


### GROUP:GetMaxVelocity()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Number</u> Maximum : velocity found.


### GROUP:GetMinHeight()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Number</u> Minimum : height found.


### GROUP:GetMaxHeight()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>Number</u> Maximum : height found.


### GROUP:Respawn(Template)

<h4> Parameters </h4>
* [GROUP](#group-class) self
* <u>List[]</u> Template : The template of the Group retrieved with GROUP:GetTemplate()

<h4> Returns </h4>

### GROUP:GetTemplate()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>List[]</u> self


### GROUP:SetTemplateControlled(Controlled)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>Boolean</u> Controlled : true is controlled, false is uncontrolled.

<h4> Returns </h4>
* <u>List[]</u> self


### GROUP:SetTemplateCountry(CountryID)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [country.id](#country.id-class) CountryID : The country ID.

<h4> Returns </h4>
* <u>List[]</u> self


### GROUP:SetTemplateCoalition(CoalitionID)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* Dcs.DCSCoalitionWrapper.Object#coalition.side CoalitionID : The coalition ID.

<h4> Returns </h4>
* <u>List[]</u> self


### GROUP:GetTaskMission()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>List[]</u> The : MissionTemplate


### GROUP:GetTaskRoute()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>List[]</u> The : mission route defined by points.


### GROUP:CopyRoute(Begin, End, Randomize, Radius)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* <u>Number</u> Begin : The route point from where the copy will start. The base route point is 0.
* <u>Number</u> End : The route point where the copy will end. The End point is the last point - the End point. The last point has base 0.
* <u>Boolean</u> Randomize : Randomization of the route, when true.
* <u>Number</u> Radius : When randomization is on, the randomization is within the radius.

<h4> Returns </h4>

### GROUP:CalculateThreatLevelA2G()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>

### GROUP:InAir()

<h4> Parameters </h4>
* [GROUP](#group-class) self

<h4> Returns </h4>
* <u>Boolean</u> true : if in the first unit of the group is in the air.
* <u>Nil</u> The : GROUP is not existing or not alive.


### GROUP:RouteRTB(RTBAirbase, Speed)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [AIRBASE](#airbase-class) RTBAirbase : (optional) The [Airbase](#airbase-module) to return to. If blank, the controllable will return to the nearest friendly airbase.
* <u>Number</u> Speed : (optional) The Speed, if no Speed is given, the maximum Speed of the first unit is selected.

<h4> Returns </h4>
* [GROUP](#group-class)
self


### GROUP:HandleEvent(Event, EventFunction)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [EVENTS](#events-class) Event
* <u>Function()</u> EventFunction : (optional) The function to be called when the event occurs for the GROUP.

<h4> Returns </h4>
* [GROUP](#group-class)
self


### GROUP:UnHandleEvent(Event)

<h4> Parameters </h4>
* [GROUP](#group-class)
self
* [EVENTS](#events-class) Event

<h4> Returns </h4>
* [GROUP](#group-class)
self


### GROUP:ResetEvents()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* [GROUP](#group-class)
self


### GROUP:GetPlayerNames()

<h4> Parameters </h4>
* [GROUP](#group-class)
self

<h4> Returns </h4>
* <u>List[]</u> The : group has players, an array of player names is returned.
* <u>Nil</u> The : group has no players


