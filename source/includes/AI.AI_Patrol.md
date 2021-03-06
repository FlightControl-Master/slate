# AI.AI_Patrol Module
**AI** -- **Air Patrolling or Staging.**

![Banner Image](/includes/Pictures/AI_PATROL/Dia1.JPG)



AI PATROL classes makes AI Controllables execute an Patrol.

There are the following types of PATROL classes defined:

* [AI_PATROL_ZONE](#ai_patrol_zone-class-): Perform a PATROL in a zone.



#####  Demo Missions

#####  [AI_PATROL Demo Missions source code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/PAT%20-%20Patrolling)

#####  [AI_PATROL Demo Missions, only for beta testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/PAT%20-%20Patrolling)

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [AI_PATROL YouTube Channel](https://www.youtube.com/playlist?list=PL7ZUrU4zZUl35HvYZKA6G22WMt7iI3zky)



#####  **OPEN ISSUES**

2017-01-17: When Spawned AI is located at an airbase, it will be routed first back to the airbase after take-off.

2016-01-17:
-- Fixed problem with AI returning to base too early and unexpected.
-- ReSpawning of AI will reset the AI_PATROL and derived classes.
-- Checked the correct workings of SCHEDULER, and it DOES work correctly.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-01-17: Rename of class: **AI\_PATROL\_ZONE** is the new name for the old _AI\_PATROLZONE_.

2017-01-15: Complete revision. AI_PATROL_ZONE is the base class for other AI_PATROL like classes.

2016-09-01: Initial class and API.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **[Dutch_Baron](https://forums.eagle.ru/member.php?u=112075)**: Working together with James has resulted in the creation of the AI_BALANCER class. James has shared his ideas on balancing AI with air units, and together we made a first design which you can use now :-)
* **[Pikey](https://forums.eagle.ru/member.php?u=62835)**: Testing and API concept review.

#####  Authors:

* **FlightControl**: Design & Programming.

## AI_PATROL_ZONE Class
<pre>
Inheritance : The AI_PATROL_ZONE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- AI_PATROL_ZONE
</pre>

The AI_PATROL_ZONE class implements the core functions to patrol a [Zone](#zone-module-) by an AI [Controllable](#controllable-module-) or [Group](#group-module-).

![Process](/includes/Pictures/AI_PATROL/Dia3.JPG)

The AI_PATROL_ZONE is assigned a [Group](#group-module-) and this must be done before the AI_PATROL_ZONE process can be started using the **Start** event.

![Process](/includes/Pictures/AI_PATROL/Dia4.JPG)

The AI will fly towards the random 3D point within the patrol zone, using a random speed within the given altitude and speed limits.
Upon arrival at the 3D point, a new random 3D point will be selected within the patrol zone using the given limits.

![Process](/includes/Pictures/AI_PATROL/Dia5.JPG)

This cycle will continue.

![Process](/includes/Pictures/AI_PATROL/Dia6.JPG)

During the patrol, the AI will detect enemy targets, which are reported through the **Detected** event.

![Process](/includes/Pictures/AI_PATROL/Dia9.JPG)

-- Note that the enemy is not engaged! To model enemy engagement, either tailor the **Detected** event, or
use derived AI_ classes to model AI offensive or defensive behaviour.

![Process](/includes/Pictures/AI_PATROL/Dia10.JPG)

Until a fuel or damage treshold has been reached by the AI, or when the AI is commanded to RTB.
When the fuel treshold has been reached, the airplane will fly towards the nearest friendly airbase and will land.

![Process](/includes/Pictures/AI_PATROL/Dia11.JPG)

#####  1. AI_PATROL_ZONE constructor

* [AI_PATROL_ZONE:New()](#ai_patrol_zone-new-patrolzone-patrolflooraltitude-patrolceilingaltitude-self-self-patrolalttype): Creates a new AI_PATROL_ZONE object.

#####  2. AI_PATROL_ZONE is a FSM

![Process](/includes/Pictures/AI_PATROL/Dia2.JPG)

#####  2.1. AI_PATROL_ZONE States

* **None** ( Group ): The process is not started yet.
* **Patrolling** ( Group ): The AI is patrolling the Patrol Zone.
* **Returning** ( Group ): The AI is returning to Base.
* **Stopped** ( Group ): The process is stopped.
* **Crashed** ( Group ): The AI has crashed or is dead.

#####  2.2. AI_PATROL_ZONE Events

* **Start** ( Group ): Start the process.
* **Stop** ( Group ): Stop the process.
* **Route** ( Group ): Route the AI to a new random 3D point within the Patrol Zone.
* **RTB** ( Group ): Route the AI to the home base.
* **Detect** ( Group ): The AI is detecting targets.
* **Detected** ( Group ): The AI has detected new targets.
* **Status** ( Group ): The AI is checking status (fuel and damage). When the tresholds have been reached, the AI will RTB.

#####  3. Set or Get the AI controllable

* AI_PATROL_ZONE-SetControllable-: Set the AIControllable.
* AI_PATROL_ZONE-GetControllable-: Get the AIControllable.

#####  4. Set the Speed and Altitude boundaries of the AI controllable

* [AI_PATROL_ZONE:SetSpeed()](#ai_patrol_zone-setspeed-self-self): Set the patrol speed boundaries of the AI, for the next patrol.
* [AI_PATROL_ZONE:SetAltitude()](#ai_patrol_zone-setaltitude-patrolflooraltitude-patrolceilingaltitude): Set altitude boundaries of the AI, for the next patrol.

#####  5. Manage the detection process of the AI controllable

The detection process of the AI controllable can be manipulated.
Detection requires an amount of CPU power, which has an impact on your mission performance.
Only put detection on when absolutely necessary, and the frequency of the detection can also be set.

* AI_PATROL_ZONE-SetDetectionOn-: Set the detection on. The AI will detect for targets.
* AI_PATROL_ZONE-SetDetectionOff-: Set the detection off, the AI will not detect for targets. The existing target list will NOT be erased.

The detection frequency can be set with [AI_PATROL_ZONE:SetDetectionInterval()](#ai_patrol_zone-setdetectioninterval-seconds) seconds ), where the amount of seconds specify how much seconds will be waited before the next detection.
Use the method AI_PATROL_ZONE-GetDetectedUnits- to obtain a list of the [Unit](#unit-module-)s detected by the AI.

The detection can be filtered to potential targets in a specific zone.
Use the method [AI_PATROL_ZONE:SetDetectionZone()](#ai_patrol_zone-setdetectionzone-detectionzone) to set the zone where targets need to be detected.
Note that when the zone is too far away, or the AI is not heading towards the zone, or the AI is too high, no targets may be detected
according the weather conditions.

#####  6. Manage the "out of fuel" in the AI_PATROL_ZONE

When the AI is out of fuel, it is required that a new AI is started, before the old AI can return to the home base.
Therefore, with a parameter and a calculation of the distance to the home base, the fuel treshold is calculated.
When the fuel treshold is reached, the AI will continue for a given time its patrol task in orbit,
while a new AI is targetted to the AI_PATROL_ZONE.
Once the time is finished, the old AI will return to the base.
Use the method [AI_PATROL_ZONE:ManageFuel()](#ai_patrol_zone-managefuel-patrolfueltresholdpercentage-patroloutoffuelorbittime) to have this proces in place.

#####  7. Manage "damage" behaviour of the AI in the AI_PATROL_ZONE

When the AI is damaged, it is required that a new AIControllable is started. However, damage cannon be foreseen early on.
Therefore, when the damage treshold is reached, the AI will return immediately to the home base (RTB).
Use the method [AI_PATROL_ZONE:ManageDamage()](#ai_patrol_zone-managedamage-patroldamagetreshold) to have this proces in place.




AI_PATROL_ZONE class

<h4> Attributes </h4>

* [CONTROLLABLE](#controllable-class-) AIControllable : The [Controllable](#controllable-module-) patrolling.
* [ZONE_BASE](#zone_base-class-) PatrolZone : The [Zone](#zone-module-) where the patrol needs to be executed.
* [Altitude](#altitude-class-) PatrolFloorAltitude : The lowest altitude in meters where to execute the patrol.
* [Altitude](#altitude-class-) PatrolCeilingAltitude : The highest altitude in meters where to execute the patrol.
* [Speed](#speed-class-) self : PatrolMinSpeed The minimum speed of the [Controllable](#controllable-module-) in km/h.
* [Speed](#speed-class-) self : PatrolMaxSpeed The maximum speed of the [Controllable](#controllable-module-) in km/h.
* [SPAWN](#spawn-class-) CoordTest


### AI_PATROL_ZONE:New(PatrolZone, PatrolFloorAltitude, PatrolCeilingAltitude, self, self, PatrolAltType)
``` lua
-- Define a new AI_PATROL_ZONE Object. This PatrolArea will patrol an AIControllable within PatrolZone between 3000 and 6000 meters, with a variying speed between 600 and 900 km/h.
PatrolZone = ZONE:New( 'PatrolZone' )
PatrolSpawn = SPAWN:New( 'Patrol Group' )
PatrolArea = AI_PATROL_ZONE:New( PatrolZone, 3000, 6000, 600, 900 )
```
Creates a new AI_PATROL_ZONE object

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [ZONE_BASE](#zone_base-class-) PatrolZone : The [Zone](#zone-module-) where the patrol needs to be executed.
* [Altitude](#altitude-class-) PatrolFloorAltitude : The lowest altitude in meters where to execute the patrol.
* [Altitude](#altitude-class-) PatrolCeilingAltitude : The highest altitude in meters where to execute the patrol.
* [Speed](#speed-class-) self : PatrolMinSpeed The minimum speed of the [Controllable](#controllable-module-) in km/h.
* [Speed](#speed-class-) self : PatrolMaxSpeed The maximum speed of the [Controllable](#controllable-module-) in km/h.
* [AltitudeType](#altitudetype-class-) PatrolAltType : The altitude type ("RADIO"=="AGL", "BARO"=="ASL"). Defaults to RADIO

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:OnLeaveStopped(Controllable, From, Event, To)
OnLeave Transition Handler for State Stopped.
@function [parent=#AI_PATROL_ZONE] OnLeaveStopped

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnEnterStopped(Controllable, From, Event, To)
OnEnter Transition Handler for State Stopped.
@function [parent=#AI_PATROL_ZONE] OnEnterStopped

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeStop(Controllable, From, Event, To)
OnBefore Transition Handler for Event Stop.
@function [parent=#AI_PATROL_ZONE] OnBeforeStop

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterStop(Controllable, From, Event, To)
OnAfter Transition Handler for Event Stop.
@function [parent=#AI_PATROL_ZONE] OnAfterStop

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:Stop()
Synchronous Event Trigger for Event Stop.
@function [parent=#AI_PATROL_ZONE] Stop

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeStart(Controllable, From, Event, To)
OnBefore Transition Handler for Event Start.
@function [parent=#AI_PATROL_ZONE] OnBeforeStart

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterStart(Controllable, From, Event, To)
OnAfter Transition Handler for Event Start.
@function [parent=#AI_PATROL_ZONE] OnAfterStart

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:Start()
Synchronous Event Trigger for Event Start.
@function [parent=#AI_PATROL_ZONE] Start

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnLeavePatrolling(Controllable, From, Event, To)
OnLeave Transition Handler for State Patrolling.
@function [parent=#AI_PATROL_ZONE] OnLeavePatrolling

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnEnterPatrolling(Controllable, From, Event, To)
OnEnter Transition Handler for State Patrolling.
@function [parent=#AI_PATROL_ZONE] OnEnterPatrolling

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeRoute(Controllable, From, Event, To)
OnBefore Transition Handler for Event Route.
@function [parent=#AI_PATROL_ZONE] OnBeforeRoute

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterRoute(Controllable, From, Event, To)
OnAfter Transition Handler for Event Route.
@function [parent=#AI_PATROL_ZONE] OnAfterRoute

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:Route()
Synchronous Event Trigger for Event Route.
@function [parent=#AI_PATROL_ZONE] Route

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeStatus(Controllable, From, Event, To)
OnBefore Transition Handler for Event Status.
@function [parent=#AI_PATROL_ZONE] OnBeforeStatus

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterStatus(Controllable, From, Event, To)
OnAfter Transition Handler for Event Status.
@function [parent=#AI_PATROL_ZONE] OnAfterStatus

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:Status()
Synchronous Event Trigger for Event Status.
@function [parent=#AI_PATROL_ZONE] Status

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeDetect(Controllable, From, Event, To)
OnBefore Transition Handler for Event Detect.
@function [parent=#AI_PATROL_ZONE] OnBeforeDetect

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterDetect(Controllable, From, Event, To)
OnAfter Transition Handler for Event Detect.
@function [parent=#AI_PATROL_ZONE] OnAfterDetect

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:Detect()
Synchronous Event Trigger for Event Detect.
@function [parent=#AI_PATROL_ZONE] Detect

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeDetected(Controllable, From, Event, To)
OnBefore Transition Handler for Event Detected.
@function [parent=#AI_PATROL_ZONE] OnBeforeDetected

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterDetected(Controllable, From, Event, To)
OnAfter Transition Handler for Event Detected.
@function [parent=#AI_PATROL_ZONE] OnAfterDetected

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:Detected()
Synchronous Event Trigger for Event Detected.
@function [parent=#AI_PATROL_ZONE] Detected

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnBeforeRTB(Controllable, From, Event, To)
OnBefore Transition Handler for Event RTB.
@function [parent=#AI_PATROL_ZONE] OnBeforeRTB

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnAfterRTB(Controllable, From, Event, To)
OnAfter Transition Handler for Event RTB.
@function [parent=#AI_PATROL_ZONE] OnAfterRTB

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:RTB()
Synchronous Event Trigger for Event RTB.
@function [parent=#AI_PATROL_ZONE] RTB

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnLeaveReturning(Controllable, From, Event, To)
OnLeave Transition Handler for State Returning.
@function [parent=#AI_PATROL_ZONE] OnLeaveReturning

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_PATROL_ZONE:OnEnterReturning(Controllable, From, Event, To)
OnEnter Transition Handler for State Returning.
@function [parent=#AI_PATROL_ZONE] OnEnterReturning

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:SetSpeed(self, self)
Sets (modifies) the minimum and maximum speed of the patrol.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [Speed](#speed-class-) self : PatrolMinSpeed The minimum speed of the [Controllable](#controllable-module-) in km/h.
* [Speed](#speed-class-) self : PatrolMaxSpeed The maximum speed of the [Controllable](#controllable-module-) in km/h.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetAltitude(PatrolFloorAltitude, PatrolCeilingAltitude)
Sets the floor and ceiling altitude of the patrol.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [Altitude](#altitude-class-) PatrolFloorAltitude : The lowest altitude in meters where to execute the patrol.
* [Altitude](#altitude-class-) PatrolCeilingAltitude : The highest altitude in meters where to execute the patrol.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetDetectionOn()
Set the detection on. The AI will detect for targets.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetDetectionOff()
Set the detection off. The AI will NOT detect for targets.
However, the list of already detected targets will be kept and can be enquired!

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetStatusOff()
Set the status checking off.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetDetectionActivated()
Activate the detection. The AI will detect for targets if the Detection is switched On.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetDetectionDeactivated()
Deactivate the detection. The AI will NOT detect for targets.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetDetectionInterval(Seconds)
Set the interval in seconds between each detection executed by the AI.
The list of already detected targets will be kept and updated.
Newly detected targets will be added, but already detected targets that were
not detected in this cycle, will NOT be removed!
The default interval is 30 seconds.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* <u>Number</u> Seconds : The interval in seconds.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:SetDetectionZone(DetectionZone)
Set the detection zone where the AI is detecting targets.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [ZONE](#zone-class-) DetectionZone : The zone where to detect targets.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:GetDetectedUnits()
Gets a list of [UNIT](#unit-class-)s that were detected by the AI.
No filtering is applied, so, ANY detected UNIT can be in this list.
It is up to the mission designer to use the [Unit](#unit-module-) class and methods to filter the targets.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>
* <u>List[]</u>  The list of [UNIT](#unit-class-)s


### AI_PATROL_ZONE:ClearDetectedUnits()
Clears the list of [UNIT](#unit-class-)s that were detected by the AI.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:ManageFuel(PatrolFuelTresholdPercentage, PatrolOutOfFuelOrbitTime)
When the AI is out of fuel, it is required that a new AI is started, before the old AI can return to the home base.
Therefore, with a parameter and a calculation of the distance to the home base, the fuel treshold is calculated.
When the fuel treshold is reached, the AI will continue for a given time its patrol task in orbit, while a new AIControllable is targetted to the AI_PATROL_ZONE.
Once the time is finished, the old AI will return to the base.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* <u>Number</u> PatrolFuelTresholdPercentage : The treshold in percentage (between 0 and 1) when the AIControllable is considered to get out of fuel.
* <u>Number</u> PatrolOutOfFuelOrbitTime : The amount of seconds the out of fuel AIControllable will orbit before returning to the base.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:ManageDamage(PatrolDamageTreshold)
When the AI is damaged beyond a certain treshold, it is required that the AI returns to the home base.
However, damage cannot be foreseen early on.
Therefore, when the damage treshold is reached,
the AI will return immediately to the home base (RTB).
Note that for groups, the average damage of the complete group will be calculated.
So, in a group of 4 airplanes, 2 lost and 2 with damage 0.2, the damage treshold will be 0.25.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* <u>Number</u> PatrolDamageTreshold : The treshold in percentage (between 0 and 1) when the AI is considered to be damaged.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:onafterStart(Controllable, From, Event, To)
Defines a new patrol route using the [Process_PatrolZone](#process_patrolzone-module-) parameters and settings.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)



### AI_PATROL_ZONE:onbeforeDetect(Controllable)

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable

<h4> Returns </h4>

### AI_PATROL_ZONE:onafterDetect(Controllable)

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable

<h4> Returns </h4>

### AI_PATROL_ZONE:onafterRoute(Controllable, From, Event, To)
Defines a new patrol route using the [Process_PatrolZone](#process_patrolzone-module-) parameters and settings.

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_PATROL_ZONE:onbeforeStatus()

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:onafterStatus()

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:onafterRTB()

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:onafterDead()

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self

<h4> Returns </h4>

### AI_PATROL_ZONE:OnCrash(EventData)

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### AI_PATROL_ZONE:OnEjection(EventData)

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### AI_PATROL_ZONE:OnPilotDead(EventData)

<h4> Parameters </h4>
* [AI_PATROL_ZONE](#ai_patrol_zone-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

