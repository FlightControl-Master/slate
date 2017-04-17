# Core.ScheduleDispatcher Module
This module defines the SCHEDULEDISPATCHER class, which is used by a central object called _SCHEDULEDISPATCHER.



Takes care of the creation and dispatching of scheduled functions for SCHEDULER objects.

This class is tricky and needs some thorought explanation.
SCHEDULE classes are used to schedule functions for objects, or as persistent objects.
The SCHEDULEDISPATCHER class ensures that:

- Scheduled functions are planned according the SCHEDULER object parameters.
- Scheduled functions are repeated when requested, according the SCHEDULER object parameters.
- Scheduled functions are automatically removed when the schedule is finished, according the SCHEDULER object parameters.

The SCHEDULEDISPATCHER class will manage SCHEDULER object in memory during garbage collection:
- When a SCHEDULER object is not attached to another object (that is, it's first :Schedule() parameter is nil), then the SCHEDULER
object is _persistent_ within memory.
- When a SCHEDULER object *is* attached to another object, then the SCHEDULER object is _not persistent_ within memory after a garbage collection!
The none persistency of SCHEDULERS attached to objects is required to allow SCHEDULER objects to be garbage collectged, when the parent object is also desroyed or nillified and garbage collected.
Even when there are pending timer scheduled functions to be executed for the SCHEDULER object,
these will not be executed anymore when the SCHEDULER object has been destroyed.

The SCHEDULEDISPATCHER allows multiple scheduled functions to be planned and executed for one SCHEDULER object.
The SCHEDULER object therefore keeps a table of "CallID's", which are returned after each planning of a new scheduled function by the SCHEDULEDISPATCHER.
The SCHEDULER object plans new scheduled functions through the [SCHEDULER:Schedule()](#scheduler-schedule-schedulerobject-schedulerfunction-schedulerarguments-start-repeat-randomizefactor-stop) method.
The Schedule() method returns the CallID that is the reference ID for each planned schedule.





#####  Contributions: -
#####  Authors: FlightControl : Design & Programming

## SCHEDULEDISPATCHER Class
<pre>
The SCHEDULEDISPATCHER class does not inherit
</pre>


### SCHEDULEDISPATCHER:AddSchedule(Scheduler)

<h4> Parameters </h4>
* [SCHEDULEDISPATCHER](#scheduledispatcher-class)
self
* [SCHEDULER](#scheduler-class) Scheduler

<h4> Returns </h4>

