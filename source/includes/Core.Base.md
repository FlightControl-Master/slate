# Core.Base Module
**Core** - BASE forms **the basis of the MOOSE framework**. Each class within the MOOSE framework derives from BASE.

![Banner Image](/includes/Pictures/BASE/Dia1.JPG)



The [BASE](#base-class-) class is the core root class from where every other class in moose is derived.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

YYYY-MM-DD: CLASS:**NewFunction**( Params ) replaces CLASS:_OldFunction_( Params )
YYYY-MM-DD: CLASS:**NewFunction( Params )** added

Hereby the change log:



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* None.

#####  Authors:

* **FlightControl**: Design & Programming

## BASE Class
<pre>
The BASE class does not inherit
</pre>
<h4> Attributes </h4>

* ClassName The : name of the class.
* ClassID The : ID number of the class.
* ClassNameAndID The : name of the class concatenated with the ID number of the class.


### BASE:New()
BASE constructor.

This is an example how to use the BASE:New() constructor in a new class definition when inheriting from BASE.

function EVENT:New()
local self = BASE:Inherit( self, BASE:New() ) -- [EVENT](#event-class-)

return self
end


<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-)



### BASE:Inherit(is, Parent)
This is the worker method to inherit from a parent class.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Child is : the Child class that inherits.
* [BASE](#base-class-)
Parent : is the Parent class that the Child inherits from.

<h4> Returns </h4>
* [BASE](#base-class-)



### BASE:GetParent(Child)
This is the worker method to retrieve the Parent class.
Note that the Parent class must be passed to call the parent class method.

self:GetParent(self):ParentMethod()



<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [BASE](#base-class-)
Child : is the Child class from which the Parent class needs to be retrieved.

<h4> Returns </h4>
* [BASE](#base-class-)



### BASE:GetClassNameAndID()
Get the ClassName + ClassID of the class instance.
The ClassName + ClassID is formatted as '%s#%09d'.

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* <u>String</u>  The ClassName + ClassID of the class instance.


### BASE:GetClassName()
Get the ClassName of the class instance.

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* <u>String</u>  The ClassName of the class instance.


### BASE:GetClassID()
Get the ClassID of the class instance.

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* <u>String</u>  The ClassID of the class instance.


### BASE:EventDispatcher()
Returns the event dispatcher

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* [EVENT](#event-class-) 


### BASE:GetEventPriority()
Get the Class [Event](#event-module-) processing Priority.
The Event processing Priority is a number from 1 to 10,
reflecting the order of the classes subscribed to the Event to be processed.

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The [Event](#event-module-) processing Priority.


### BASE:SetEventPriority(EventPriority)
Set the Class [Event](#event-module-) processing Priority.
The Event processing Priority is a number from 1 to 10,
reflecting the order of the classes subscribed to the Event to be processed.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* <u>Number</u> EventPriority : The [Event](#event-module-) processing Priority.

<h4> Returns </h4>
* self 


### BASE:EventRemoveAll()
Remove all subscribed events

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-)



### BASE:HandleEvent(Event, EventFunction)
Subscribe to a DCS Event.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTS](#events-class-) Event
* <u>Function()</u> EventFunction : (optional) The function to be called when the event occurs for the unit.

<h4> Returns </h4>
* [BASE](#base-class-)



### BASE:UnHandleEvent(Event)
UnSubscribe to a DCS event.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTS](#events-class-) Event

<h4> Returns </h4>
* [BASE](#base-class-)



### BASE:OnEventShot(EventData)
Occurs whenever any unit in a mission fires a weapon. But not any machine gun or autocannon based weapon, those are handled by EVENT.ShootingStart.
@function [parent=#BASE] OnEventShot

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventHit(EventData)
Occurs whenever an object is hit by a weapon.
initiator : The unit object the fired the weapon
weapon: Weapon object that hit the target
target: The Object that was hit.
@function [parent=#BASE] OnEventHit

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventTakeoff(EventData)
Occurs when an aircraft takes off from an airbase, farp, or ship.
initiator : The unit that tookoff
place: Object from where the AI took-off from. Can be an Airbase Object, FARP, or Ships
@function [parent=#BASE] OnEventTakeoff

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventLand(EventData)
Occurs when an aircraft lands at an airbase, farp or ship
initiator : The unit that has landed
place: Object that the unit landed on. Can be an Airbase Object, FARP, or Ships
@function [parent=#BASE] OnEventLand

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventCrash(EventData)
Occurs when any aircraft crashes into the ground and is completely destroyed.
initiator : The unit that has crashed
@function [parent=#BASE] OnEventCrash

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventEjection(EventData)
Occurs when a pilot ejects from an aircraft
initiator : The unit that has ejected
@function [parent=#BASE] OnEventEjection

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventRefueling(EventData)
Occurs when an aircraft connects with a tanker and begins taking on fuel.
initiator : The unit that is receiving fuel.
@function [parent=#BASE] OnEventRefueling

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventDead(EventData)
Occurs when an object is dead.
initiator : The unit that is dead.
@function [parent=#BASE] OnEventDead

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEvent(EventData)
Occurs when an object is completely destroyed.
initiator : The unit that is was destroyed.
@function [parent=#BASE] OnEvent

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventPilotDead(EventData)
Occurs when the pilot of an aircraft is killed. Can occur either if the player is alive and crashes or if a weapon kills the pilot without completely destroying the plane.
initiator : The unit that the pilot has died in.
@function [parent=#BASE] OnEventPilotDead

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventBaseCaptured(EventData)
Occurs when a ground unit captures either an airbase or a farp.
initiator : The unit that captured the base
place: The airbase that was captured, can be a FARP or Airbase. When calling place:getCoalition() the faction will already be the new owning faction.
@function [parent=#BASE] OnEventBaseCaptured

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventMissionStart(EventData)
Occurs when a mission starts
@function [parent=#BASE] OnEventMissionStart

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventMissionEnd(EventData)
Occurs when a mission ends
@function [parent=#BASE] OnEventMissionEnd

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventRefuelingStop(EventData)
Occurs when an aircraft is finished taking fuel.
initiator : The unit that was receiving fuel.
@function [parent=#BASE] OnEventRefuelingStop

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventBirth(EventData)
Occurs when any object is spawned into the mission.
initiator : The unit that was spawned
@function [parent=#BASE] OnEventBirth

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventHumanFailure(EventData)
Occurs when any system fails on a human controlled aircraft.
initiator : The unit that had the failure
@function [parent=#BASE] OnEventHumanFailure

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventEngineStartup(EventData)
Occurs when any aircraft starts its engines.
initiator : The unit that is starting its engines.
@function [parent=#BASE] OnEventEngineStartup

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventEngineShutdown(EventData)
Occurs when any aircraft shuts down its engines.
initiator : The unit that is stopping its engines.
@function [parent=#BASE] OnEventEngineShutdown

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventPlayerEnterUnit(EventData)
Occurs when any player assumes direct control of a unit.
initiator : The unit that is being taken control of.
@function [parent=#BASE] OnEventPlayerEnterUnit

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventPlayerLeaveUnit(EventData)
Occurs when any player relieves control of a unit to the AI.
initiator : The unit that the player left.
@function [parent=#BASE] OnEventPlayerLeaveUnit

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventShootingStart(EventData)
Occurs when any unit begins firing a weapon that has a high rate of fire. Most common with aircraft cannons (GAU-8), autocannons, and machine guns.
initiator : The unit that is doing the shooing.
target: The unit that is being targeted.
@function [parent=#BASE] OnEventShootingStart

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:OnEventShootingEnd(EventData)
Occurs when any unit stops firing its weapon. Event will always correspond with a shooting start event.
initiator : The unit that was doing the shooing.
@function [parent=#BASE] OnEventShootingEnd

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [EVENTDATA](#eventdata-class-) EventData : The EventData structure.

<h4> Returns </h4>

### BASE:CreateEventBirth(EventTime, Initiator, IniUnitName, self, self)
Creation of a Birth Event.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [Time](#time-class-) EventTime : The time stamp of the event.
* Dcs.DCSWrapper.Object#Object Initiator : The initiating object of the event.
* <u>String</u> IniUnitName : The initiating unit name.
* place self
* subplace self

<h4> Returns </h4>

### BASE:CreateEventCrash(EventTime, Initiator)
Creation of a Crash Event.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [Time](#time-class-) EventTime : The time stamp of the event.
* Dcs.DCSWrapper.Object#Object Initiator : The initiating object of the event.

<h4> Returns </h4>

### BASE:onEvent(event)
The main event handling function... This function captures all events generated for the class.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* [Event](#event-class-) event

<h4> Returns </h4>

### BASE:SetState(The, The, The)
Set a state or property of the Object given a Key and a Value.
Note that if the Object is destroyed, nillified or garbage collected, then the Values and Keys will also be gone.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Object The : object that will hold the Value set by the Key.
* Key The : key that is used as a reference of the value. Note that the key can be a <u>String</u>, but it can also be any other type!
* Value The : value to is stored in the object.

<h4> Returns </h4>
* The  Value set.
* <u>Nil</u>  The Key was not found and thus the Value could not be retrieved.


### BASE:GetState(The, The, The)
Get a Value given a Key from the Object.
Note that if the Object is destroyed, nillified or garbage collected, then the Values and Keys will also be gone.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Object The : object that holds the Value set by the Key.
* Key The : key that is used to retrieve the value. Note that the key can be a <u>String</u>, but it can also be any other type!
* Value The : value to is stored in the Object.

<h4> Returns </h4>
* The  Value retrieved.


### BASE:TraceOnOff(TraceOnOff)
``` lua
-- Switch the tracing On
BASE:TraceOnOff( true )

-- Switch the tracing Off
BASE:TraceOnOff( false )
```
Set trace on or off
Note that when trace is off, no debug statement is performed, increasing performance!
When Moose is loaded statically, (as one file), tracing is switched off by default.
So tracing must be switched on manually in your mission if you are using Moose statically.
When moose is loading dynamically (for moose class development), tracing is switched on by default.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* <u>Boolean</u> TraceOnOff : Switch the tracing on or off.

<h4> Returns </h4>

### BASE:IsTrace()
Enquires if tracing is on (for the class).

<h4> Parameters </h4>
* [BASE](#base-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### BASE:TraceLevel(Level)
Set trace level

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* <u>Number</u> Level

<h4> Returns </h4>

### BASE:TraceAll(TraceAll)
Trace all methods in MOOSE

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* <u>Boolean</u> TraceAll : true = trace all methods in MOOSE.

<h4> Returns </h4>

### BASE:TraceClass(Class)
Set tracing for a class

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* <u>String</u> Class

<h4> Returns </h4>

### BASE:TraceClassMethod(Class, Method)
Set tracing for a specific method of  class

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* <u>String</u> Class
* <u>String</u> Method

<h4> Returns </h4>

### BASE:F(A)
Trace a function call. Must be at the beginning of the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

### BASE:F2(A)
Trace a function call level 2. Must be at the beginning of the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

### BASE:F3(A)
Trace a function call level 3. Must be at the beginning of the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

### BASE:T(A)
Trace a function logic level 1. Can be anywhere within the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

### BASE:T2(A)
Trace a function logic level 2. Can be anywhere within the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

### BASE:T3(A)
Trace a function logic level 3. Can be anywhere within the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

### BASE:E(A)
Log an exception which will be traced always. Can be anywhere within the function logic.

<h4> Parameters </h4>
* [BASE](#base-class-)
self
* Arguments A : <u>List[]</u> or any field.

<h4> Returns </h4>

## FORMATION Class
<pre>
The FORMATION class does not inherit
</pre>

<h4> Attributes </h4>

* Cone A : cone formation.


