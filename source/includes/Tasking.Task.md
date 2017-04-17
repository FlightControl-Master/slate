# Tasking.Task Module
**Tasking** -- This module contains the TASK class.






#####  Authors: FlightControl - Design and Programming

## TASK Class
<pre>
Inheritance : The TASK Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
</pre>
<h4> Attributes </h4>

* [SCHEDULER](#scheduler-class) TaskScheduler
* [MISSION](#mission-class) Mission
* [SET_GROUP](#set_group-class) SetGroup : The Set of Groups assigned to the Task
* [FSM_PROCESS](#fsm_process-class) FsmTemplate
* [MISSION](#mission-class) Mission
* [COMMANDCENTER](#commandcenter-class) CommandCenter


### TASK:OnAfterPlayerAborted(PlayerUnit, PlayerName)
FSM PlayerAborted event handler prototype for TASK.

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) PlayerUnit : The Unit of the Player when he went back to spectators or left the mission.
* <u>String</u> PlayerName : The name of the Player.

<h4> Returns </h4>

### TASK:OnAfterPlayerCrashed(PlayerUnit, PlayerName)
FSM PlayerCrashed event handler prototype for TASK.

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) PlayerUnit : The Unit of the Player when he crashed in the mission.
* <u>String</u> PlayerName : The name of the Player.

<h4> Returns </h4>

### TASK:OnAfterPlayerDead(PlayerUnit, PlayerName)
FSM PlayerDead event handler prototype for TASK.

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) PlayerUnit : The Unit of the Player when he died in the mission.
* <u>String</u> PlayerName : The name of the Player.

<h4> Returns </h4>

### TASK:Fail()
FSM Fail synchronous event function for TASK.
Use this event to Fail the Task.

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:Abort()
FSM Abort synchronous event function for TASK.
Use this event to Abort the Task.

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:Success()
FSM Success synchronous event function for TASK.
Use this event to make the Task a Success.

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:Cancel()
FSM Cancel synchronous event function for TASK.
Use this event to Cancel the Task.

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:Replan()
FSM Replan synchronous event function for TASK.
Use this event to Replan the Task.

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:New(Mission, SetGroupAssign, TaskName, TaskType)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [MISSION](#mission-class) Mission : The mission wherein the Task is registered.
* [SET_GROUP](#set_group-class) SetGroupAssign : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task
* <u>String</u> TaskType : The type of the Task

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:GetUnitProcess()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class) self


### TASK:SetUnitProcess(self)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [FSM_PROCESS](#fsm_process-class) self

<h4> Returns </h4>

### TASK:JoinUnit(PlayerUnit, PlayerGroup)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) PlayerUnit : The CLIENT or UNIT of the Player joining the Mission.
* [GROUP](#group-class) PlayerGroup : The GROUP of the player joining the Mission.

<h4> Returns </h4>
* <u>Boolean</u> true : if Unit is part of the Task.


### TASK:AbortUnit(PlayerUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) PlayerUnit : The CLIENT or UNIT of the Player aborting the Task.

<h4> Returns </h4>
* <u>Boolean</u> true : if Unit is part of the Task.


### TASK:CrashUnit(PlayerUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) PlayerUnit : The CLIENT or UNIT of the Player aborting the Task.

<h4> Returns </h4>
* <u>Boolean</u> true : if Unit is part of the Task.


### TASK:GetMission()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* [MISSION](#mission-class) self


### TASK:GetGroups()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class) self


### TASK:AssignToGroup(TaskGroup)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) TaskGroup

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:HasGroup(FindGroup)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) FindGroup

<h4> Returns </h4>
* <u>Boolean</u> self


### TASK:AssignToUnit(TaskUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:UnAssignFromUnit(TaskUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:SetTimeOut (Timer)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* #integer Timer : in seconds

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:MessageToGroups()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:SendBriefingToAssignedGroups()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:UnAssignFromGroups()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:UnAssignFromGroup()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsAssignedToGroup(TaskGroup)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) TaskGroup

<h4> Returns </h4>
* <u>Boolean</u> self


### TASK:HasAliveUnits()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>Boolean</u> self


### TASK:SetMenu(MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:SetMenuForGroup(MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:SetPlannedMenuForGroup(TaskGroup, MenuText, MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) TaskGroup
* <u>String</u> MenuText : The menu text.
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:SetAssignedMenuForGroup(TaskGroup, MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) TaskGroup
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:RemoveMenu(MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:RemovePlannedMenuForGroup(TaskGroup, MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) TaskGroup
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:RemoveAssignedMenuForGroup(TaskGroup, MenuTime)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [GROUP](#group-class) TaskGroup
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:MenuTaskStatus()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:MenuTaskAbort()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:GetTaskName()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> TaskName


### TASK:GetProcessTemplate(ProcessName)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> ProcessName

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class) self


### TASK:FailProcesses(TaskUnitName)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> TaskUnitName

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:SetStateMachine(TaskUnit, Fsm)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) TaskUnit
* [FSM_PROCESS](#fsm_process-class) Fsm

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:GetStateMachine(TaskUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class) self


### TASK:RemoveStateMachine(TaskUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:HasStateMachine(TaskUnit)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:GetScoring()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* [SCORING](#scoring-class) Scoring


### TASK:GetTaskIndex()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> The : Task ID


### TASK:SetName(TaskName)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> TaskName

<h4> Returns </h4>

### TASK:GetName()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> The : Task Name


### TASK:SetType(TaskType)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> TaskType

<h4> Returns </h4>

### TASK:GetType()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> TaskType


### TASK:SetID(TaskID)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> TaskID

<h4> Returns </h4>

### TASK:GetID()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> TaskID


### TASK:StateSuccess()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateSuccess()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StateFailed()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateFailed()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StatePlanned()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStatePlanned()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StateAborted()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateAborted()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StateCancelled()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateCancelled()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StateAssigned()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateAssigned()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StateHold()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateHold()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:StateReplanned()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:IsStateReplanned()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:GetStateString()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>

### TASK:SetBriefing(TaskBriefing)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> TaskBriefing

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:onenterAssigned(Event, From, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterSuccess(Event, From, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterAborted(From, Event, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### TASK:onafterReplan(From, Event, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterFailed(From, Event, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### TASK:onstatechange(Event, From, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterPlanned(Event, From, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onbeforeTimeOut(Event, From, To)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:SetDispatcher(Dispatcher)

<h4> Parameters </h4>
* [TASK](#task-class)
self
* [DETECTION_MANAGER](#detection_manager-class) Dispatcher

<h4> Returns </h4>
* [TASK](#task-class)
self


### TASK:ReportSummary()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> self


### TASK:ReportDetails()

<h4> Parameters </h4>
* [TASK](#task-class)
self

<h4> Returns </h4>
* <u>String</u> self


