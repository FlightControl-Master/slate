# Actions.Smoke Module
(SP) (MP) (FSM) Route AI or players through waypoints or to zones.



#####  [ACT_ASSIST](#act_assist-class-) FSM class, extends [FSM_PROCESS](#fsm_process-class-)

#####  ACT_ASSIST state machine:

This class is a state machine: it manages a process that is triggered by events causing state transitions to occur.
All derived classes from this class will start with the class name, followed by a \_. See the relevant derived class descriptions below.
Each derived class follows exactly the same process, using the same events and following the same state transitions,
but will have **different implementation behaviour** upon each event or state transition.

#####  ACT_ASSIST **Events**:

These are the events defined in this class:

* **Start**:  The process is started.
* **Next**: The process is smoking the targets in the given zone.

#####  ACT_ASSIST **Event methods**:

Event methods are available (dynamically allocated by the state machine), that accomodate for state transitions occurring in the process.
There are two types of event methods, which you can use to influence the normal mechanisms in the state machine:

* **Immediate**: The event method has exactly the name of the event.
* **Delayed**: The event method starts with a __ + the name of the event. The first parameter of the event method is a number value, expressing the delay in seconds when the event will be executed.

#####  ACT_ASSIST **States**:

* **None**: The controllable did not receive route commands.
* **AwaitSmoke (*)**: The process is awaiting to smoke the targets in the zone.
* **Smoking (*)**: The process is smoking the targets in the zone.
* **Failed (*)**: The process has failed.

(*) End states of the process.

#####  ACT_ASSIST state transition methods:

State transition functions can be set **by the mission designer** customizing or improving the behaviour of the state.
There are 2 moments when state transition methods will be called by the state machine:

* **Before** the state transition.
The state transition method needs to start with the name **OnBefore + the name of the state**.
If the state transition method returns false, then the processing of the state transition will not be done!
If you want to change the behaviour of the AIControllable at this event, return false,
but then you'll need to specify your own logic using the AIControllable!

* **After** the state transition.
The state transition method needs to start with the name **OnAfter + the name of the state**.
These state transition methods need to provide a return value, which is specified at the function description.



#####  1) [ACT_ASSIST_SMOKE_TARGETS_ZONE](#act_assist_smoke_targets_zone-class-) class, extends [ACT_ASSIST](#act_assist-class-)

The ACT_ASSIST_SMOKE_TARGETS_ZONE class implements the core functions to smoke targets in a [Zone](#zone-module-).
The targets are smoked within a certain range around each target, simulating a realistic smoking behaviour.
At random intervals, a new target is smoked.

#####  1.1) ACT_ASSIST_SMOKE_TARGETS_ZONE constructor:

* [ACT_ASSIST_SMOKE_TARGETS_ZONE:New()](#act_assist_smoke_targets_zone-new-targetsetunit-targetzone): Creates a new ACT_ASSIST_SMOKE_TARGETS_ZONE object.



## ACT_ASSIST Class
<pre>
Inheritance : The ACT_ASSIST Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ASSIST
</pre>


### ACT_ASSIST:New()

<h4> Parameters </h4>
* [ACT_ASSIST](#act_assist-class-)
self

<h4> Returns </h4>
* [ACT_ASSIST](#act_assist-class-)



### ACT_ASSIST:onafterStart(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIST](#act_assist-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ASSIST:onafterStop(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIST](#act_assist-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## ACT_ASSIST_SMOKE_TARGETS_ZONE Class
<pre>
Inheritance : The ACT_ASSIST_SMOKE_TARGETS_ZONE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ASSIST
					`-- ACT_ASSIST_SMOKE_TARGETS_ZONE
</pre>

<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class-) TargetSetUnit
* [ZONE_BASE](#zone_base-class-) TargetZone


### ACT_ASSIST_SMOKE_TARGETS_ZONE:New(TargetSetUnit, TargetZone)

<h4> Parameters </h4>
* [ACT_ASSIST_SMOKE_TARGETS_ZONE](#act_assist_smoke_targets_zone-class-)
self
* [SET_UNIT](#set_unit-class-) TargetSetUnit
* [ZONE_BASE](#zone_base-class-) TargetZone

<h4> Returns </h4>

### ACT_ASSIST_SMOKE_TARGETS_ZONE:Init(TargetSetUnit, TargetZone)

<h4> Parameters </h4>
* [ACT_ASSIST_SMOKE_TARGETS_ZONE](#act_assist_smoke_targets_zone-class-)
self
* [SET_UNIT](#set_unit-class-) TargetSetUnit
* [ZONE_BASE](#zone_base-class-) TargetZone

<h4> Returns </h4>
* [ACT_ASSIST_SMOKE_TARGETS_ZONE](#act_assist_smoke_targets_zone-class-)



### ACT_ASSIST_SMOKE_TARGETS_ZONE:onenterSmoking(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIST_SMOKE_TARGETS_ZONE](#act_assist_smoke_targets_zone-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

