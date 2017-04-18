# Actions.Process_JTAC Module
## PROCESS_JTAC Class
<pre>
Inheritance : The PROCESS_JTAC Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- PROCESS_JTAC
</pre>

<h4> Attributes </h4>

* [UNIT](#unit-class-) ProcessUnit
* [SET_UNIT](#set_unit-class-) TargetSetUnit


### PROCESS_JTAC:New(Task, ProcessUnit, TargetSetUnit, FACUnit)

<h4> Parameters </h4>
* [PROCESS_JTAC](#process_jtac-class-)
self
* [TASK](#task-class-) Task
* [UNIT](#unit-class-) ProcessUnit
* [SET_UNIT](#set_unit-class-) TargetSetUnit
* [UNIT](#unit-class-) FACUnit

<h4> Returns </h4>
* [PROCESS_JTAC](#process_jtac-class-)



### PROCESS_JTAC:OnStart(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_JTAC](#process_jtac-class-)
self
* [FSM_PROCESS](#fsm_process-class-) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_JTAC:OnJTACMenuUpdate(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_JTAC](#process_jtac-class-)
self
* [FSM_PROCESS](#fsm_process-class-) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_JTAC:OnJTACMenuAwait(Fsm, Event, From, To)

<h4> Parameters </h4>
* [PROCESS_JTAC](#process_jtac-class-)
self
* [FSM_PROCESS](#fsm_process-class-) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### PROCESS_JTAC:OnJTACMenuSpot(Fsm, Event, From, To, TargetUnit)

<h4> Parameters </h4>
* [PROCESS_JTAC](#process_jtac-class-)
self
* [FSM_PROCESS](#fsm_process-class-) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class-) TargetUnit

<h4> Returns </h4>

### PROCESS_JTAC:OnJTACMenuCancel(Fsm, Event, From, To, TargetUnit)

<h4> Parameters </h4>
* [PROCESS_JTAC](#process_jtac-class-)
self
* [FSM_PROCESS](#fsm_process-class-) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class-) TargetUnit

<h4> Returns </h4>

