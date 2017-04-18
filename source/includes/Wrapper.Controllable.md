# Wrapper.Controllable Module
This module contains the CONTROLLABLE class.

##### 1) [CONTROLLABLE](#controllable-class-) class, extends [POSITIONABLE](#positionable-class-)

The [CONTROLLABLE](#controllable-class-) class is a wrapper class to handle the DCS Controllable objects:

* Support all DCS Controllable APIs.
* Enhance with Controllable specific APIs not in the DCS Controllable API set.
* Handle local Controllable Controller.
* Manage the "state" of the DCS Controllable.

##### 1.1) CONTROLLABLE constructor

The CONTROLLABLE class provides the following functions to construct a CONTROLLABLE instance:

* [CONTROLLABLE:New()](#controllable-new-controllablename): Create a CONTROLLABLE instance.

##### 1.2) CONTROLLABLE task methods

Several controllable task methods are available that help you to prepare tasks.
These methods return a string consisting of the task description, which can then be given to either a CONTROLLABLE-PushTask- or @{Controllable#SetTask} method to assign the task to the CONTROLLABLE.
Tasks are specific for the category of the CONTROLLABLE, more specific, for AIR, GROUND or AIR and GROUND.
Each task description where applicable indicates for which controllable category the task is valid.
There are 2 main subdivisions of tasks: Assigned tasks and EnRoute tasks.

#####  1.2.1) Assigned task methods

Assigned task methods make the controllable execute the task where the location of the (possible) targets of the task are known before being detected.
This is different from the EnRoute tasks, where the targets of the task need to be detected before the task can be executed.

Find below a list of the **assigned task** methods:

* [CONTROLLABLE:TaskAttackGroup()](#controllable-taskattackgroup-attackgroup-weapontype-weaponexpend-attackqty-direction-altitude-attackqtylimit): (AIR) Attack a Controllable.
* [CONTROLLABLE:TaskAttackMapObject()](#controllable-taskattackmapobject-vec2-weapontype-weaponexpend-attackqty-direction-controllableattack): (AIR) Attacking the map object (building, structure, e.t.c).
* [CONTROLLABLE:TaskAttackUnit()](#controllable-taskattackunit-attackunit-groupattack-weaponexpend-attackqty-direction-altitude-visible-weapontype): (AIR) Attack the Unit.
* [CONTROLLABLE:TaskBombing()](#controllable-taskbombing-vec2-weapontype-weaponexpend-attackqty-direction-controllableattack): (AIR) Delivering weapon at the point on the ground.
* [CONTROLLABLE:TaskBombingRunway()](#controllable-taskbombingrunway-airbase-weapontype-weaponexpend-attackqty-direction-controllableattack): (AIR) Delivering weapon on the runway.
* [CONTROLLABLE:TaskEmbarking()](#controllable-taskembarking-point-duration-embarkingcontrollable): (AIR) Move the controllable to a Vec2 Point, wait for a defined duration and embark a controllable.
* [CONTROLLABLE:TaskEmbarkToTransport()](#controllable-taskembarktotransport-point-radius): (GROUND) Embark to a Transport landed at a location.
* [CONTROLLABLE:TaskEscort()](#controllable-taskescort-escortcontrollable-vec3-lastwaypointindex-engagementdistancemax-targettypes): (AIR) Escort another airborne controllable.
* [CONTROLLABLE:TaskFAC_AttackGroup()](#controllable-taskfac_attackgroup-attackgroup-weapontype-designation-datalink): (AIR + GROUND) The task makes the controllable/unit a FAC and orders the FAC to control the target (enemy ground controllable) destruction.
* [CONTROLLABLE:TaskFireAtPoint()](#controllable-taskfireatpoint-vec2-radius-ammocount): (GROUND) Fire some or all ammunition at a VEC2 point.
* [CONTROLLABLE:TaskFollow()](#controllable-taskfollow-followcontrollable-vec3-lastwaypointindex): (AIR) Following another airborne controllable.
* CONTROLLABLE-TaskHold-: (GROUND) Hold ground controllable from moving.
* [CONTROLLABLE:TaskHoldPosition()](#controllable-taskholdposition-duration): (AIR) Hold position at the current position of the first unit of the controllable.
* CONTROLLABLE-TaskLand-: (AIR HELICOPTER) Landing at the ground. For helicopters only.
* [CONTROLLABLE:TaskLandAtZone()](#controllable-tasklandatzone-zone-duration): (AIR) Land the controllable at a @{Zone#ZONE_RADIUS).
* [CONTROLLABLE:TaskOrbitCircle()](#controllable-taskorbitcircle-altitude-speed): (AIR) Orbit at the current position of the first unit of the controllable at a specified alititude.
* [CONTROLLABLE:TaskOrbitCircleAtVec2()](#controllable-taskorbitcircleatvec2-point-altitude-speed): (AIR) Orbit at a specified position at a specified alititude during a specified duration with a specified speed.
* CONTROLLABLE-TaskRefueling-: (AIR) Refueling from the nearest tanker. No parameters.
* [CONTROLLABLE:TaskRoute()](#controllable-taskroute-points): (AIR + GROUND) Return a Misson task to follow a given route defined by Points.
* CONTROLLABLE-TaskRouteToVec2-: (AIR + GROUND) Make the Controllable move to a given point.
* CONTROLLABLE-TaskRouteToVec3-: (AIR + GROUND) Make the Controllable move to a given point.
* [CONTROLLABLE:TaskRouteToZone()](#controllable-taskroutetozone-zone-randomize-speed-formation): (AIR + GROUND) Route the controllable to a given zone.
* CONTROLLABLE-TaskReturnToBase-: (AIR) Route the controllable to an airbase.

#####  1.2.2) EnRoute task methods

EnRoute tasks require the targets of the task need to be detected by the controllable (using its sensors) before the task can be executed:

* CONTROLLABLE-EnRouteTaskAWACS-: (AIR) Aircraft will act as an AWACS for friendly units (will provide them with information about contacts). No parameters.
* CONTROLLABLE-EnRouteTaskEngageControllable-: (AIR) Engaging a controllable. The task does not assign the target controllable to the unit/controllable to attack now; it just allows the unit/controllable to engage the target controllable as well as other assigned targets.
* [CONTROLLABLE:EnRouteTaskEngageTargets()](#controllable-enroutetaskengagetargets-distance-targettypes-priority): (AIR) Engaging targets of defined types.
* CONTROLLABLE-EnRouteTaskEWR-: (AIR) Attack the Unit.
* [CONTROLLABLE:EnRouteTaskFAC()](#controllable-enroutetaskfac-radius-priority): (AIR + GROUND) The task makes the controllable/unit a FAC and lets the FAC to choose a targets (enemy ground controllable) around as well as other assigned targets.
* CONTROLLABLE-EnRouteTaskFAC_EngageControllable-: (AIR + GROUND) The task makes the controllable/unit a FAC and lets the FAC to choose the target (enemy ground controllable) as well as other assigned targets.
* CONTROLLABLE-EnRouteTaskTanker-: (AIR) Aircraft will act as a tanker for friendly units. No parameters.

#####  1.2.3) Preparation task methods

There are certain task methods that allow to tailor the task behaviour:

* [CONTROLLABLE:TaskWrappedAction()](#controllable-taskwrappedaction-dcscommand): Return a WrappedAction Task taking a Command.
* [CONTROLLABLE:TaskCombo()](#controllable-taskcombo-dcstasks): Return a Combo Task taking an array of Tasks.
* [CONTROLLABLE:TaskCondition()](#controllable-taskcondition-time-userflag-userflagvalue-condition-duration-lastwaypoint): Return a condition section for a controlled task.
* [CONTROLLABLE:TaskControlled()](#controllable-taskcontrolled-dcstask-dcsstopcondition): Return a Controlled Task taking a Task and a TaskCondition.

#####  1.2.4) Obtain the mission from controllable templates

Controllable templates contain complete mission descriptions. Sometimes you want to copy a complete mission from a controllable and assign it to another:

* [CONTROLLABLE:TaskMission()](#controllable-taskmission-taskmission): (AIR + GROUND) Return a mission task from a mission template.

##### 1.3) CONTROLLABLE Command methods

Controllable **command methods** prepare the execution of commands using the [CONTROLLABLE:SetCommand()](#controllable-setcommand-dcscommand) method:

* [CONTROLLABLE:CommandDoScript()](#controllable-commanddoscript-doscript): Do Script command.
* [CONTROLLABLE:CommandSwitchWayPoint()](#controllable-commandswitchwaypoint-fromwaypoint-towaypoint): Perform a switch waypoint command.

##### 1.4) CONTROLLABLE Option methods

Controllable **Option methods** change the behaviour of the Controllable while being alive.

#####  1.4.1) Rule of Engagement:

* CONTROLLABLE-OptionROEWeaponFree-
* CONTROLLABLE-OptionROEOpenFire-
* CONTROLLABLE-OptionROEReturnFire-
* CONTROLLABLE-OptionROEEvadeFire-

To check whether an ROE option is valid for a specific controllable, use:

* CONTROLLABLE-OptionROEWeaponFreePossible-
* CONTROLLABLE-OptionROEOpenFirePossible-
* CONTROLLABLE-OptionROEReturnFirePossible-
* CONTROLLABLE-OptionROEEvadeFirePossible-

#####  1.4.2) Rule on thread:

* CONTROLLABLE-OptionROTNoReaction-
* CONTROLLABLE-OptionROTPassiveDefense-
* CONTROLLABLE-OptionROTEvadeFire-
* CONTROLLABLE-OptionROTVertical-

To test whether an ROT option is valid for a specific controllable, use:

* CONTROLLABLE-OptionROTNoReactionPossible-
* CONTROLLABLE-OptionROTPassiveDefensePossible-
* CONTROLLABLE-OptionROTEvadeFirePossible-
* CONTROLLABLE-OptionROTVerticalPossible-



## CONTROLLABLE Class
<pre>
Inheritance : The CONTROLLABLE Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
				`-- CONTROLLABLE
</pre>

<h4> Attributes </h4>

* Dcs.DCSWrapper.Controllable#Controllable DCSControllable : The DCS controllable class.
* <u>String</u> ControllableName : The name of the controllable.


### CONTROLLABLE:New(ControllableName)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* Dcs.DCSWrapper.Controllable#Controllable ControllableName : The DCS Controllable name

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:GetUnits()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* #list<Wrapper.Unit#UNIT>  The UNITs wrappers.


### CONTROLLABLE:GetLife()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The controllable health value (unit or group average).
* <u>Nil</u>  The controllable is not existing or alive.


### CONTROLLABLE:ClearTasks()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:PopCurrentTask()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-) 


### CONTROLLABLE:PushTask()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-) 


### CONTROLLABLE:SetTask()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-) 


### CONTROLLABLE:TaskCondition(time, userFlag, userFlagValue, condition, duration, lastWayPoint)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Time](#time-class-) time
* <u>String</u> userFlag
* <u>Boolean</u> userFlagValue
* <u>String</u> condition
* [Time](#time-class-) duration
* <u>Number</u> lastWayPoint

<h4> Returns </h4>

### CONTROLLABLE:TaskControlled(DCSTask, DCSStopCondition)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* Dcs.DCSTasking.Task#Task DCSTask
* #DCSStopCondition DCSStopCondition

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:TaskCombo(DCSTasks)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* Dcs.DCSTasking.Task#TaskArray DCSTasks : Array of @{DCSTasking.Task#Task}

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:TaskWrappedAction(DCSCommand)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Command](#command-class-) DCSCommand

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:SetCommand(DCSCommand)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Command](#command-class-) DCSCommand

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:CommandSwitchWayPoint(FromWayPoint, ToWayPoint)
``` lua
 This test demonstrates the use(s) of the SwitchWayPoint method of the GROUP class.
HeliGroup = GROUP:FindByName( "Helicopter" )

 Route the helicopter back to the FARP after 60 seconds.
-- We use the SCHEDULER class to do this.
SCHEDULER:New( nil,
function( HeliGroup )
local CommandRTB = HeliGroup:CommandSwitchWayPoint( 2, 8 )
HeliGroup:SetCommand( CommandRTB )
end, { HeliGroup }, 90
)
```

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Number</u> FromWayPoint
* <u>Number</u> ToWayPoint

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:CommandStopRoute(StopRoute)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Boolean</u> StopRoute : true if the ground unit needs to stop, false if it needs to continue to move.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:TaskAttackGroup(AttackGroup, WeaponType, WeaponExpend, AttackQty, Direction, Altitude, AttackQtyLimit)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) AttackGroup : The Controllable to be attacked.
* <u>Number</u> WeaponType : (optional) Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* [Distance](#distance-class-) Altitude : (optional) Desired attack start altitude. Controllable/aircraft will make its attacks from the altitude. If the altitude is too low or too high to use weapon aircraft/controllable will choose closest altitude to the desired attack start altitude. If the desired altitude is defined controllable/aircraft will not attack from safe altitude.
* <u>Boolean</u> AttackQtyLimit : (optional) The flag determines how to interpret attackQty parameter. If the flag is true then attackQty is a limit on maximal attack quantity for "AttackGroup" and "AttackUnit" tasks. If the flag is false then attackQty is a desired attack quantity for "Bombing" and "BombingRunway" tasks.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskAttackUnit(AttackUnit, GroupAttack, WeaponExpend, AttackQty, Direction, Altitude, Visible, WeaponType)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [UNIT](#unit-class-) AttackUnit : The UNIT.
* <u>Boolean</u> GroupAttack : (optional) If true, all units in the group will attack the Unit when found.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* <u>Number</u> Altitude : (optional) The altitude from where to attack.
* <u>Boolean</u> Visible : (optional) not a clue.
* <u>Number</u> WeaponType : (optional) The WeaponType.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskBombing(Vec2, WeaponType, WeaponExpend, AttackQty, Direction, ControllableAttack)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Vec2 : 2D-coordinates of the point to deliver weapon at.
* <u>Number</u> WeaponType : (optional) Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) Desired quantity of passes. The parameter is not the same in AttackGroup and AttackUnit tasks.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* <u>Boolean</u> ControllableAttack : (optional) Flag indicates that the target must be engaged by all aircrafts of the controllable. Has effect only if the task is assigned to a controllable, not to a single aircraft.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskOrbitCircleAtVec2(Point, Altitude, Speed)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Point : The point to hold the position.
* <u>Number</u> Altitude : The altitude to hold the position.
* <u>Number</u> Speed : The speed flying when holding the position.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:TaskOrbitCircle(Altitude, Speed)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Number</u> Altitude : The altitude to hold the position.
* <u>Number</u> Speed : The speed flying when holding the position.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:TaskHoldPosition(Duration)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Number</u> Duration : The maximum duration in seconds to hold the position.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:TaskAttackMapObject(Vec2, WeaponType, WeaponExpend, AttackQty, Direction, ControllableAttack)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Vec2 : 2D-coordinates of the point the map object is closest to. The distance between the point and the map object must not be greater than 2000 meters. Object id is not used here because Mission Editor doesn't support map object identificators.
* <u>Number</u> WeaponType : (optional) Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* <u>Boolean</u> ControllableAttack : (optional) Flag indicates that the target must be engaged by all aircrafts of the controllable. Has effect only if the task is assigned to a controllable, not to a single aircraft.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskBombingRunway(Airbase, WeaponType, WeaponExpend, AttackQty, Direction, ControllableAttack)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [AIRBASE](#airbase-class-) Airbase : Airbase to attack.
* <u>Number</u> WeaponType : (optional) Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* <u>Boolean</u> ControllableAttack : (optional) Flag indicates that the target must be engaged by all aircrafts of the controllable. Has effect only if the task is assigned to a controllable, not to a single aircraft.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskRefueling()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskLandAtVec2(Point, Duration)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Point : The point where to land.
* <u>Number</u> Duration : The duration in seconds to stay on the ground.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:TaskLandAtZone(Zone, Duration)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [ZONE](#zone-class-) Zone : The zone where to land.
* <u>Number</u> Duration : The duration in seconds to stay on the ground.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:TaskFollow(FollowControllable, Vec3, LastWaypointIndex)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) FollowControllable : The controllable to be followed.
* [Vec3](#vec3-class-) Vec3 : Position of the unit / lead unit of the controllable relative lead unit of another controllable in frame reference oriented by course of lead unit of another controllable. If another controllable is on land the unit / controllable will orbit around.
* <u>Number</u> LastWaypointIndex : Detach waypoint of another controllable. Once reached the unit / controllable Follow task is finished.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskEscort(EscortControllable, Vec3, LastWaypointIndex, EngagementDistanceMax, TargetTypes)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) EscortControllable : The controllable to be escorted.
* [Vec3](#vec3-class-) Vec3 : Position of the unit / lead unit of the controllable relative lead unit of another controllable in frame reference oriented by course of lead unit of another controllable. If another controllable is on land the unit / controllable will orbit around.
* <u>Number</u> LastWaypointIndex : Detach waypoint of another controllable. Once reached the unit / controllable Follow task is finished.
* <u>Number</u> EngagementDistanceMax : Maximal distance from escorted controllable to threat. If the threat is already engaged by escort escort will disengage if the distance becomes greater than 1.5 * engagementDistMax.
* [AttributeNameArray](#attributenamearray-class-) TargetTypes : Array of AttributeName that is contains threat categories allowed to engage.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskFireAtPoint(Vec2, Radius, AmmoCount)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Vec2 : The point to fire at.
* [Distance](#distance-class-) Radius : The radius of the zone to deploy the fire at.
* <u>Number</u> AmmoCount : (optional) Quantity of ammunition to expand (omit to fire until ammunition is depleted).

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskHold()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskFAC_AttackGroup(AttackGroup, WeaponType, Designation, Datalink)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) AttackGroup : Target CONTROLLABLE.
* <u>Number</u> WeaponType : Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.Designation](#ai.task.designation-class-) Designation : (optional) Designation type.
* <u>Boolean</u> Datalink : (optional) Allows to use datalink to send the target information to attack aircraft. Enabled by default.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskEngageTargets(Distance, TargetTypes, Priority)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Distance](#distance-class-) Distance : Maximal distance from the target to a route leg. If the target is on a greater distance it will be ignored.
* [AttributeNameArray](#attributenamearray-class-) TargetTypes : Array of target categories allowed to engage.
* <u>Number</u> Priority : All enroute tasks have the priority parameter. This is a number (less value - higher priority) that determines actions related to what task will be performed first.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskEngageTargets(Vec2, Radius, TargetTypes, Priority)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Vec2 : 2D-coordinates of the zone.
* [Distance](#distance-class-) Radius : Radius of the zone.
* [AttributeNameArray](#attributenamearray-class-) TargetTypes : Array of target categories allowed to engage.
* <u>Number</u> Priority : All en-route tasks have the priority parameter. This is a number (less value - higher priority) that determines actions related to what task will be performed first.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskEngageGroup(AttackGroup, Priority, WeaponType, WeaponExpend, AttackQty, Direction, Altitude, AttackQtyLimit)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) AttackGroup : The Controllable to be attacked.
* <u>Number</u> Priority : All en-route tasks have the priority parameter. This is a number (less value - higher priority) that determines actions related to what task will be performed first.
* <u>Number</u> WeaponType : (optional) Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* [Distance](#distance-class-) Altitude : (optional) Desired attack start altitude. Controllable/aircraft will make its attacks from the altitude. If the altitude is too low or too high to use weapon aircraft/controllable will choose closest altitude to the desired attack start altitude. If the desired altitude is defined controllable/aircraft will not attack from safe altitude.
* <u>Boolean</u> AttackQtyLimit : (optional) The flag determines how to interpret attackQty parameter. If the flag is true then attackQty is a limit on maximal attack quantity for "AttackGroup" and "AttackUnit" tasks. If the flag is false then attackQty is a desired attack quantity for "Bombing" and "BombingRunway" tasks.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskEngageUnit(EngageUnit, Priority, GroupAttack, WeaponExpend, AttackQty, Direction, Altitude, Visible, ControllableAttack)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [UNIT](#unit-class-) EngageUnit : The UNIT.
* <u>Number</u> Priority : (optional) All en-route tasks have the priority parameter. This is a number (less value - higher priority) that determines actions related to what task will be performed first.
* <u>Boolean</u> GroupAttack : (optional) If true, all units in the group will attack the Unit when found.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) WeaponExpend : (optional) Determines how much weapon will be released at each attack. If parameter is not defined the unit / controllable will choose expend on its own discretion.
* <u>Number</u> AttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) Direction : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.
* [Distance](#distance-class-) Altitude : (optional) Desired altitude to perform the unit engagement.
* <u>Boolean</u> Visible : (optional) Unit must be visible.
* <u>Boolean</u> ControllableAttack : (optional) Flag indicates that the target must be engaged by all aircrafts of the controllable. Has effect only if the task is assigned to a controllable, not to a single aircraft.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskAWACS()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskTanker()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskEWR()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskFAC_EngageGroup(AttackGroup, Priority, WeaponType, Designation, Datalink)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) AttackGroup : Target CONTROLLABLE.
* <u>Number</u> Priority : All en-route tasks have the priority parameter. This is a number (less value - higher priority) that determines actions related to what task will be performed first.
* <u>Number</u> WeaponType : Bitmask of weapon types those allowed to use. If parameter is not defined that means no limits on weapon usage.
* [AI.Task.Designation](#ai.task.designation-class-) Designation : (optional) Designation type.
* <u>Boolean</u> Datalink : (optional) Allows to use datalink to send the target information to attack aircraft. Enabled by default.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:EnRouteTaskFAC(Radius, Priority)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Distance](#distance-class-) Radius :  The maximal distance from the FAC to a target.
* <u>Number</u> Priority : All en-route tasks have the priority parameter. This is a number (less value - higher priority) that determines actions related to what task will be performed first.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskEmbarking(Point, Duration, EmbarkingControllable)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Point : The point where to wait.
* <u>Number</u> Duration : The duration in seconds to wait.
* [CONTROLLABLE](#controllable-class-)
EmbarkingControllable : The controllable to be embarked.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure


### CONTROLLABLE:TaskEmbarkToTransport(Point, Radius)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec2](#vec2-class-) Point : The point where to wait.
* <u>Number</u> Radius : The radius of the embarking zone around the Point.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task  The DCS task structure.


### CONTROLLABLE:TaskMission(TaskMission)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>List[]</u> TaskMission : A table containing the mission task.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:TaskRoute(Points)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>List[]</u> Points : A table of route points.

<h4> Returns </h4>
* Dcs.DCSTasking.Task#Task 


### CONTROLLABLE:RouteToVec2(Point, Speed)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec3](#vec3-class-) Point : The destination point in Vec3 format.
* <u>Number</u> Speed : The speed to travel.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:RouteToVec3(Point, Speed)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [Vec3](#vec3-class-) Point : The destination point in Vec3 format.
* <u>Number</u> Speed : The speed to travel.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:Route(GoPoints)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>List[]</u> GoPoints : A table of Route Points.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:TaskRouteToZone(Zone, Randomize, Speed, Formation)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* [ZONE](#zone-class-) Zone : The zone where to route to.
* <u>Boolean</u> Randomize : Defines whether to target point gets randomized within the Zone.
* <u>Number</u> Speed : The speed.
* [FORMATION](#formation-class-) Formation : The formation string.

<h4> Returns </h4>

### CONTROLLABLE:CommandDoScript(DoScript)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>String</u> DoScript

<h4> Returns </h4>
* #DCSCommand 


### CONTROLLABLE:GetTaskMission()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The MissionTemplate


### CONTROLLABLE:GetTaskRoute()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The mission route defined by points.


### CONTROLLABLE:CopyRoute(Begin, End, Randomize, Radius)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Number</u> Begin : The route point from where the copy will start. The base route point is 0.
* <u>Number</u> End : The route point where the copy will end. The End point is the last point - the End point. The last point has base 0.
* <u>Boolean</u> Randomize : Randomization of the route, when true.
* <u>Number</u> Radius : When randomization is on, the randomization is within the radius.

<h4> Returns </h4>

### CONTROLLABLE:GetDetectedTargets(DetectVisual, DetectOptical, DetectRadar, DetectIRST, DetectRWR, DetectDLINK)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-) self
* <u>Boolean</u> DetectVisual : (optional)
* <u>Boolean</u> DetectOptical : (optional)
* <u>Boolean</u> DetectRadar : (optional)
* <u>Boolean</u> DetectIRST : (optional)
* <u>Boolean</u> DetectRWR : (optional)
* <u>Boolean</u> DetectDLINK : (optional)

<h4> Returns </h4>
* <u>List[]</u> 


### CONTROLLABLE:OptionROEHoldFirePossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROEHoldFire()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-) self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-) 


### CONTROLLABLE:OptionROEReturnFirePossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROEReturnFire()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:OptionROEOpenFirePossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROEOpenFire()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:OptionROEWeaponFreePossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROEWeaponFree()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:OptionROTNoReactionPossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROTNoReaction()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:OptionROTPassiveDefensePossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROTPassiveDefense()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:OptionROTEvadeFirePossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROTEvadeFire()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:OptionROTVerticalPossible()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### CONTROLLABLE:OptionROTVertical()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:WayPointInitialize(WayPoints)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>List[]</u> WayPoints : If WayPoints is given, then use the route.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:GetWayPoints()

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  WayPoints If WayPoints is given, then return the WayPoints structure.


### CONTROLLABLE:WayPointFunction(WayPoint, WayPointIndex, WayPointFunction)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Number</u> WayPoint : The waypoint number. Note that the start waypoint on the route is WayPoint 1!
* <u>Number</u> WayPointIndex : When defining multiple WayPoint functions for one WayPoint, use WayPointIndex to set the sequence of actions.
* <u>Function()</u> WayPointFunction : The waypoint function to be called when the controllable moves over the waypoint. The waypoint function takes variable parameters.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



### CONTROLLABLE:WayPointExecute(WayPoint, WaitTime)

<h4> Parameters </h4>
* [CONTROLLABLE](#controllable-class-)
self
* <u>Number</u> WayPoint : The WayPoint from where to execute the mission.
* <u>Number</u> WaitTime : The amount seconds to wait before initiating the mission.

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-)



