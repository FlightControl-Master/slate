# Core.Event Module
**Core** - EVENT models DCS **event dispatching** using a **publish-subscribe** model.

![Banner Image](/includes/Pictures/EVENT/Dia1.JPG)



#####  1) Event Handling Overview

![Objects](/includes/Pictures/EVENT/Dia2.JPG)

Within a running mission, various DCS events occur. Units are dynamically created, crash, die, shoot stuff, get hit etc.
This module provides a mechanism to dispatch those events occuring within your running mission, to the different objects orchestrating your mission.

![Objects](/includes/Pictures/EVENT/Dia3.JPG)

Objects can subscribe to different events. The Event dispatcher will publish the received DCS events to the subscribed MOOSE objects, in a specified order.
In this way, the subscribed MOOSE objects are kept in sync with your evolving running mission.

#####  1.1) Event Dispatching

![Objects](/includes/Pictures/EVENT/Dia4.JPG)

The _EVENTDISPATCHER object is automatically created within MOOSE,
and handles the dispatching of DCS Events occurring
in the simulator to the subscribed objects
in the correct processing order.

![Objects](/includes/Pictures/EVENT/Dia5.JPG)

There are 5 levels of kind of objects that the _EVENTDISPATCHER services:

* _DATABASE object: The core of the MOOSE objects. Any object that is created, deleted or updated, is done in this database.
* SET_ derived classes: Subsets of the _DATABASE object. These subsets are updated by the _EVENTDISPATCHER as the second priority.
* UNIT objects: UNIT objects can subscribe to DCS events. Each DCS event will be directly published to teh subscribed UNIT object.
* GROUP objects: GROUP objects can subscribe to DCS events. Each DCS event will be directly published to the subscribed GROUP object.
* Any other object: Various other objects can subscribe to DCS events. Each DCS event triggered will be published to each subscribed object.

![Objects](/includes/Pictures/EVENT/Dia6.JPG)

For most DCS events, the above order of updating will be followed.

![Objects](/includes/Pictures/EVENT/Dia7.JPG)

But for some DCS events, the publishing order is reversed. This is due to the fact that objects need to be **erased** instead of added.

#####  1.2) Event Handling

![Objects](/includes/Pictures/EVENT/Dia8.JPG)

