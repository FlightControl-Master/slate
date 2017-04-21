# Functional.Movement Module
Limit the simultaneous movement of Groups within a running Mission.
This module is defined to improve the performance in missions, and to bring additional realism for GROUND vehicles.
Performance: If in a DCSRTE there are a lot of moving GROUND units, then in a multi player mission, this WILL create lag if
the main DCS execution core of your CPU is fully utilized. So, this class will limit the amount of simultaneous moving GROUND units
on defined intervals (currently every minute).
## MOVEMENT Class
<pre>
Inheritance : The MOVEMENT Class inherits from the following parents :
BASE
	`-- MOVEMENT
</pre>


### MOVEMENT.ScheduleStart()

<h4> Parameters </h4>
<h4> Returns </h4>

### MOVEMENT.ScheduleStop()

<h4> Parameters </h4>
<h4> Returns </h4>

### MOVEMENT:OnEventBirth(self)
Captures the birth events when new Units were spawned.
@todo This method should become obsolete. The new [DATABASE](#database-module-) class will handle the collection administration.

<h4> Parameters </h4>
* [MOVEMENT](#movement-class-)
self
* [EVENTDATA](#eventdata-class-) self

<h4> Returns </h4>

### MOVEMENT.OnDeadOrCrash()

<h4> Parameters </h4>
<h4> Returns </h4>

