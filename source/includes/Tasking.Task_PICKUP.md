# Tasking.Task_PICKUP Module
This module contains the TASK_PICKUP classes.

##### 1) [TASK_PICKUP](#task_pickup-class-) class, extends [TASK](#task-class-)

The [TASK_PICKUP](#task_pickup-class-) class defines a pickup task of a [Set](#set-module-) of [CARGO](#cargo-module-) objects defined within the mission.
based on the tasking capabilities defined in [TASK](#task-class-).
The TASK_PICKUP is implemented using a [FSM_TASK](#fsm_task-class-), and has the following statuses:

* **None**: Start of the process
* **Planned**: The SEAD task is planned. Upon Planned, the sub-process [ACT_ASSIGN_ACCEPT](#act_assign_accept-class-) is started to accept the task.
* **Assigned**: The SEAD task is assigned to a [GROUP](#group-class-). Upon Assigned, the sub-process [ACT_ROUTE](#act_route-class-) is started to route the active Units in the Group to the attack zone.
* **Success**: The SEAD task is successfully completed. Upon Success, the sub-process [PROCESS_SEAD](#process_sead-class-) is started to follow-up successful SEADing of the targets assigned in the task.
* **Failed**: The SEAD task has failed. This will happen if the player exists the task early, without communicating a possible cancellation to HQ.



#####  Authors: FlightControl - Design and Programming

## TASK_PICKUP Class
<pre>
Inheritance : The TASK_PICKUP Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_PICKUP
</pre>


### TASK_PICKUP:New(Mission, AssignedSetGroup, TaskName, TaskType, UnitSetTargets, TargetZone)
Instantiates a new TASK_PICKUP.

<h4> Parameters </h4>
* [TASK_PICKUP](#task_pickup-class-)
self
* [MISSION](#mission-class-) Mission
* [SET_GROUP](#set_group-class-) AssignedSetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* <u>String</u> TaskType : BAI or CAS
* [SET_UNIT](#set_unit-class-) UnitSetTargets
* [ZONE_BASE](#zone_base-class-) TargetZone

<h4> Returns </h4>
* [TASK_PICKUP](#task_pickup-class-)



### TASK_PICKUP:CleanUp()
Removes a TASK_PICKUP.

<h4> Parameters </h4>
* [TASK_PICKUP](#task_pickup-class-)
self

<h4> Returns </h4>
* <u>Nil</u> 


### TASK_PICKUP:AssignToUnit(TaskUnit)
Assign the [Task](#task-module-) to a [Unit](#unit-module-).

<h4> Parameters </h4>
* [TASK_PICKUP](#task_pickup-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_PICKUP](#task_pickup-class-)



### TASK_PICKUP:OnNext(Fsm, Event, From, To, Event)
StateMachine callback function for a TASK

<h4> Parameters </h4>
* [TASK_PICKUP](#task_pickup-class-)
self
* [FSM_TASK](#fsm_task-class-) Fsm
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>

### TASK_PICKUP:GetPlannedMenuText()

<h4> Parameters </h4>
* [TASK_PICKUP](#task_pickup-class-)
self

<h4> Returns </h4>