The actual event subscribing and handling is not facilitated through the _EVENTDISPATCHER, but it is done through the [BASE](#base-module-) class, [UNIT](#unit-module-) class and [GROUP](#group-module-) class.
The _EVENTDISPATCHER is a component that is quietly working in the background of MOOSE.

![Objects](/includes/Pictures/EVENT/Dia9.JPG)

The BASE class provides methods to catch DCS Events. These are events that are triggered from within the DCS simulator,
and handled through lua scripting. MOOSE provides an encapsulation to handle these events more efficiently.

#####  1.2.1 Subscribe / Unsubscribe to DCS Events

At first, the mission designer will need to **Subscribe** to a specific DCS event for the class.
So, when the DCS event occurs, the class will be notified of that event.
There are two functions which you use to subscribe to or unsubscribe from an event.

* [BASE:HandleEvent()](#base-handleevent-event-eventfunction): Subscribe to a DCS Event.
* [BASE:UnHandleEvent()](#base-unhandleevent-event): Unsubscribe from a DCS Event.

Note that for a UNIT, the event will be handled **for that UNIT only**!
Note that for a GROUP, the event will be handled **for all the UNITs in that GROUP only**!

For all objects of other classes, the subscribed events will be handled for **all UNITs within the Mission**!
So if a UNIT within the mission has the subscribed event for that object,
then the object event handler will receive the event for that UNIT!

#####  1.3.2 Event Handling of DCS Events

Once the class is subscribed to the event, an **Event Handling** method on the object or class needs to be written that will be called
when the DCS event occurs. The Event Handling method receives an [EVENTDATA](#eventdata-class-) structure, which contains a lot of information
about the event that occurred.

Find below an example of the prototype how to write an event handling function for two units:

local Tank1 = UNIT:FindByName( "Tank A" )
local Tank2 = UNIT:FindByName( "Tank B" )

-- Here we subscribe to the Dead events. So, if one of these tanks dies, the Tank1 or Tank2 objects will be notified.
Tank1:HandleEvent( EVENTS.Dead )
Tank2:HandleEvent( EVENTS.Dead )

 This function is an Event Handling function that will be called when Tank1 is Dead.
-- @param [UNIT](#unit-class-) self
-- @param [EVENTDATA](#eventdata-class-) EventData
function Tank1:OnEventDead( EventData )

self:SmokeGreen()
end

 This function is an Event Handling function that will be called when Tank2 is Dead.
-- @param [UNIT](#unit-class-) self
-- @param [EVENTDATA](#eventdata-class-) EventData
function Tank2:OnEventDead( EventData )

self:SmokeBlue()
end

#####  1.3.3 Event Handling methods that are automatically called upon subscribed DCS events

![Objects](/includes/Pictures/EVENT/Dia10.JPG)

The following list outlines which EVENTS item in the structure corresponds to which Event Handling method.
Always ensure that your event handling methods align with the events being subscribed to, or nothing will be executed.

#####  2) EVENTS type

The EVENTS structure contains names for all the different DCS events that objects can subscribe to using the
[BASE:HandleEvent()](#base-handleevent-event-eventfunction) method.

#####  3) EVENTDATA type

The [EVENTDATA](#eventdata-class-) structure contains all the fields that are populated with event information before
an Event Handler method is being called by the event dispatcher.
The Event Handler received the EVENTDATA object as a parameter, and can be used to investigate further the different events.
There are basically 4 main categories of information stored in the EVENTDATA structure:

* Initiator Unit data: Several fields documenting the initiator unit related to the event.
* Target Unit data: Several fields documenting the target unit related to the event.
* Weapon data: Certain events populate weapon information.
* Place data: Certain events populate place information.

 This function is an Event Handling function that will be called when Tank1 is Dead.
-- EventData is an EVENTDATA structure.
-- We use the EventData.IniUnit to smoke the tank Green.
-- @param [UNIT](#unit-class-) self
-- @param [EVENTDATA](#eventdata-class-) EventData
function Tank1:OnEventDead( EventData )

EventData.IniUnit:SmokeGreen()
end


Find below an overview which events populate which information categories:

![Objects](/includes/Pictures/EVENT/Dia14.JPG)

**IMPORTANT NOTE:** Some events can involve not just UNIT objects, but also STATIC objects!!!
In that case the initiator or target unit fields will refer to a STATIC object!
In case a STATIC object is involved, the documentation indicates which fields will and won't not be populated.
The fields **IniObjectCategory** and **TgtObjectCategory** contain the indicator which **kind of object is involved** in the event.
You can use the enumerator **Object.Category.UNIT** and **Object.Category.STATIC** to check on IniObjectCategory and TgtObjectCategory.
Example code snippet:

if Event.IniObjectCategory == Object.Category.UNIT then
...
end
if Event.IniObjectCategory == Object.Category.STATIC then
...
end

When a static object is involved in the event, the Group and Player fields won't be populated.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

YYYY-MM-DD: CLASS:**NewFunction**( Params ) replaces CLASS:_OldFunction_( Params )
YYYY-MM-DD: CLASS:**NewFunction( Params )** added

Hereby the change log:

* 2017-03-07: Added the correct event dispatching in case the event is subscribed by a GROUP.

* 2017-02-07: Did a complete revision of the Event Handing API and underlying mechanisms.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

#####  Authors:

* [**FlightControl**](https://forums.eagle.ru/member.php?u=89536): Design & Programming & documentation.

## EVENT Class
<pre>
Inheritance : The EVENT Class inherits from the following parents :
BASE
	`-- EVENT
</pre>

<h4> Attributes </h4>

* [Events](#event-events-class-)Events


### EVENT:Init(EventID, EventClass)
Initializes the Events structure for the event

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [world.event](#world.event-class-) EventID
* [BASE](#base-class-) EventClass

<h4> Returns </h4>
* [Events](#event-events-class-)


### EVENT:Remove(EventClass, EventID)
Removes a subscription

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [BASE](#base-class-) EventClass : The self instance of the class for which the event is.
* [world.event](#world.event-class-) EventID

<h4> Returns </h4>
* [Events](#event-events-class-)


### EVENT:Reset(EventClass, EventID)
Resets subscriptions

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [BASE](#base-class-) EventClass : The self instance of the class for which the event is.
* [world.event](#world.event-class-) EventID

<h4> Returns </h4>
* [Events](#event-events-class-)


### EVENT:RemoveAll(EventObject)
Clears all event subscriptions for a [BASE](#base-class-) derived object.

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [BASE](#base-class-) EventObject

<h4> Returns </h4>

### EVENT:OnEventForTemplate(EventTemplate, EventFunction, The, OnEventFunction)
Create an OnDead event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>List[]</u> EventTemplate
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : instance of the class for which the event is.
* <u>Function()</u> OnEventFunction

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnEventGeneric(EventFunction, EventClass, self)
Set a new listener for an S_EVENT_X event independent from a unit or a weapon.

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* [BASE](#base-class-) EventClass : The self instance of the class for which the event is captured. When the event happens, the event process will be called in this class provided.
* EventID self

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnEventForUnit(UnitName, EventFunction, EventClass, self)
Set a new listener for an S_EVENT_X event for a UNIT.

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>String</u> UnitName : The name of the UNIT.
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the GROUP.
* [BASE](#base-class-) EventClass : The self instance of the class for which the event is.
* EventID self

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnEventForGroup(GroupName, EventFunction, EventClass, self)
Set a new listener for an S_EVENT_X event for a GROUP.

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>String</u> GroupName : The name of the GROUP.
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the GROUP.
* [BASE](#base-class-) EventClass : The self instance of the class for which the event is.
* EventID self

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnBirthForTemplate(EventGroup, EventFunction, The)
Create an OnBirth event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [GROUP](#group-class-) EventGroup
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : self instance of the class for which the event is.

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnCrashForTemplate(EventGroup, EventFunction, The)
Create an OnCrash event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [GROUP](#group-class-) EventGroup
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : self instance of the class for which the event is.

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnDeadForTemplate(EventGroup, EventFunction, The)
Create an OnDead event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [GROUP](#group-class-) EventGroup
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : self instance of the class for which the event is.

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnLandForTemplate(EventTemplate, EventFunction, The)
Create an OnLand event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>List[]</u> EventTemplate
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : self instance of the class for which the event is.

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnTakeOffForTemplate(EventTemplate, EventFunction, The)
Create an OnTakeOff event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>List[]</u> EventTemplate
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : self instance of the class for which the event is.

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:OnEngineShutDownForTemplate(EventTemplate, EventFunction, The)
Create an OnDead event handler for a group

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* <u>List[]</u> EventTemplate
* <u>Function()</u> EventFunction : The function to be called when the event occurs for the unit.
* EventClass The : self instance of the class for which the event is.

<h4> Returns </h4>
* [EVENT](#event-class-)



### EVENT:CreateEventNewCargo(Cargo)
Creation of a New Cargo Event.

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [AI_CARGO](#ai_cargo-class-) Cargo : The Cargo created.

<h4> Returns </h4>

### EVENT:CreateEventDeleteCargo(Cargo)
Creation of a Cargo Deletion Event.

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [AI_CARGO](#ai_cargo-class-) Cargo : The Cargo created.

<h4> Returns </h4>

### EVENT:onEvent(Event)

<h4> Parameters </h4>
* [EVENT](#event-class-)
self
* [EVENTDATA](#eventdata-class-)
Event

<h4> Returns </h4>

## EVENTS Class
<pre>
The EVENTS class does not inherit
</pre>
Use this structure to subscribe to events using the [BASE:HandleEvent()](#base-handleevent-event-eventfunction) method.


## EVENTDATA Class
<pre>
The EVENTDATA class does not inherit
</pre>
Note that at the beginning of each field description, there is an indication which field will be populated depending on the object type involved in the Event:

* A (Object.Category.)UNIT : A UNIT object type is involved in the Event.
* A (Object.Category.)STATIC : A STATIC object type is involved in the Event.µ


<h4> Attributes </h4>

* <u>Number</u> id : The identifier of the event.
* [Unit](#unit-class-) initiator : (UNIT/STATIC/SCENERY) The initiating @{Dcs.DCSUnit#Unit} or @{Dcs.DCSStaticObject#StaticObject}.
* [Object.Category](#object.category-class-) IniObjectCategory : (UNIT/STATIC/SCENERY) The initiator object category ( Object.Category.UNIT or Object.Category.STATIC ).
* [Unit](#unit-class-) IniDCSUnit : (UNIT/STATIC) The initiating @{DCSUnit#Unit} or @{DCSStaticObject#StaticObject}.
* <u>String</u> IniDCSUnitName : (UNIT/STATIC) The initiating Unit name.
* [UNIT](#unit-class-) IniUnit : (UNIT/STATIC) The initiating MOOSE wrapper [UNIT](#unit-class-) of the initiator Unit object.
* <u>String</u> IniUnitName : (UNIT/STATIC) The initiating UNIT name (same as IniDCSUnitName).
* [Group](#group-class-) IniDCSGroup : (UNIT) The initiating {DCSGroup#Group}.
* <u>String</u> IniDCSGroupName : (UNIT) The initiating Group name.
* [GROUP](#group-class-) IniGroup : (UNIT) The initiating MOOSE wrapper [GROUP](#group-class-) of the initiator Group object.
* <u>String</u> IniGroupName : UNIT) The initiating GROUP name (same as IniDCSGroupName).
* <u>String</u> IniPlayerName : (UNIT) The name of the initiating player in case the Unit is a client or player slot.
* [coalition.side](#coalition.side-class-) IniCoalition : (UNIT) The coalition of the initiator.
* [Unit.Category](#unit.category-class-) IniCategory : (UNIT) The category of the initiator.
* <u>String</u> IniTypeName : (UNIT) The type name of the initiator.
* [Unit](#unit-class-) target : (UNIT/STATIC) The target @{Dcs.DCSUnit#Unit} or @{DCSStaticObject#StaticObject}.
* [Object.Category](#object.category-class-) TgtObjectCategory : (UNIT/STATIC) The target object category ( Object.Category.UNIT or Object.Category.STATIC ).
* [Unit](#unit-class-) TgtDCSUnit : (UNIT/STATIC) The target @{DCSUnit#Unit} or @{DCSStaticObject#StaticObject}.
* <u>String</u> TgtDCSUnitName : (UNIT/STATIC) The target Unit name.
* [UNIT](#unit-class-) TgtUnit : (UNIT/STATIC) The target MOOSE wrapper [UNIT](#unit-class-) of the target Unit object.
* <u>String</u> TgtUnitName : (UNIT/STATIC) The target UNIT name (same as TgtDCSUnitName).
* [Group](#group-class-) TgtDCSGroup : (UNIT) The target {DCSGroup#Group}.
* <u>String</u> TgtDCSGroupName : (UNIT) The target Group name.
* [GROUP](#group-class-) TgtGroup : (UNIT) The target MOOSE wrapper [GROUP](#group-class-) of the target Group object.
* <u>String</u> TgtGroupName : (UNIT) The target GROUP name (same as TgtDCSGroupName).
* <u>String</u> TgtPlayerName : (UNIT) The name of the target player in case the Unit is a client or player slot.
* [coalition.side](#coalition.side-class-) TgtCoalition : (UNIT) The coalition of the target.
* [Unit.Category](#unit.category-class-) TgtCategory : (UNIT) The category of the target.
* <u>String</u> TgtTypeName : (UNIT) The type name of the target.
* weapon The : weapon used during the event.
* Weapon self
* WeaponName self
* WeaponTgtDCSUnit self


## EVENT.Events Class
<pre>
The EVENT.Events class does not inherit
</pre>

<h4> Attributes </h4>

* <u>Number</u> IniUnit


## EVENTHANDLER Class
<pre>
Inheritance : The EVENTHANDLER Class inherits from the following parents :
BASE
	`-- EVENTHANDLER
</pre>


### EVENTHANDLER:New()
The EVENTHANDLER constructor

<h4> Parameters </h4>
* [EVENTHANDLER](#eventhandler-class-)
self

<h4> Returns </h4>
* [EVENTHANDLER](#eventhandler-class-)



