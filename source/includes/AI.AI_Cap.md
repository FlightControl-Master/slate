# AI.AI_Cap Module
**AI** - **Execute Combat Air Patrol (CAP).**

![Banner Image](/includes/Pictures/AI_CAP/Dia1.JPG)



AI CAP classes makes AI Controllables execute a Combat Air Patrol.

There are the following types of CAP classes defined:

* [AI_CAP_ZONE](#ai_cap_zone-class-): Perform a CAP in a zone.



#####  Demo Missions

#####  [AI_CAP Demo Missions source code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/CAP%20-%20Combat%20Air%20Patrol)

#####  [AI_CAP Demo Missions, only for beta testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/CAP%20-%20Combat%20Air%20Patrol)

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [AI_CAP YouTube Channel](https://www.youtube.com/playlist?list=PL7ZUrU4zZUl1YCyPxJgoZn-CfhwyeW65L)



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
* **[Whisper](http://forums.eagle.ru/member.php?u=3829): Testing.
* **[Delta99](https://forums.eagle.ru/member.php?u=125166): Testing.

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## AI_CAP_ZONE Class
<pre>
Inheritance : The AI_CAP_ZONE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- AI_PATROL_ZONE
				`-- AI_CAP_ZONE
</pre>

The AI_CAP_ZONE class implements the core functions to patrol a [Zone](#zone-module-) by an AI [Controllable](#controllable-module-) or [Group](#group-module-)
and automatically engage any airborne enemies that are within a certain range or within a certain zone.

![Process](/includes/Pictures/AI_CAP/Dia3.JPG)

The AI_CAP_ZONE is assigned a [Group](#group-module-) and this must be done before the AI_CAP_ZONE process can be started using the **Start** event.

![Process](/includes/Pictures/AI_CAP/Dia4.JPG)

The AI will fly towards the random 3D point within the patrol zone, using a random speed within the given altitude and speed limits.
Upon arrival at the 3D point, a new random 3D point will be selected within the patrol zone using the given limits.

![Process](/includes/Pictures/AI_CAP/Dia5.JPG)

This cycle will continue.

![Process](/includes/Pictures/AI_CAP/Dia6.JPG)

During the patrol, the AI will detect enemy targets, which are reported through the **Detected** event.

![Process](/includes/Pictures/AI_CAP/Dia9.JPG)

When enemies are detected, the AI will automatically engage the enemy.

![Process](/includes/Pictures/AI_CAP/Dia10.JPG)

Until a fuel or damage treshold has been reached by the AI, or when the AI is commanded to RTB.
When the fuel treshold has been reached, the airplane will fly towards the nearest friendly airbase and will land.

![Process](/includes/Pictures/AI_CAP/Dia13.JPG)

#####  1. AI_CAP_ZONE constructor

* [AI_CAP_ZONE:New()](#ai_cap_zone-new-patrolzone-patrolflooraltitude-patrolceilingaltitude-self-self-patrolalttype): Creates a new AI_CAP_ZONE object.

#####  2. AI_CAP_ZONE is a FSM

![Process](/includes/Pictures/AI_CAP/Dia2.JPG)

#####  2.1 AI_CAP_ZONE States

* **None** ( Group ): The process is not started yet.
* **Patrolling** ( Group ): The AI is patrolling the Patrol Zone.
* **Engaging** ( Group ): The AI is engaging the bogeys.
* **Returning** ( Group ): The AI is returning to Base..

#####  2.2 AI_CAP_ZONE Events

* **AI_PATROL_ZONE-Start-**: Start the process.
* **AI_PATROL_ZONE-Route-**: Route the AI to a new random 3D point within the Patrol Zone.
* **AI_CAP_ZONE-Engage-**: Let the AI engage the bogeys.
* **AI_CAP_ZONE-Abort-**: Aborts the engagement and return patrolling in the patrol zone.
* **AI_PATROL_ZONE-RTB-**: Route the AI to the home base.
* **AI_PATROL_ZONE-Detect-**: The AI is detecting targets.
* **AI_PATROL_ZONE-Detected-**: The AI has detected new targets.
* **AI_CAP_ZONE-Destroy-**: The AI has destroyed a bogey [Unit](#unit-module-).
* **AI_CAP_ZONE-Destroyed-**: The AI has destroyed all bogeys [Unit](#unit-module-)s assigned in the CAS task.
* **Status** ( Group ): The AI is checking status (fuel and damage). When the tresholds have been reached, the AI will RTB.

#####  3. Set the Range of Engagement

![Range](/includes/Pictures/AI_CAP/Dia11.JPG)

An optional range can be set in meters,
that will define when the AI will engage with the detected airborne enemy targets.
The range can be beyond or smaller than the range of the Patrol Zone.
The range is applied at the position of the AI.
Use the method [AI_CAP_ZONE:SetEngageRange()](#ai_cap_zone-setengagerange-engagerange) to define that range.

#####  4. Set the Zone of Engagement

![Zone](/includes/Pictures/AI_CAP/Dia12.JPG)

An optional [Zone](#zone-module-) can be set,
that will define when the AI will engage with the detected airborne enemy targets.
Use the method [AI_CAP_ZONE:SetEngageZone()](#ai_cap_zone-setengagezone-engagezone) to define that Zone.





<h4> Attributes </h4>

* [CONTROLLABLE](#controllable-class-) AIControllable : The [Controllable](#controllable-module-) patrolling.
* [ZONE_BASE](#zone_base-class-) TargetZone : The [Zone](#zone-module-) where the patrol needs to be executed.


### AI_CAP_ZONE:New(PatrolZone, PatrolFloorAltitude, PatrolCeilingAltitude, self, self, PatrolAltType)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [ZONE_BASE](#zone_base-class-) PatrolZone : The [Zone](#zone-module-) where the patrol needs to be executed.
* [Altitude](#altitude-class-) PatrolFloorAltitude : The lowest altitude in meters where to execute the patrol.
* [Altitude](#altitude-class-) PatrolCeilingAltitude : The highest altitude in meters where to execute the patrol.
* [Speed](#speed-class-) self : PatrolMinSpeed The minimum speed of the [Controllable](#controllable-module-) in km/h.
* [Speed](#speed-class-) self : PatrolMaxSpeed The maximum speed of the [Controllable](#controllable-module-) in km/h.
* [AltitudeType](#altitudetype-class-) PatrolAltType : The altitude type ("RADIO"=="AGL", "BARO"=="ASL"). Defaults to RADIO

<h4> Returns </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)



### AI_CAP_ZONE:OnBeforeEngage(Controllable, From, Event, To)
OnBefore Transition Handler for Event Engage.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_CAP_ZONE:OnAfterEngage(Controllable, From, Event, To)
OnAfter Transition Handler for Event Engage.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:Engage()
Synchronous Event Trigger for Event Engage.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self

<h4> Returns </h4>

### AI_CAP_ZONE:OnLeaveEngaging(Controllable, From, Event, To)
OnLeave Transition Handler for State Engaging.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_CAP_ZONE:OnEnterEngaging(Controllable, From, Event, To)
OnEnter Transition Handler for State Engaging.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:OnBeforeFired(Controllable, From, Event, To)
OnBefore Transition Handler for Event Fired.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_CAP_ZONE:OnAfterFired(Controllable, From, Event, To)
OnAfter Transition Handler for Event Fired.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:Fired()
Synchronous Event Trigger for Event Fired.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self

<h4> Returns </h4>

### AI_CAP_ZONE:OnBeforeDestroy(Controllable, From, Event, To)
OnBefore Transition Handler for Event Destroy.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_CAP_ZONE:OnAfterDestroy(Controllable, From, Event, To)
OnAfter Transition Handler for Event Destroy.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:Destroy()
Synchronous Event Trigger for Event Destroy.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self

<h4> Returns </h4>

### AI_CAP_ZONE:OnBeforeAbort(Controllable, From, Event, To)
OnBefore Transition Handler for Event Abort.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_CAP_ZONE:OnAfterAbort(Controllable, From, Event, To)
OnAfter Transition Handler for Event Abort.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:Abort()
Synchronous Event Trigger for Event Abort.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self

<h4> Returns </h4>

### AI_CAP_ZONE:OnBeforeAccomplish(Controllable, From, Event, To)
OnBefore Transition Handler for Event Accomplish.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### AI_CAP_ZONE:OnAfterAccomplish(Controllable, From, Event, To)
OnAfter Transition Handler for Event Accomplish.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:Accomplish()
Synchronous Event Trigger for Event Accomplish.

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self

<h4> Returns </h4>

### AI_CAP_ZONE:SetEngageZone(EngageZone)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [ZONE](#zone-class-) EngageZone : The zone where the AI is performing CAP.

<h4> Returns </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)



### AI_CAP_ZONE:SetEngageRange(EngageRange)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* <u>Number</u> EngageRange : The Engage Range.

<h4> Returns </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)



### AI_CAP_ZONE:onafterStart(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:onbeforeEngage(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:onafterDetected(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:onafterAbort(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:onafterEngage(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:onafterAccomplish(Controllable, From, Event, To)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### AI_CAP_ZONE:onafterDestroy(Controllable, From, Event, To, EventData)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### AI_CAP_ZONE:OnEventDead(EventData)

<h4> Parameters </h4>
* [AI_CAP_ZONE](#ai_cap_zone-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

