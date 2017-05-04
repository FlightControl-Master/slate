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

* [SCHEDULER](#scheduler-class-) TaskScheduler
* [MISSION](#mission-class-) Mission
* [SET_GROUP](#set_group-class-) SetGroup : The Set of Groups assigned to the Task
* [FSM_PROCESS](#fsm_process-class-) FsmTemplate
* [MISSION](#mission-class-) Mission
* [COMMANDCENTER](#commandcenter-class-) CommandCenter


### TASK:OnAfterPlayerAborted(PlayerUnit, PlayerName)
FSM PlayerAborted event handler prototype for TASK.
@function [parent=#TASK] OnAfterPlayerAborted

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The Unit of the Player when he went back to spectators or left the mission.
* <u>String</u> PlayerName : The name of the Player.

<h4> Returns </h4>

### TASK:OnAfterPlayerCrashed(PlayerUnit, PlayerName)
FSM PlayerCrashed event handler prototype for TASK.
@function [parent=#TASK] OnAfterPlayerCrashed

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The Unit of the Player when he crashed in the mission.
* <u>String</u> PlayerName : The name of the Player.

<h4> Returns </h4>

### TASK:OnAfterPlayerDead(PlayerUnit, PlayerName)
FSM PlayerDead event handler prototype for TASK.
@function [parent=#TASK] OnAfterPlayerDead

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The Unit of the Player when he died in the mission.
* <u>String</u> PlayerName : The name of the Player.

<h4> Returns </h4>

### TASK:Fail()
FSM Fail synchronous event function for TASK.
Use this event to Fail the Task.
@function [parent=#TASK] Fail

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:Abort()
FSM Abort synchronous event function for TASK.
Use this event to Abort the Task.
@function [parent=#TASK] Abort

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:Success()
FSM Success synchronous event function for TASK.
Use this event to make the Task a Success.
@function [parent=#TASK] Success

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:Cancel()
FSM Cancel synchronous event function for TASK.
Use this event to Cancel the Task.
@function [parent=#TASK] Cancel

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:Replan()
FSM Replan synchronous event function for TASK.
Use this event to Replan the Task.
@function [parent=#TASK] Replan

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:New(Mission, SetGroupAssign, TaskName, TaskType)
Instantiates a new TASK. Should never be used. Interface Class.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [MISSION](#mission-class-) Mission : The mission wherein the Task is registered.
* [SET_GROUP](#set_group-class-) SetGroupAssign : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task
* <u>String</u> TaskType : The type of the Task

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:GetUnitProcess()
Get the Task FSM Process Template

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-) 


### TASK:SetUnitProcess(self)
Sets the Task FSM Process Template

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [FSM_PROCESS](#fsm_process-class-) self

<h4> Returns </h4>

### TASK:JoinUnit(PlayerUnit, PlayerGroup)
Add a PlayerUnit to join the Task.
For each Group within the Task, the Unit is checked if it can join the Task.
If the Unit was not part of the Task, false is returned.
If the Unit is part of the Task, true is returned.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The CLIENT or UNIT of the Player joining the Mission.
* [GROUP](#group-class-) PlayerGroup : The GROUP of the player joining the Mission.

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is part of the Task.


### TASK:AbortUnit(PlayerUnit)
Abort a PlayerUnit from a Task.
If the Unit was not part of the Task, false is returned.
If the Unit is part of the Task, true is returned.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The CLIENT or UNIT of the Player aborting the Task.

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is part of the Task.


### TASK:CrashUnit(PlayerUnit)
A PlayerUnit crashed in a Task. Abort the Player.
If the Unit was not part of the Task, false is returned.
If the Unit is part of the Task, true is returned.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The CLIENT or UNIT of the Player aborting the Task.

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is part of the Task.


### TASK:GetMission()
Gets the Mission to where the TASK belongs.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* [MISSION](#mission-class-) 


### TASK:GetGroups()
Gets the SET_GROUP assigned to the TASK.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-) 


### TASK:AssignToGroup(TaskGroup)
Assign the [Task](#task-module-) to a [Group](#group-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) TaskGroup

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:HasGroup(FindGroup)


<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) FindGroup

<h4> Returns </h4>
* <u>Boolean</u> 


### TASK:AssignToUnit(TaskUnit)
Assign the [Task](#task-module-) to an alive [Unit](#unit-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:UnAssignFromUnit(TaskUnit)
UnAssign the [Task](#task-module-) from an alive [Unit](#unit-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:SetTimeOut (Timer)
Sets the TimeOut for the [Task](#task-module-). If [Task](#task-module-) stayed planned for longer than TimeOut, it gets into Cancelled status.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* #integer Timer : in seconds

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:MessageToGroups()
Send a message of the [Task](#task-module-) to the assigned [Group](#group-module-)s.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:SendBriefingToAssignedGroups()
Send the briefng message of the [Task](#task-module-) to the assigned [Group](#group-module-)s.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:UnAssignFromGroups()
UnAssign the [Task](#task-module-) from the [Group](#group-module-)s.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:UnAssignFromGroup()
UnAssign the [Task](#task-module-) from a [Group](#group-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsAssignedToGroup(TaskGroup)
Returns if the [Task](#task-module-) is assigned to the Group.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) TaskGroup

<h4> Returns </h4>
* <u>Boolean</u> 


### TASK:HasAliveUnits()
Returns if the [Task](#task-module-) has still alive and assigned Units.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### TASK:SetMenuForGroup(MenuTime)
Set the Menu for a Group

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:SetPlannedMenuForGroup(TaskGroup, MenuText, MenuTime)
Set the planned menu option of the [Task](#task-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) TaskGroup
* <u>String</u> MenuText : The menu text.
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:SetAssignedMenuForGroup(TaskGroup, MenuTime)
Set the assigned menu options of the [Task](#task-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) TaskGroup
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:RemoveMenu(MenuTime)
Remove the menu options of the [Task](#task-module-) to all the groups in the SetGroup.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:RemovePlannedMenuForGroup(TaskGroup, MenuTime)
Remove the menu option of the [Task](#task-module-) for a [Group](#group-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) TaskGroup
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:RemoveAssignedMenuForGroup(TaskGroup, MenuTime)
Remove the assigned menu option of the [Task](#task-module-) for a [Group](#group-module-).

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [GROUP](#group-class-) TaskGroup
* <u>Number</u> MenuTime

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:MenuTaskStatus()
Report the task status.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:MenuTaskAbort()
Report the task status.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:GetTaskName()
Returns the [Task](#task-module-) name.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### TASK:GetProcessTemplate(ProcessName)
Get the default or currently assigned [Process](#process-module-) template with key ProcessName.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> ProcessName

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-) 


### TASK:FailProcesses(TaskUnitName)
Fail processes from [Task](#task-module-) with key [Unit](#unit-module-)

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> TaskUnitName

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:SetStateMachine(TaskUnit, Fsm)
Add a FiniteStateMachine to [Task](#task-module-) with key Task[Unit](#unit-module-)

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) TaskUnit
* [FSM_PROCESS](#fsm_process-class-) Fsm

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:GetStateMachine(TaskUnit)
Gets the FiniteStateMachine of [Task](#task-module-) with key Task[Unit](#unit-module-)

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-) 


### TASK:RemoveStateMachine(TaskUnit)
Remove FiniteStateMachines from [Task](#task-module-) with key Task[Unit](#unit-module-)

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:HasStateMachine(TaskUnit)
Checks if there is a FiniteStateMachine assigned to Task[Unit](#unit-module-) for [Task](#task-module-)

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:GetScoring()
Gets the Scoring of the task

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* [SCORING](#scoring-class-) 


### TASK:GetTaskIndex()
Gets the Task Index, which is a combination of the Task type, the Task name.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* <u>String</u>  The Task ID


### TASK:SetName(TaskName)
Sets the Name of the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> TaskName

<h4> Returns </h4>

### TASK:GetName()
Gets the Name of the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* <u>String</u>  The Task Name


### TASK:SetType(TaskType)
Sets the Type of the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> TaskType

<h4> Returns </h4>

### TASK:SetInfo(TaskInfo)
Sets the Information on the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> TaskInfo

<h4> Returns </h4>

### TASK:GetType()
Gets the Type of the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### TASK:SetID(TaskID)
Sets the ID of the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> TaskID

<h4> Returns </h4>

### TASK:GetID()
Gets the ID of the Task

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### TASK:StateSuccess()
Sets a [Task](#task-module-) to status **Success**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateSuccess()
Is the [Task](#task-module-) status **Success**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StateFailed()
Sets a [Task](#task-module-) to status **Failed**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateFailed()
Is the [Task](#task-module-) status **Failed**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StatePlanned()
Sets a [Task](#task-module-) to status **Planned**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStatePlanned()
Is the [Task](#task-module-) status **Planned**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StateAborted()
Sets a [Task](#task-module-) to status **Aborted**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateAborted()
Is the [Task](#task-module-) status **Aborted**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StateCancelled()
Sets a [Task](#task-module-) to status **Cancelled**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateCancelled()
Is the [Task](#task-module-) status **Cancelled**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StateAssigned()
Sets a [Task](#task-module-) to status **Assigned**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateAssigned()
Is the [Task](#task-module-) status **Assigned**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StateHold()
Sets a [Task](#task-module-) to status **Hold**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateHold()
Is the [Task](#task-module-) status **Hold**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:StateReplanned()
Sets a [Task](#task-module-) to status **Replanned**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:IsStateReplanned()
Is the [Task](#task-module-) status **Replanned**.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:GetStateString()
Gets the [Task](#task-module-) status.

<h4> Parameters </h4>
* [TASK](#task-class-)
self

<h4> Returns </h4>

### TASK:SetBriefing(TaskBriefing)
Sets a [Task](#task-module-) briefing.

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> TaskBriefing

<h4> Returns </h4>
* [TASK](#task-class-)



### TASK:onenterAssigned(Event, From, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterSuccess(Event, From, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterAborted(From, Event, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### TASK:onafterReplan(From, Event, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterFailed(From, Event, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### TASK:onstatechange(Event, From, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onenterPlanned(Event, From, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:onbeforeTimeOut(Event, From, To)
FSM function for a TASK

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### TASK:SetDispatcher(Dispatcher)
Set dispatcher of a task

<h4> Parameters </h4>
* [TASK](#task-class-)
self
* [DETECTION_MANAGER](#detection_manager-class-) Dispatcher

<h4> Returns </h4>
* [TASK](#task-class-)



