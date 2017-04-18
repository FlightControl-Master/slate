# Actions.Assign Module
(SP) (MP) (FSM) Accept or reject process for player (task) assignments.



#####  [ACT_ASSIGN](#act_assign-class-) FSM template class, extends [FSM_PROCESS](#fsm_process-class-)

#####  ACT_ASSIGN state machine:

This class is a state machine: it manages a process that is triggered by events causing state transitions to occur.
All derived classes from this class will start with the class name, followed by a \_. See the relevant derived class descriptions below.
Each derived class follows exactly the same process, using the same events and following the same state transitions,
but will have **different implementation behaviour** upon each event or state transition.

#####  ACT_ASSIGN **Events**:

These are the events defined in this class:

* **Start**:  Start the tasking acceptance process.
* **Assign**:  Assign the task.
* **Reject**:  Reject the task..

#####  ACT_ASSIGN **Event methods**:

Event methods are available (dynamically allocated by the state machine), that accomodate for state transitions occurring in the process.
There are two types of event methods, which you can use to influence the normal mechanisms in the state machine:

* **Immediate**: The event method has exactly the name of the event.
* **Delayed**: The event method starts with a __ + the name of the event. The first parameter of the event method is a number value, expressing the delay in seconds when the event will be executed.

#####  ACT_ASSIGN **States**:

* **UnAssigned**: The player has not accepted the task.
* **Assigned (*)**: The player has accepted the task.
* **Rejected (*)**: The player has not accepted the task.
* **Waiting**: The process is awaiting player feedback.
* **Failed (*)**: The process has failed.

(*) End states of the process.

#####  ACT_ASSIGN state transition methods:

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



#####  1) [ACT_ASSIGN_ACCEPT](#act_assign_accept-class-) class, extends [ACT_ASSIGN](#act_assign-class-)

The ACT_ASSIGN_ACCEPT class accepts by default a task for a player. No player intervention is allowed to reject the task.

#####  1.1) ACT_ASSIGN_ACCEPT constructor:

* [ACT_ASSIGN_ACCEPT:New()](#act_assign_accept-new-taskbriefing): Creates a new ACT_ASSIGN_ACCEPT object.



#####  2) [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-) class, extends [ACT_ASSIGN](#act_assign-class-)

The ACT_ASSIGN_MENU_ACCEPT class accepts a task when the player accepts the task through an added menu option.
This assignment type is useful to conditionally allow the player to choose whether or not he would accept the task.
The assignment type also allows to reject the task.

#####  2.1) ACT_ASSIGN_MENU_ACCEPT constructor:


* [ACT_ASSIGN_MENU_ACCEPT:New()](#act_assign_menu_accept-new-taskname-taskbriefing): Creates a new ACT_ASSIGN_MENU_ACCEPT object.



## ACT_ASSIGN Class
<pre>
Inheritance : The ACT_ASSIGN Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ASSIGN
</pre>

<h4> Attributes </h4>

* [TASK](#task-class-) Task
* [UNIT](#unit-class-) ProcessUnit
* [ZONE_BASE](#zone_base-class-) TargetZone


### ACT_ASSIGN:New()

<h4> Parameters </h4>
* [ACT_ASSIGN](#act_assign-class-)
self

<h4> Returns </h4>
* [ACT_ASSIGN](#act_assign-class-)
 The task acceptance process.


## ACT_ASSIGN_ACCEPT Class
<pre>
Inheritance : The ACT_ASSIGN_ACCEPT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ASSIGN
					`-- ACT_ASSIGN_ACCEPT
</pre>

<h4> Attributes </h4>

* [TASK](#task-class-) Task
* [UNIT](#unit-class-) ProcessUnit
* [ZONE_BASE](#zone_base-class-) TargetZone


### ACT_ASSIGN_ACCEPT:New(TaskBriefing)

<h4> Parameters </h4>
* [ACT_ASSIGN_ACCEPT](#act_assign_accept-class-)
self
* <u>String</u> TaskBriefing

<h4> Returns </h4>

### ACT_ASSIGN_ACCEPT:onafterStart(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIGN_ACCEPT](#act_assign_accept-class-)
self
* [UNIT](#unit-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ASSIGN_ACCEPT:onenterAssigned(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIGN_ACCEPT](#act_assign_accept-class-)
self
* [UNIT](#unit-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## ACT_ASSIGN_MENU_ACCEPT Class
<pre>
Inheritance : The ACT_ASSIGN_MENU_ACCEPT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ASSIGN
					`-- ACT_ASSIGN_MENU_ACCEPT
</pre>

<h4> Attributes </h4>

* [TASK](#task-class-) Task
* [UNIT](#unit-class-) ProcessUnit
* [ZONE_BASE](#zone_base-class-) TargetZone


### ACT_ASSIGN_MENU_ACCEPT:New(TaskName, TaskBriefing)

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self
* <u>String</u> TaskName
* <u>String</u> TaskBriefing

<h4> Returns </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)



### ACT_ASSIGN_MENU_ACCEPT:Init(TaskName, TaskBriefing)

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self
* <u>String</u> TaskName
* <u>String</u> TaskBriefing

<h4> Returns </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)



### ACT_ASSIGN_MENU_ACCEPT:onafterStart(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ASSIGN_MENU_ACCEPT:MenuAssign()

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self

<h4> Returns </h4>

### ACT_ASSIGN_MENU_ACCEPT:MenuReject()

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self

<h4> Returns </h4>

### ACT_ASSIGN_MENU_ACCEPT:onafterAssign(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ASSIGN_MENU_ACCEPT:onafterReject(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ASSIGN_MENU_ACCEPT](#act_assign_menu_accept-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

