# Wrapper.Group Module
**Wrapper** -- GROUP is a wrapper class for the DCS Class Group.



The [GROUP](#group-class-) class is a wrapper class to handle the DCS Group objects:

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
Create a new GROUP from a DCSGroup

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* Dcs.DCSWrapper.Group#Group GroupName : The DCS Group name

<h4> Returns </h4>
* [GROUP](#group-class-)



### GROUP:Find(DCSGroup)
Find the GROUP wrapper class instance using the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* Dcs.DCSWrapper.Group#Group DCSGroup : The DCS Group.

<h4> Returns </h4>
* [GROUP](#group-class-)
 The GROUP.


### GROUP:FindByName(GroupName)
Find the created GROUP using the DCS Group Name.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>String</u> GroupName : The DCS Group Name.

<h4> Returns </h4>
* [GROUP](#group-class-)
 The GROUP.


### GROUP:GetDCSObject()
Returns the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Group#Group  The DCS Group.


### GROUP:IsAlive()
Returns if the Group is alive.
The Group must:

* Exist at run-time.
* Has at least one unit.

When the first [Unit](#unit-module-) of the Group is active, it will return true.
If the first [Unit](#unit-module-) of the Group is inactive, it will return false.


<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if the Group is alive and active.
* <u>Boolean</u>  false if the Group is alive but inactive.
* <u>Nil</u>  if the group does not exist anymore.


### GROUP:Destroy()
Destroys the DCS Group and all of its DCS Units.
Note that this destroy method also raises a destroy event at run-time.
So all event listeners will catch the destroy event of this DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>

### GROUP:GetCategory()
Returns category of the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Group#Group.Category  The category ID


### GROUP:GetCategoryName()
Returns the category name of the #GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>String</u>  Category name = Helicopter, Airplane, Ground Unit, Ship


### GROUP:GetCoalition()
Returns the coalition of the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* Dcs.DCSCoalitionWrapper.Object#coalition.side  The coalition side of the DCS Group.


### GROUP:GetCountry()
Returns the country of the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [country.id](#country.id-class-)  The country identifier.
* <u>Nil</u>  The DCS Group is not existing or alive.


### GROUP:GetUnit(UnitNumber)
Returns the UNIT wrapper class with number UnitNumber.
If the underlying DCS Unit does not exist, the method will return nil. .

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>Number</u> UnitNumber : The number of the UNIT wrapper class to be returned.

<h4> Returns </h4>
* [UNIT](#unit-class-)  The UNIT wrapper class.


### GROUP:GetDCSUnit(UnitNumber)
Returns the DCS Unit with number UnitNumber.
If the underlying DCS Unit does not exist, the method will return nil. .

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>Number</u> UnitNumber : The number of the DCS Unit to be returned.

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit  The DCS Unit.


### GROUP:GetSize()
Returns current size of the DCS Group.
If some of the DCS Units of the DCS Group are destroyed the size of the DCS Group is changed.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The DCS Group size.


### GROUP:GetInitialSize()

- Returns the initial size of the DCS Group.
If some of the DCS Units of the DCS Group are destroyed, the initial size of the DCS Group is unchanged.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The DCS Group initial size.


### GROUP:GetDCSUnits()
Returns the DCS Units of the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The DCS Units.


### GROUP:Activate()
Activates a GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>

### GROUP:GetTypeName()
Gets the type name of the group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>String</u>  The type name of the group.


### GROUP:GetCallsign()
Gets the CallSign of the first DCS Unit of the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>String</u>  The CallSign of the first DCS Unit of the DCS Group.


### GROUP:GetVec2()
Returns the current point (Vec2 vector) of the first DCS Unit in the DCS Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [Vec2](#vec2-class-)  Current Vec2 point of the first DCS Unit of the DCS Group.


### GROUP:GetVec3()
Returns the current Vec3 vector of the first DCS Unit in the GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [Vec3](#vec3-class-)  Current Vec3 of the first DCS Unit of the GROUP.


### GROUP:GetPointVec2()
Returns a POINT_VEC2 object indicating the point in 2D of the first UNIT of the GROUP within the mission.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class-)  The 2D point vector of the first DCS Unit of the GROUP.
* <u>Nil</u>  The first UNIT is not existing or alive.


### GROUP:GetRandomVec3(Radius)
``` lua
-- If Radius is ignored, returns the [Vec3](#vec3-class-) of first UNIT of the GROUP
```
Returns a random @{DCSTypes#Vec3} vector (point in 3D of the UNIT within the mission) within a range around the first UNIT of the GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>Number</u> Radius

<h4> Returns </h4>
* [Vec3](#vec3-class-)  The random 3D point vector around the first UNIT of the GROUP.
* <u>Nil</u>  The GROUP is invalid or empty


### GROUP:GetHeading()
Returns the mean heading of every UNIT in the GROUP in degrees

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Number</u>  mean heading of the GROUP
* <u>Nil</u>  The first UNIT is not existing or alive.


### GROUP:IsCompletelyInZone(Zone)
Returns true if all units of the group are within a [Zone](#zone-module-).

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the Group is completely within the [ZONE_BASE](#zone_base-class-)


### GROUP:IsPartlyInZone(Zone)
Returns true if some units of the group are within a [Zone](#zone-module-).

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the Group is partially within the [ZONE_BASE](#zone_base-class-)


### GROUP:IsNotInZone(Zone)
Returns true if none of the group units of the group are within a [Zone](#zone-module-).

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [ZONE_BASE](#zone_base-class-) Zone : The zone to test.

<h4> Returns </h4>
* <u>Boolean</u>  Returns true if the Group is not within the [ZONE_BASE](#zone_base-class-)


### GROUP:IsAir()
Returns if the group is of an air category.
If the group is a helicopter or a plane, then this method will return true, otherwise false.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  Air category evaluation result.


### GROUP:IsHelicopter()
Returns if the DCS Group contains Helicopters.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if DCS Group contains Helicopters.


### GROUP:IsAirPlane()
Returns if the DCS Group contains AirPlanes.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if DCS Group contains AirPlanes.


### GROUP:IsGround()
Returns if the DCS Group contains Ground troops.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if DCS Group contains Ground troops.


### GROUP:IsShip()
Returns if the DCS Group contains Ships.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if DCS Group contains Ships.


### GROUP:AllOnGround()
Returns if all units of the group are on the ground or landed.
If all units of this group are on the ground, this function will return true, otherwise false.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  All units on the ground result.


### GROUP:SetAIOnOff(AIOnOff)
Turns the AI On or Off for the GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>Boolean</u> AIOnOff : The value true turns the AI On, the value false turns the AI Off.

<h4> Returns </h4>
* [GROUP](#group-class-)
 The GROUP.


### GROUP:SetAIOn()
Turns the AI On for the GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [GROUP](#group-class-)
 The GROUP.


### GROUP:SetAIOff()
Turns the AI Off for the GROUP.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [GROUP](#group-class-)
 The GROUP.


### GROUP:GetMaxVelocity()
Returns the current maximum velocity of the group.
Each unit within the group gets evaluated, and the maximum velocity (= the unit which is going the fastest) is returned.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Number</u>  Maximum velocity found.


### GROUP:GetMinHeight()
Returns the current minimum height of the group.
Each unit within the group gets evaluated, and the minimum height (= the unit which is the lowest elevated) is returned.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Number</u>  Minimum height found.


### GROUP:GetMaxHeight()
Returns the current maximum height of the group.
Each unit within the group gets evaluated, and the maximum height (= the unit which is the highest elevated) is returned.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>Number</u>  Maximum height found.


### GROUP:Respawn(Template)
Respawn the [GROUP](#group-module-) using a (tweaked) template of the Group.
The template must be retrieved with the GROUP-GetTemplate- function.
The template contains all the definitions as declared within the mission file.
To understand templates, do the following:

* unpack your .miz file into a directory using 7-zip.
* browse in the directory created to the file **mission**.
* open the file and search for the country group definitions.

Your group template will contain the fields as described within the mission file.

This function will:

* Get the current position and heading of the group.
* When the group is alive, it will tweak the template x, y and heading coordinates of the group and the embedded units to the current units positions.
* Then it will destroy the current alive group.
* And it will respawn the group using your new template definition.

<h4> Parameters </h4>
* [GROUP](#group-class-) self
* <u>List[]</u> Template : The template of the Group retrieved with GROUP:GetTemplate()

<h4> Returns </h4>

### GROUP:GetTemplate()
Returns the group template from the [DATABASE](#database-module-) (_DATABASE object).

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>List[]</u> 


### GROUP:SetTemplateControlled(Controlled)
Sets the controlled status in a Template.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>Boolean</u> Controlled : true is controlled, false is uncontrolled.

<h4> Returns </h4>
* <u>List[]</u> 


### GROUP:SetTemplateCountry(CountryID)
Sets the CountryID of the group in a Template.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [country.id](#country.id-class-) CountryID : The country ID.

<h4> Returns </h4>
* <u>List[]</u> 


### GROUP:SetTemplateCoalition(CoalitionID)
Sets the CoalitionID of the group in a Template.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* Dcs.DCSCoalitionWrapper.Object#coalition.side CoalitionID : The coalition ID.

<h4> Returns </h4>
* <u>List[]</u> 


### GROUP:GetTaskMission()
Return the mission template of the group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The MissionTemplate


### GROUP:GetTaskRoute()
Return the mission route of the group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The mission route defined by points.


### GROUP:CopyRoute(Begin, End, Randomize, Radius)
Return the route of a group by using the [DATABASE](#database-class-) class.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* <u>Number</u> Begin : The route point from where the copy will start. The base route point is 0.
* <u>Number</u> End : The route point where the copy will end. The End point is the last point - the End point. The last point has base 0.
* <u>Boolean</u> Randomize : Randomization of the route, when true.
* <u>Number</u> Radius : When randomization is on, the randomization is within the radius.

<h4> Returns </h4>

### GROUP:CalculateThreatLevelA2G()
Calculate the maxium A2G threat level of the Group.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>

### GROUP:InAir()
Returns true if the first unit of the GROUP is in the air.

<h4> Parameters </h4>
* [GROUP](#group-class-) self

<h4> Returns </h4>
* <u>Boolean</u>  true if in the first unit of the group is in the air.
* <u>Nil</u>  The GROUP is not existing or not alive.


### GROUP:RouteRTB(RTBAirbase, Speed)
(AIR) Return the Group to an [AIRBASE](#airbase-class-).
The following things are to be taken into account:

* The group is respawned to achieve the RTB, there may be side artefacts as a result of this. (Like weapons suddenly come back).
* A group consisting out of more than one unit, may rejoin formation when respawned.
* A speed can be given in km/h. If no speed is specified, the maximum speed of the first unit will be taken to return to base.
* When there is no [Airbase](#airbase-module-) object specified, the group will return to the home base if the route of the group is pinned at take-off or at landing to a base.
* When there is no [Airbase](#airbase-module-) object specified and the group route is not pinned to any airbase, it will return to the nearest airbase.


<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [AIRBASE](#airbase-class-) RTBAirbase : (optional) The [Airbase](#airbase-module-) to return to. If blank, the controllable will return to the nearest friendly airbase.
* <u>Number</u> Speed : (optional) The Speed, if no Speed is given, the maximum Speed of the first unit is selected.

<h4> Returns </h4>
* [GROUP](#group-class-)



### GROUP:HandleEvent(Event, EventFunction)
Subscribe to a DCS Event.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [EVENTS](#events-class-) Event
* <u>Function()</u> EventFunction : (optional) The function to be called when the event occurs for the GROUP.

<h4> Returns </h4>
* [GROUP](#group-class-)



### GROUP:UnHandleEvent(Event)
UnSubscribe to a DCS event.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self
* [EVENTS](#events-class-) Event

<h4> Returns </h4>
* [GROUP](#group-class-)



### GROUP:ResetEvents()
Reset the subscriptions.

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* [GROUP](#group-class-)



### GROUP:GetPlayerNames()
Get player names

<h4> Parameters </h4>
* [GROUP](#group-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The group has players, an array of player names is returned.
* <u>Nil</u>  The group has no players


