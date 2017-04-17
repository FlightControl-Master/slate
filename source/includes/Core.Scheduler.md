# Core.Scheduler Module
**Core** - SCHEDULER prepares and handles the **execution of functions over scheduled time (intervals)**.

![Banner Image](/includes/Pictures/SCHEDULER/Dia1.JPG)



#####  1) [SCHEDULER](#scheduler-class) class, extends [BASE](#base-class)

The [SCHEDULER](#scheduler-class) class creates schedule.

#####  1.1) SCHEDULER constructor

The SCHEDULER class is quite easy to use, but note that the New constructor has variable parameters:

* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) nil ): Setup a new SCHEDULER object, which is persistently executed after garbage collection.
* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) Object ): Setup a new SCHEDULER object, which is linked to the Object. When the Object is nillified or destroyed, the SCHEDULER object will also be destroyed and stopped after garbage collection.
* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) nil, Function, FunctionArguments, Start, ... ): Setup a new persistent SCHEDULER object, and start a new schedule for the Function with the defined FunctionArguments according the Start and sequent parameters.
* [SCHEDULER:New()](#scheduler-new-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) Object, Function, FunctionArguments, Start, ... ): Setup a new SCHEDULER object, linked to Object, and start a new schedule for the Function with the defined FunctionArguments according the Start and sequent parameters.

#####  1.2) SCHEDULER timer stopping and (re-)starting.

The SCHEDULER can be stopped and restarted with the following methods:

* [SCHEDULER:Start()](#scheduler-start-scheduleid): (Re-)Start the schedules within the SCHEDULER object. If a CallID is provided to :Start(), only the schedule referenced by CallID will be (re-)started.
* [SCHEDULER:Stop()](#scheduler-stop-scheduleid): Stop the schedules within the SCHEDULER object. If a CallID is provided to :Stop(), then only the schedule referenced by CallID will be stopped.

#####  1.3) Create a new schedule

With [SCHEDULER:Schedule()](#scheduler-schedule-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) a new time event can be scheduled. This function is used by the :New() constructor when a new schedule is planned.



#####  Contributions:

* FlightControl : Concept & Testing

#####  Authors:

* FlightControl : Design & Programming

#####  Test Missions:

* SCH - Scheduler



## SCHEDULER Class
<pre>
Inheritance : The SCHEDULER Class inherits from the following parents :
BASE
	`-- SCHEDULER
</pre>

<h4> Attributes </h4>

* <u>Number</u> ScheduleID : the ID of the scheduler.


### SCHEDULER:New(SchedulerObject, SchedulerFunction, SchedulerArguments, Start, Repeat, RandomizeFactor, Stop)

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class)
self
* <u>List[]</u> SchedulerObject : Specified for which Moose object the timer is setup. If a value of nil is provided, a scheduler will be setup without an object reference.
* <u>Function()</u> SchedulerFunction : The event function to be called when a timer event occurs. The event function needs to accept the parameters specified in SchedulerArguments.
* <u>List[]</u> SchedulerArguments : Optional arguments that can be given as part of scheduler. The arguments need to be given as a table { param1, param 2, ... }.
* <u>Number</u> Start : Specifies the amount of seconds that will be waited before the scheduling is started, and the event function is called.
* <u>Number</u> Repeat : Specifies the interval in seconds when the scheduler will call the event function.
* <u>Number</u> RandomizeFactor : Specifies a randomization factor between 0 and 1 to randomize the Repeat.
* <u>Number</u> Stop : Specifies the amount of seconds when the scheduler will be stopped.

<h4> Returns </h4>
* [SCHEDULER](#scheduler-class)
self.
* <u>Number</u> The : ScheduleID of the planned schedule.


### SCHEDULER:Schedule(SchedulerObject, SchedulerFunction, SchedulerArguments, Start, Repeat, RandomizeFactor, Stop)

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class)
self
* <u>List[]</u> SchedulerObject : Specified for which Moose object the timer is setup. If a value of nil is provided, a scheduler will be setup without an object reference.
* <u>Function()</u> SchedulerFunction : The event function to be called when a timer event occurs. The event function needs to accept the parameters specified in SchedulerArguments.
* <u>List[]</u> SchedulerArguments : Optional arguments that can be given as part of scheduler. The arguments need to be given as a table { param1, param 2, ... }.
* <u>Number</u> Start : Specifies the amount of seconds that will be waited before the scheduling is started, and the event function is called.
* <u>Number</u> Repeat : Specifies the interval in seconds when the scheduler will call the event function.
* <u>Number</u> RandomizeFactor : Specifies a randomization factor between 0 and 1 to randomize the Repeat.
* <u>Number</u> Stop : Specifies the amount of seconds when the scheduler will be stopped.

<h4> Returns </h4>
* <u>Number</u> The : ScheduleID of the planned schedule.


### SCHEDULER:Start(ScheduleID)

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class)
self
* <u>Number</u> ScheduleID : (optional) The ScheduleID of the planned (repeating) schedule.

<h4> Returns </h4>

### SCHEDULER:Stop(ScheduleID)

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class)
self
* <u>Number</u> ScheduleID : (optional) The ScheduleID of the planned (repeating) schedule.

<h4> Returns </h4>

### SCHEDULER:Remove(ScheduleID)

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class)
self
* <u>Number</u> ScheduleID : (optional) The ScheduleID of the planned (repeating) schedule.

<h4> Returns </h4>

### SCHEDULER:Clear()

<h4> Parameters </h4>
* [SCHEDULER](#scheduler-class)
self

<h4> Returns </h4>

