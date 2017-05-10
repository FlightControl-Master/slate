# AI.AI_BAI Module
**AI** -- **Provide Battlefield Air Interdiction (bombing).**

![Banner Image](/includes/Pictures/AI_BAI/Dia1.JPG)



AI_BAI classes makes AI Controllables execute bombing tasks.

There are the following types of BAI classes defined:

* [AI_BAI_ZONE](#ai_bai_zone-class-): Perform a BAI in a zone.



#####  Demo Missions

#####  [AI_BAI Demo Missions source code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/BOMB%20-%20Close%20Air%20Support)

#####  [AI_BAI Demo Missions, only for beta testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/BOMB%20-%20Close%20Air%20Support)

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [AI_BAI YouTube Channel](https://www.youtube.com/playlist?list=PL7ZUrU4zZUl3JBO1WDqqpyYRRmIkR2ir2)



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-01-15: Initial class and API.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **[Gunterlund](http://forums.eagle.ru:8080/member.php?u=75036)**: Test case revision.

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## AI_BAI_ZONE Class
<pre>
Inheritance : The AI_BAI_ZONE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- AI_PATROL_ZONE
				`-- AI_BAI_ZONE
</pre>

AI_BAI_ZONE derives from the [AI_PATROL_ZONE](#ai_patrol_zone-class-), inheriting its methods and behaviour.

The AI_BAI_ZONE class implements the core functions to provide BattleGround Air Interdiction in an Engage [Zone](#zone-module-) by an AIR [Controllable](#controllable-module-) or [Group](#group-module-).
The AI_BAI_ZONE runs a process. It holds an AI in a Patrol Zone and when the AI is commanded to engage, it will fly to an Engage Zone.

![HoldAndEngage](/includes/Pictures/AI_BAI/Dia3.JPG)

The AI_BAI_ZONE is assigned a [Group](#group-module-) and this must be done before the AI_BAI_ZONE process can be started through the **Start** event.

![Start Event](/includes/Pictures/AI_BAI/Dia4.JPG)

Upon started, The AI will **Route** itself towards the random 3D point within a patrol zone,
using a random speed within the given altitude and speed limits.
Upon arrival at the 3D point, a new random 3D point will be selected within the patrol zone using the given limits.
This cycle will continue until a fuel or damage treshold has been reached by the AI, or when the AI is commanded to RTB.

![Route Event](/includes/Pictures/AI_BAI/Dia5.JPG)

When the AI is commanded to provide BattleGround Air Interdiction (through the event **Engage**), the AI will fly towards the Engage Zone.
Any target that is detected in the Engage Zone will be reported and will be destroyed by the AI.

![Engage Event](/includes/Pictures/AI_BAI/Dia6.JPG)

The AI will detect the targets and will only destroy the targets within the Engage Zone.

![Engage Event](/includes/Pictures/AI_BAI/Dia7.JPG)

Every target that is destroyed, is reported< by the AI.

![Engage Event](/includes/Pictures/AI_BAI/Dia8.JPG)

Note that the AI does not know when the Engage Zone is cleared, and therefore will keep circling in the zone.

![Engage Event](/includes/Pictures/AI_BAI/Dia9.JPG)

Until it is notified through the event **Accomplish**, which is to be triggered by an observing party:

* a FAC
* a timed event
* a menu option selected by a human
* a condition
* others ...

![Engage Event](/includes/Pictures/AI_BAI/Dia10.JPG)

When the AI has accomplished the Bombing, it will fly back to the Patrol Zone.

![Engage Event](/includes/Pictures/AI_BAI/Dia11.JPG)

It will keep patrolling there, until it is notified to RTB or move to another BOMB Zone.
It can be notified to go RTB through the **RTB** event.

When the fuel treshold has been reached, the airplane will fly towards the nearest friendly airbase and will land.

![Engage Event](/includes/Pictures/AI_BAI/Dia12.JPG)

#####  1. AI_BAI_ZONE constructor

* [AI_BAI_ZONE:New()](#ai_bai_zone-new-patrolzone-patrolflooraltitude-patrolceilingaltitude-self-self-engagezone-patrolalttype): Creates a new AI_BAI_ZONE object.

#####  2. AI_BAI_ZONE is a FSM

![Process](/includes/Pictures/AI_BAI/Dia2.JPG)

#####  2.1. AI_BAI_ZONE States

* **None** ( Group ): The process is not started yet.
* **Patrolling** ( Group ): The AI is patrolling the Patrol Zone.
* **Engaging** ( Group ): The AI is engaging the targets in the Engage Zone, executing BOMB.
* **Returning** ( Group ): The AI is returning to Base..

#####  2.2. AI_BAI_ZONE Events

* **AI_PATROL_ZONE-Start-**: Start the process.
* **AI_PATROL_ZONE-Route-**: Route the AI to a new random 3D point within the Patrol Zone.
* **[AI_BAI_ZONE:Engage()](#ai_bai_zone-engage-engagespeed-engagealtitude-engageweaponexpend-engageattackqty-engagedirection)**: Engage the AI to provide BOMB in the Engage Zone, destroying any target it finds.
* **AI_BAI_ZONE-Abort-**: Aborts the engagement and return patrolling in the patrol zone.
* **AI_PATROL_ZONE-RTB-**: Route the AI to the home base.
* **AI_PATROL_ZONE-Detect-**: The AI is detecting targets.
* **AI_PATROL_ZONE-Detected-**: The AI has detected new targets.
* **AI_BAI_ZONE-Destroy-**: The AI has destroyed a target [Unit](#unit-module-).
* **AI_BAI_ZONE-Destroyed-**: The AI has destroyed all target [Unit](#unit-module-)s assigned in the BOMB task.
* **Status**: The AI is checking status (fuel and damage). When the tresholds have been reached, the AI will RTB.

#####  3. Modify the Engage Zone behaviour to pinpoint a **map object** or **scenery object**

Use the method AI_BAI_ZONE-SearchOff- to specify that the EngageZone is not to be searched for potential targets (UNITs), but that the center of the zone
is the point where a map object is to be destroyed (like a bridge).

Example:

-- Tell the BAI not to search for potential targets in the BAIEngagementZone, but rather use the center of the BAIEngagementZone as the bombing location.
AIBAIZone:SearchOff()

Searching can be switched back on with the method AI_BAI_ZONE-SearchOn-. Use the method AI_BAI_ZONE-SearchOnOff- to flexibily switch searching on or off.




AI_BAI_ZONE class

<h4> Attributes </h4>

* [CONTROLLABLE](#controllable-class-) AIControllable : The [Controllable](#controllable-module-) patrolling.
* [ZONE_BASE](#zone_base-class-) TargetZone : The [Zone](#zone-module-) where the patrol needs to be executed.


### AI_BAI_ZONE:New(PatrolZone, PatrolFloorAltitude, PatrolCeilingAltitude, self, self, EngageZone, PatrolAltType)
Creates a new AI_BAI_ZONE object

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [ZONE_BASE](#zone_base-class-) PatrolZone : The [Zone](#zone-module-) where the patrol needs to be executed.
* [Altitude](#altitude-class-) PatrolFloorAltitude : The lowest altitude in meters where to execute the patrol.
* [Altitude](#altitude-class-) PatrolCeilingAltitude : The highest altitude in meters where to execute the patrol.
* [Speed](#speed-class-) self : PatrolMinSpeed The minimum speed of the [Controllable](#controllable-module-) in km/h.
* [Speed](#speed-class-) self : PatrolMaxSpeed The maximum speed of the [Controllable](#controllable-module-) in km/h.
* [ZONE_BASE](#zone_base-class-) EngageZone : The zone where the engage will happen.
* [AltitudeType](#altitudetype-class-) PatrolAltType : The altitude type ("RADIO"=="AGL", "BARO"=="ASL"). Defaults to RADIO

<h4> Returns </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)



### AI_BAI_ZONE:OnBeforeEngage(Controllable, From, Event, To)
OnBefore Transition Handler for Event Engage.
@function [parent=#AI_BAI_ZONE] OnBeforeEngage

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:OnAfterEngage(Controllable, From, Event, To)
OnAfter Transition Handler for Event Engage.
@function [parent=#AI_BAI_ZONE] OnAfterEngage

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:Engage(EngageSpeed, EngageAltitude, EngageWeaponExpend, EngageAttackQty, EngageDirection)
Synchronous Event Trigger for Event Engage.
@function [parent=#AI_BAI_ZONE] Engage

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* <u>Number</u> EngageSpeed : (optional) The speed the Group will hold when engaging to the target zone.
* [Distance](#distance-class-) EngageAltitude : (optional) Desired altitude to perform the unit engagement.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class-) EngageWeaponExpend : (optional) Determines how much weapon will be released at each attack.
* <u>Number</u> EngageAttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class-) EngageDirection : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.

<h4> Returns </h4>

### AI_BAI_ZONE:OnLeaveEngaging(Controllable, From, Event, To)
OnLeave Transition Handler for State Engaging.
@function [parent=#AI_BAI_ZONE] OnLeaveEngaging

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_BAI_ZONE:OnEnterEngaging(Controllable, From, Event, To)
OnEnter Transition Handler for State Engaging.
@function [parent=#AI_BAI_ZONE] OnEnterEngaging

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:OnBeforeFired(Controllable, From, Event, To)
OnBefore Transition Handler for Event Fired.
@function [parent=#AI_BAI_ZONE] OnBeforeFired

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_BAI_ZONE:OnAfterFired(Controllable, From, Event, To)
OnAfter Transition Handler for Event Fired.
@function [parent=#AI_BAI_ZONE] OnAfterFired

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:Fired()
Synchronous Event Trigger for Event Fired.
@function [parent=#AI_BAI_ZONE] Fired

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>

### AI_BAI_ZONE:OnBeforeDestroy(Controllable, From, Event, To)
OnBefore Transition Handler for Event Destroy.
@function [parent=#AI_BAI_ZONE] OnBeforeDestroy

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_BAI_ZONE:OnAfterDestroy(Controllable, From, Event, To)
OnAfter Transition Handler for Event Destroy.
@function [parent=#AI_BAI_ZONE] OnAfterDestroy

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:Destroy()
Synchronous Event Trigger for Event Destroy.
@function [parent=#AI_BAI_ZONE] Destroy

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>

### AI_BAI_ZONE:OnBeforeAbort(Controllable, From, Event, To)
OnBefore Transition Handler for Event Abort.
@function [parent=#AI_BAI_ZONE] OnBeforeAbort

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_BAI_ZONE:OnAfterAbort(Controllable, From, Event, To)
OnAfter Transition Handler for Event Abort.
@function [parent=#AI_BAI_ZONE] OnAfterAbort

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:Abort()
Synchronous Event Trigger for Event Abort.
@function [parent=#AI_BAI_ZONE] Abort

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>

### AI_BAI_ZONE:OnBeforeAccomplish(Controllable, From, Event, To)
OnBefore Transition Handler for Event Accomplish.
@function [parent=#AI_BAI_ZONE] OnBeforeAccomplish

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_BAI_ZONE:OnAfterAccomplish(Controllable, From, Event, To)
OnAfter Transition Handler for Event Accomplish.
@function [parent=#AI_BAI_ZONE] OnAfterAccomplish

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:Accomplish()
Synchronous Event Trigger for Event Accomplish.
@function [parent=#AI_BAI_ZONE] Accomplish

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>

### AI_BAI_ZONE:SetEngageZone(EngageZone)
Set the Engage Zone where the AI is performing BOMB. Note that if the EngageZone is changed, the AI needs to re-detect targets.

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [ZONE](#zone-class-) EngageZone : The zone where the AI is performing BOMB.

<h4> Returns </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)



### AI_BAI_ZONE:SearchOnOff()
Specifies whether to search for potential targets in the zone, or let the center of the zone be the bombing coordinate.
AI_BAI_ZONE will search for potential targets by default.

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)



### AI_BAI_ZONE:SearchOff()
If Search is Off, the current zone coordinate will be the center of the bombing.

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)



### AI_BAI_ZONE:SearchOn()
If Search is On, BAI will search for potential targets in the zone.

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self

<h4> Returns </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)



### AI_BAI_ZONE:onafterStart(Controllable, From, Event, To)
onafter State Transition for Event Start.

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:onbeforeEngage(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:onafterTarget(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:onafterAbort(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:onafterAccomplish(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_BAI_ZONE:onafterDestroy(Controllable, From, Event, To, EventData)

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### AI_BAI_ZONE:OnEventDead(EventData)

<h4> Parameters </h4>
* [AI_BAI_ZONE](#ai_bai_zone-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

