# AI.AI_Cas Module
**AI** -- **Provide Close Air Support to friendly ground troops.**

![Banner Image](/includes/Pictures/AI_CAS/Dia1.JPG)



AI CAS classes makes AI Controllables execute a Close Air Support.

There are the following types of CAS classes defined:

* [AI_CAS_ZONE](#ai_cas_zone-class): Perform a CAS in a zone.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-01-15: Initial class and API.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **[Quax](https://forums.eagle.ru/member.php?u=90530)**: Concept, Advice & Testing.
* **[Pikey](https://forums.eagle.ru/member.php?u=62835)**: Concept, Advice & Testing.
* **[Gunterlund](http://forums.eagle.ru:8080/member.php?u=75036)**: Test case revision.

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## AI_CAS_ZONE Class
<pre>
Inheritance : The AI_CAS_ZONE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- AI_PATROL_ZONE
				`-- AI_CAS_ZONE
</pre>

[AI_CAS_ZONE](#ai_cas_zone-class) derives from the [AI_PATROL_ZONE](#ai_patrol_zone-class), inheriting its methods and behaviour.

The [AI_CAS_ZONE](#ai_cas_zone-class) class implements the core functions to provide Close Air Support in an Engage [Zone](#zone-module) by an AIR [Controllable](#controllable-module) or [Group](#group-module).
The AI_CAS_ZONE runs a process. It holds an AI in a Patrol Zone and when the AI is commanded to engage, it will fly to an Engage Zone.

![HoldAndEngage](/includes/Pictures/AI_CAS/Dia3.JPG)

The AI_CAS_ZONE is assigned a [Group](#group-module) and this must be done before the AI_CAS_ZONE process can be started through the **Start** event.

![Start Event](/includes/Pictures/AI_CAS/Dia4.JPG)

Upon started, The AI will **Route** itself towards the random 3D point within a patrol zone,
using a random speed within the given altitude and speed limits.
Upon arrival at the 3D point, a new random 3D point will be selected within the patrol zone using the given limits.
This cycle will continue until a fuel or damage treshold has been reached by the AI, or when the AI is commanded to RTB.

![Route Event](/includes/Pictures/AI_CAS/Dia5.JPG)

When the AI is commanded to provide Close Air Support (through the event **Engage**), the AI will fly towards the Engage Zone.
Any target that is detected in the Engage Zone will be reported and will be destroyed by the AI.

![Engage Event](/includes/Pictures/AI_CAS/Dia6.JPG)

The AI will detect the targets and will only destroy the targets within the Engage Zone.

![Engage Event](/includes/Pictures/AI_CAS/Dia7.JPG)

Every target that is destroyed, is reported< by the AI.

![Engage Event](/includes/Pictures/AI_CAS/Dia8.JPG)

Note that the AI does not know when the Engage Zone is cleared, and therefore will keep circling in the zone.

![Engage Event](/includes/Pictures/AI_CAS/Dia9.JPG)

Until it is notified through the event **Accomplish**, which is to be triggered by an observing party:

* a FAC
* a timed event
* a menu option selected by a human
* a condition
* others ...

![Engage Event](/includes/Pictures/AI_CAS/Dia10.JPG)

When the AI has accomplished the CAS, it will fly back to the Patrol Zone.

![Engage Event](/includes/Pictures/AI_CAS/Dia11.JPG)

It will keep patrolling there, until it is notified to RTB or move to another CAS Zone.
It can be notified to go RTB through the **RTB** event.

When the fuel treshold has been reached, the airplane will fly towards the nearest friendly airbase and will land.

![Engage Event](/includes/Pictures/AI_CAS/Dia12.JPG)

#####  1.1) AI_CAS_ZONE constructor

* [AI_CAS_ZONE:New()](#ai_cas_zone-new-patrolzone-patrolflooraltitude-patrolceilingaltitude-self-self-engagezone-patrolalttype): Creates a new AI_CAS_ZONE object.

#####  1.2) AI_CAS_ZONE is a FSM

![Process](/includes/Pictures/AI_CAS/Dia2.JPG)

#####  1.2.1) AI_CAS_ZONE States

* **None** ( Group ): The process is not started yet.
* **Patrolling** ( Group ): The AI is patrolling the Patrol Zone.
* **Engaging** ( Group ): The AI is engaging the targets in the Engage Zone, executing CAS.
* **Returning** ( Group ): The AI is returning to Base..

#####  1.2.2) AI_CAS_ZONE Events

* **[AI_PATROL_ZONE:Start()](#ai_patrol_zone-start)**: Start the process.
* **[AI_PATROL_ZONE:Route()](#ai_patrol_zone-route)**: Route the AI to a new random 3D point within the Patrol Zone.
* **[AI_CAS_ZONE:Engage()](#ai_cas_zone-engage-engagespeed-engagealtitude-engageweaponexpend-engageattackqty-engagedirection)**: Engage the AI to provide CAS in the Engage Zone, destroying any target it finds.
* **[AI_CAS_ZONE:Abort()](#ai_cas_zone-abort)**: Aborts the engagement and return patrolling in the patrol zone.
* **[AI_PATROL_ZONE:RTB()](#ai_patrol_zone-rtb)**: Route the AI to the home base.
* **[AI_PATROL_ZONE:Detect()](#ai_patrol_zone-detect)**: The AI is detecting targets.
* **[AI_PATROL_ZONE:Detected()](#ai_patrol_zone-detected)**: The AI has detected new targets.
* **[AI_CAS_ZONE:Destroy()](#ai_cas_zone-destroy)**: The AI has destroyed a target [Unit](#unit-module).
* **AI_CAS_ZONE-Destroyed**: The AI has destroyed all target [Unit](#unit-module)s assigned in the CAS task.
* **Status**: The AI is checking status (fuel and damage). When the tresholds have been reached, the AI will RTB.





AI_CAS_ZONE class

<h4> Attributes </h4>

* [CONTROLLABLE](#controllable-class) AIControllable : The [Controllable](#controllable-module) patrolling.
* [ZONE_BASE](#zone_base-class) TargetZone : The [Zone](#zone-module) where the patrol needs to be executed.


### AI_CAS_ZONE:New(PatrolZone, PatrolFloorAltitude, PatrolCeilingAltitude, self, self, EngageZone, PatrolAltType)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [ZONE_BASE](#zone_base-class) PatrolZone : The [Zone](#zone-module) where the patrol needs to be executed.
* [Altitude](#altitude-class) PatrolFloorAltitude : The lowest altitude in meters where to execute the patrol.
* [Altitude](#altitude-class) PatrolCeilingAltitude : The highest altitude in meters where to execute the patrol.
* [Speed](#speed-class) self : PatrolMinSpeed The minimum speed of the [Controllable](#controllable-module) in km/h.
* [Speed](#speed-class) self : PatrolMaxSpeed The maximum speed of the [Controllable](#controllable-module) in km/h.
* [ZONE_BASE](#zone_base-class) EngageZone : The zone where the engage will happen.
* [AltitudeType](#altitudetype-class) PatrolAltType : The altitude type ("RADIO"=="AGL", "BARO"=="ASL"). Defaults to RADIO

<h4> Returns </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self


### AI_CAS_ZONE:OnBeforeEngage(Controllable, From, Event, To)
OnBefore Transition Handler for Event Engage.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:OnAfterEngage(Controllable, From, Event, To)
OnAfter Transition Handler for Event Engage.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:Engage(EngageSpeed, EngageAltitude, EngageWeaponExpend, EngageAttackQty, EngageDirection)
Synchronous Event Trigger for Event Engage.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* <u>Number</u> EngageSpeed : (optional) The speed the Group will hold when engaging to the target zone.
* [Distance](#distance-class) EngageAltitude : (optional) Desired altitude to perform the unit engagement.
* [AI.Task.WeaponExpend](#ai.task.weaponexpend-class) EngageWeaponExpend : (optional) Determines how much weapon will be released at each attack.
* <u>Number</u> EngageAttackQty : (optional) This parameter limits maximal quantity of attack. The aicraft/controllable will not make more attack than allowed even if the target controllable not destroyed and the aicraft/controllable still have ammo. If not defined the aircraft/controllable will attack target until it will be destroyed or until the aircraft/controllable will run out of ammo.
* [Azimuth](#azimuth-class) EngageDirection : (optional) Desired ingress direction from the target to the attacking aircraft. Controllable/aircraft will make its attacks from the direction. Of course if there is no way to attack from the direction due the terrain controllable/aircraft will choose another direction.

<h4> Returns </h4>

### AI_CAS_ZONE:OnLeaveEngaging(Controllable, From, Event, To)
OnLeave Transition Handler for State Engaging.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### AI_CAS_ZONE:OnEnterEngaging(Controllable, From, Event, To)
OnEnter Transition Handler for State Engaging.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:OnBeforeFired(Controllable, From, Event, To)
OnBefore Transition Handler for Event Fired.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### AI_CAS_ZONE:OnAfterFired(Controllable, From, Event, To)
OnAfter Transition Handler for Event Fired.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:Fired()
Synchronous Event Trigger for Event Fired.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self

<h4> Returns </h4>

### AI_CAS_ZONE:OnBeforeDestroy(Controllable, From, Event, To)
OnBefore Transition Handler for Event Destroy.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### AI_CAS_ZONE:OnAfterDestroy(Controllable, From, Event, To)
OnAfter Transition Handler for Event Destroy.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:Destroy()
Synchronous Event Trigger for Event Destroy.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self

<h4> Returns </h4>

### AI_CAS_ZONE:OnBeforeAbort(Controllable, From, Event, To)
OnBefore Transition Handler for Event Abort.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### AI_CAS_ZONE:OnAfterAbort(Controllable, From, Event, To)
OnAfter Transition Handler for Event Abort.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:Abort()
Synchronous Event Trigger for Event Abort.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self

<h4> Returns </h4>

### AI_CAS_ZONE:OnBeforeAccomplish(Controllable, From, Event, To)
OnBefore Transition Handler for Event Accomplish.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### AI_CAS_ZONE:OnAfterAccomplish(Controllable, From, Event, To)
OnAfter Transition Handler for Event Accomplish.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:Accomplish()
Synchronous Event Trigger for Event Accomplish.

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self

<h4> Returns </h4>

### AI_CAS_ZONE:SetEngageZone(EngageZone)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [ZONE](#zone-class) EngageZone : The zone where the AI is performing CAS.

<h4> Returns </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self


### AI_CAS_ZONE:onafterStart(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:onbeforeEngage(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:onafterTarget(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:onafterAbort(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:onafterAccomplish(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAS_ZONE:onafterDestroy(Controllable, From, Event, To, EventData)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [CONTROLLABLE](#controllable-class) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [EVENTDATA](#eventdata-class) EventData

<h4> Returns </h4>

### AI_CAS_ZONE:OnEventDead(EventData)

<h4> Parameters </h4>
* [AI_CAS_ZONE](#ai_cas_zone-class)
self
* [EVENTDATA](#eventdata-class) EventData

<h4> Returns </h4>

