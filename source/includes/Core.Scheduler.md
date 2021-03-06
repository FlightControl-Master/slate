# Core.Scheduler Module
**Core** - SCHEDULER prepares and handles the **execution of functions over scheduled time (intervals)**.

![Banner Image](/includes/Pictures/SCHEDULER/Dia1.JPG)



SCHEDULER manages the **scheduling of functions**:

* optionally in an optional specified time interval,
* optionally **repeating** with a specified time repeat interval,
* optionally **randomizing** with a specified time interval randomization factor,
* optionally **stop** the repeating after a specified time interval.



#####  Demo Missions

#####  [SCHEDULER Demo Missions source code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/SCH%20-%20Scheduler)

#####  [SCHEDULER Demo Missions, only for beta testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/SCH%20-%20Scheduler)

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [SCHEDULER YouTube Channel (none)]()



#####  Contributions:

* FlightControl : Concept & Testing

#####  Authors:

* FlightControl : Design & Programming



## SCHEDULER Class
<pre>
Inheritance : The SCHEDULER Class inherits from the following parents :
BASE
	`-- SCHEDULER
</pre>

The SCHEDULER class creates schedule.

A SCHEDULER can manage **multiple** (repeating) schedules. Each planned or executing schedule has a unique **ScheduleID**.
The ScheduleID is returned when the method [SCHEDULER:Schedule()](#scheduler-schedule-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) is called.
It is recommended to store the ScheduleID in a variable, as it is used in the methods [Start](#start-module-)() and [Stop](#stop-module-)(),
which can start and stop specific repeating schedules respectively within a SCHEDULER object.

#####  SCHEDULER constructor

The SCHEDULER class is quite easy to use, but note that the New constructor has variable parameters:

The [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) method returns 2 variables:

1. The SCHEDULER object reference.
2. The first schedule planned in the SCHEDULER object.

To clarify the different appliances, lets have a look at the following examples:

#####  Construct a SCHEDULER object without a persistent schedule.

* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) nil ): Setup a new SCHEDULER object, which is persistently executed after garbage collection.

SchedulerObject = SCHEDULER:New()
SchedulerID = SchedulerObject:Schedule( nil, ScheduleFunction, {} )

The above example creates a new SchedulerObject, but does not schedule anything.
A separate schedule is created by using the SchedulerObject using the method :Schedule..., which returns a ScheduleID

#####  Construct a SCHEDULER object without a volatile schedule, but volatile to the Object existence...

* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) Object ): Setup a new SCHEDULER object, which is linked to the Object. When the Object is nillified or destroyed, the SCHEDULER object will also be destroyed and stopped after garbage collection.

ZoneObject = ZONE:New( "ZoneName" )
SchedulerObject = SCHEDULER:New( ZoneObject )
SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {} )
...
ZoneObject = nil
garbagecollect()

The above example creates a new SchedulerObject, but does not schedule anything, and is bound to the existence of ZoneObject, which is a ZONE.
A separate schedule is created by using the SchedulerObject using the method :Schedule()..., which returns a ScheduleID
Later in the logic, the ZoneObject is put to nil, and garbage is collected.
As a result, the ScheduleObject will cancel any planned schedule.

#####  Construct a SCHEDULER object with a persistent schedule.

* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) nil, Function, FunctionArguments, Start, ... ): Setup a new persistent SCHEDULER object, and start a new schedule for the Function with the defined FunctionArguments according the Start and sequent parameters.

SchedulerObject, SchedulerID = SCHEDULER:New( nil, ScheduleFunction, {} )

The above example creates a new SchedulerObject, and does schedule the first schedule as part of the call.
Note that 2 variables are returned here: SchedulerObject, ScheduleID...

#####  Construct a SCHEDULER object without a schedule, but volatile to the Object existence...

* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) Object, Function, FunctionArguments, Start, ... ): Setup a new SCHEDULER object, linked to Object, and start a new schedule for the Function with the defined FunctionArguments according the Start and sequent parameters.

ZoneObject = ZONE:New( "ZoneName" )
SchedulerObject, SchedulerID = SCHEDULER:New( ZoneObject, ScheduleFunction, {} )
SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {} )
...
ZoneObject = nil
garbagecollect()

The above example creates a new SchedulerObject, and schedules a method call (ScheduleFunction),
and is bound to the existence of ZoneObject, which is a ZONE object (ZoneObject).
Both a ScheduleObject and a SchedulerID variable are returned.
Later in the logic, the ZoneObject is put to nil, and garbage is collected.
As a result, the ScheduleObject will cancel the planned schedule.

#####  SCHEDULER timer stopping and (re-)starting.

The SCHEDULER can be stopped and restarted with the following methods:

* [SCHEDULER:Start()](#scheduler-start-scheduleid): (Re-)Start the schedules within the SCHEDULER object. If a CallID is provided to :Start(), only the schedule referenced by CallID will be (re-)started.
* [SCHEDULER:Stop()](#scheduler-stop-scheduleid): Stop the schedules within the SCHEDULER object. If a CallID is provided to :Stop(), then only the schedule referenced by CallID will be stopped.

ZoneObject = ZONE:New( "ZoneName" )
SchedulerObject, SchedulerID = SCHEDULER:New( ZoneObject, ScheduleFunction, {} )
SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {}, 10, 10 )
...
SchedulerObject:Stop( SchedulerID )
...
SchedulerObject:Start( SchedulerID )

The above example creates a new SchedulerObject, and does schedule the first schedule as part of the call.
Note that 2 variables are returned here: SchedulerObject, ScheduleID...
Later in the logic, the repeating schedule with SchedulerID is stopped.
A bit later, the repeating schedule with SchedulerId is (re)-started.

#####  Create a new schedule

With the method [SCHEDULER:Schedule()](#scheduler-schedule-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) a new time event can be scheduled.
This method is used by the :New() constructor when a new schedule is planned.

Consider the following code fragment of the SCHEDULER object creation.

ZoneObject = ZONE:New( "ZoneName" )
SchedulerObject = SCHEDULER:New( ZoneObject )

Several parameters can be specified that influence the behaviour of a Schedule.

#####  A single schedule, immediately executed

SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {} )

The above example schedules a new ScheduleFunction call to be executed asynchronously, within milleseconds ...

#####  A single schedule, planned over time

SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {}, 10 )

The above example schedules a new ScheduleFunction call to be executed asynchronously, within 10 seconds ...

#####  A schedule with a repeating time interval, planned over time

SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {}, 10, 60 )

The above example schedules a new ScheduleFunction call to be executed asynchronously, within 10 seconds,
and repeating 60 every seconds ...

#####  A schedule with a repeating time interval, planned over time, with time interval randomization

SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {}, 10, 60, 0.5 )

The above example schedules a new ScheduleFunction call to be executed asynchronously, within 10 seconds,
and repeating 60 seconds, with a 50% time interval randomization ...
So the repeating time interval will be randomized using the **0.5**,
and will calculate between **60 - ( 60 * 0.5 )** and **60 + ( 60 * 0.5 )** for each repeat,
which is in this example between **30** and **90** seconds.

#####  A schedule with a repeating time interval, planned over time, with time interval randomization, and stop after a time interval

SchedulerID = SchedulerObject:Schedule( ZoneObject, ScheduleFunction, {}, 10, 60, 0.5, 300 )

The above example schedules a new ScheduleFunction call to be executed asynchronously, within 10 seconds,
The schedule will repeat every 60 seconds.
So the repeating time interval will be randomized using the **0.5**,
and will calculate between **60 - ( 60 * 0.5 )** and **60 + ( 60 * 0.5 )** for each repeat,
which is in this example between **30** and **90** seconds.
The schedule will stop after **300** seconds.


The SCHEDULER class

<h4> Attributes </h4>

* <u>Number</u> ScheduleID : the ID of the scheduler.


### SCHEDULER:New(SchedulerObject, SchedulerFunction, SchedulerArguments, Start, Repeat, RandomizeFactor, Stop)
SCHEDULER constructor.

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class-)
self
* <u>List[]</u> SchedulerObject : Specified for which Moose object the timer is setup. If a value of nil is provided, a scheduler will be setup without an object reference.
* <u>Function()</u> SchedulerFunction : The event function to be called when a timer event occurs. The event function needs to accept the parameters specified in SchedulerArguments.
* <u>List[]</u> SchedulerArguments : Optional arguments that can be given as part of scheduler. The arguments need to be given as a table { param1, param 2, ... }.
* <u>Number</u> Start : Specifies the amount of seconds that will be waited before the scheduling is started, and the event function is called.
* <u>Number</u> Repeat : Specifies the interval in seconds when the scheduler will call the event function.
* <u>Number</u> RandomizeFactor : Specifies a randomization factor between 0 and 1 to randomize the Repeat.
* <u>Number</u> Stop : Specifies the amount of seconds when the scheduler will be stopped.

<h4> Returns </h4>
* [SCHEDULER](#scheduler-class-)

* <u>Number</u>  The ScheduleID of the planned schedule.


### SCHEDULER:Schedule(SchedulerObject, SchedulerFunction, SchedulerArguments, Start, Repeat, RandomizeFactor, Stop)
Schedule a new time event. Note that the schedule will only take place if the scheduler is *started*. Even for a single schedule event, the scheduler needs to be started also.

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class-)
self
* <u>List[]</u> SchedulerObject : Specified for which Moose object the timer is setup. If a value of nil is provided, a scheduler will be setup without an object reference.
* <u>Function()</u> SchedulerFunction : The event function to be called when a timer event occurs. The event function needs to accept the parameters specified in SchedulerArguments.
* <u>List[]</u> SchedulerArguments : Optional arguments that can be given as part of scheduler. The arguments need to be given as a table { param1, param 2, ... }.
* <u>Number</u> Start : Specifies the amount of seconds that will be waited before the scheduling is started, and the event function is called.
* <u>Number</u> Repeat : Specifies the interval in seconds when the scheduler will call the event function.
* <u>Number</u> RandomizeFactor : Specifies a randomization factor between 0 and 1 to randomize the Repeat.
* <u>Number</u> Stop : Specifies the amount of seconds when the scheduler will be stopped.

<h4> Returns </h4>
* <u>Number</u>  The ScheduleID of the planned schedule.


### SCHEDULER:Start(ScheduleID)
(Re-)Starts the schedules or a specific schedule if a valid ScheduleID is provided.

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class-)
self
* <u>Number</u> ScheduleID : (optional) The ScheduleID of the planned (repeating) schedule.

<h4> Returns </h4>

### SCHEDULER:Stop(ScheduleID)
Stops the schedules or a specific schedule if a valid ScheduleID is provided.

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class-)
self
* <u>Number</u> ScheduleID : (optional) The ScheduleID of the planned (repeating) schedule.

<h4> Returns </h4>

### SCHEDULER:Remove(ScheduleID)
Removes a specific schedule if a valid ScheduleID is provided.

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class-)
self
* <u>Number</u> ScheduleID : (optional) The ScheduleID of the planned (repeating) schedule.

<h4> Returns </h4>

### SCHEDULER:Clear()
Clears all pending schedules.

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class-)
self

<h4> Returns </h4>

