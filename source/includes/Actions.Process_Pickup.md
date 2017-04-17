# Actions.Process_Pickup Module
## PROCESS_PICKUP Class
<pre>
Inheritance : The PROCESS_PICKUP Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- PROCESS_PICKUP
</pre>

<h4> Attributes </h4>

* [UNIT](#unit-class) ProcessUnit
* [SET_UNIT](#set_unit-class) TargetSetUnit


### PROCESS_PICKUP:New(Task, ProcessUnit, TargetSetUnit)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [TASK](#task-class) Task
* [UNIT](#unit-class) ProcessUnit
* [SET_UNIT](#set_unit-class) TargetSetUnit

<h4> Returns </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self


### PROCESS_PICKUP:OnStart(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_PICKUP:OnNavigating(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_PICKUP:OnHitTarget(Fsm, Event, From, To, Event)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [EVENTDATA](#eventdata-class) Event

<h4> Returns </h4>

### PROCESS_PICKUP:OnMoreTargets(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_PICKUP:OnKilled(Fsm, Event, From, To, DCSEvent)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [EVENTDATA](#eventdata-class) DCSEvent

<h4> Returns </h4>

### PROCESS_PICKUP:OnRestart(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_PICKUP:OnDestroyed(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [FSM_PROCESS](#fsm_process-class) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_PICKUP:EventDead(Event)

<h4> Parameters </h4>
* [PROCESS_PICKUP](#process_pickup-class)
self
* [EVENTDATA](#eventdata-class) Event

<h4> Returns </h4>

