# Tasking.Mission Module
A MISSION is the main owner of a Mission orchestration within MOOSE	. The Mission framework orchestrates [CLIENT](#client-module-)s, [TASK](#task-module-)s, [STAGE](#stage-module-)s etc.
A [CLIENT](#client-module-) needs to be registered within the [MISSION](#mission-module-) through the function [AddClient](#addclient-module-). A [TASK](#task-module-) needs to be registered within the [MISSION](#mission-module-) through the function [AddTask](#addtask-module-).
## MISSION Class
<pre>
Inheritance : The MISSION Class inherits from the following parents :
BASE
	`-- FSM
		`-- MISSION
</pre>

<h4> Attributes </h4>

* [Clients](#mission-clients-class-)_Clients
* [MENU_COALITION](#menu_coalition-class-) MissionMenu
* <u>String</u> MissionBriefing


### MISSION:New(CommandCenter, MissionName, MissionPriority, MissionBriefing, MissionCoalition)
This is the main MISSION declaration method. Each Mission is like the master or a Mission orchestration between, Clients, Tasks, Stages etc.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [COMMANDCENTER](#commandcenter-class-) CommandCenter
* <u>String</u> MissionName : is the name of the mission. This name will be used to reference the status of each mission by the players.
* <u>String</u> MissionPriority : is a string indicating the "priority" of the Mission. f.e. "Primary", "Secondary" or "First", "Second". It is free format and up to the Mission designer to choose. There are no rules behind this field.
* <u>String</u> MissionBriefing : is a string indicating the mission briefing to be shown when a player joins a [CLIENT](#client-module-).
* Dcs.DCSCoalitionWrapper.Object#coalition MissionCoalition : is a string indicating the coalition or party to which this mission belongs to. It is free format and can be chosen freely by the mission designer. Note that this field is not to be confused with the coalition concept of the ME. Examples of a Mission Coalition could be "NATO", "CCCP", "Intruders", "Terrorists"...

<h4> Returns </h4>
* [MISSION](#mission-class-)



### MISSION:OnLeaveIdle(From, Event, To)
OnLeave Transition Handler for State Idle.
@function [parent=#MISSION] OnLeaveIdle

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnEnterIdle(From, Event, To)
OnEnter Transition Handler for State Idle.
@function [parent=#MISSION] OnEnterIdle

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnLeaveOngoing(From, Event, To)
OnLeave Transition Handler for State Ongoing.
@function [parent=#MISSION] OnLeaveOngoing

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnEnterOngoing(From, Event, To)
OnEnter Transition Handler for State Ongoing.
@function [parent=#MISSION] OnEnterOngoing

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeStart(From, Event, To)
OnBefore Transition Handler for Event Start.
@function [parent=#MISSION] OnBeforeStart

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnAfterStart(From, Event, To)
OnAfter Transition Handler for Event Start.
@function [parent=#MISSION] OnAfterStart

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Start()
Synchronous Event Trigger for Event Start.
@function [parent=#MISSION] Start

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>

### MISSION:OnLeaveIdle(From, Event, To)
OnLeave Transition Handler for State Idle.
@function [parent=#MISSION] OnLeaveIdle

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnEnterIdle(From, Event, To)
OnEnter Transition Handler for State Idle.
@function [parent=#MISSION] OnEnterIdle

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeStop(From, Event, To)
OnBefore Transition Handler for Event Stop.
@function [parent=#MISSION] OnBeforeStop

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnAfterStop(From, Event, To)
OnAfter Transition Handler for Event Stop.
@function [parent=#MISSION] OnAfterStop

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Stop()
Synchronous Event Trigger for Event Stop.
@function [parent=#MISSION] Stop

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>

### MISSION:OnLeaveCompleted(From, Event, To)
OnLeave Transition Handler for State Completed.
@function [parent=#MISSION] OnLeaveCompleted

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnEnterCompleted(From, Event, To)
OnEnter Transition Handler for State Completed.
@function [parent=#MISSION] OnEnterCompleted

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeComplete(From, Event, To)
OnBefore Transition Handler for Event Complete.
@function [parent=#MISSION] OnBeforeComplete

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnAfterComplete(From, Event, To)
OnAfter Transition Handler for Event Complete.
@function [parent=#MISSION] OnAfterComplete

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Complete()
Synchronous Event Trigger for Event Complete.
@function [parent=#MISSION] Complete

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>

### MISSION:OnLeaveFailed(From, Event, To)
OnLeave Transition Handler for State Failed.
@function [parent=#MISSION] OnLeaveFailed

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnEnterFailed(From, Event, To)
OnEnter Transition Handler for State Failed.
@function [parent=#MISSION] OnEnterFailed

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeFail(From, Event, To)
OnBefore Transition Handler for Event Fail.
@function [parent=#MISSION] OnBeforeFail

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### MISSION:OnAfterFail(From, Event, To)
OnAfter Transition Handler for Event Fail.
@function [parent=#MISSION] OnAfterFail

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Fail()
Synchronous Event Trigger for Event Fail.
@function [parent=#MISSION] Fail

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>

### MISSION:GetName()
Gets the mission name.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* [MISSION](#mission-class-)



### MISSION:JoinUnit(PlayerUnit, PlayerGroup)
Add a Unit to join the Mission.
For each Task within the Mission, the Unit is joined with the Task.
If the Unit was not part of a Task in the Mission, false is returned.
If the Unit is part of a Task in the Mission, true is returned.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The CLIENT or UNIT of the Player joining the Mission.
* [GROUP](#group-class-) PlayerGroup : The GROUP of the player joining the Mission.

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is part of a Task in the Mission.


### MISSION:AbortUnit(PlayerUnit)
Aborts a PlayerUnit from the Mission.
For each Task within the Mission, the PlayerUnit is removed from Task where it is assigned.
If the Unit was not part of a Task in the Mission, false is returned.
If the Unit is part of a Task in the Mission, true is returned.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The CLIENT or UNIT of the Player joining the Mission.

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is part of a Task in the Mission.


### MISSION:CrashUnit(PlayerUnit)
Handles a crash of a PlayerUnit from the Mission.
For each Task within the Mission, the PlayerUnit is removed from Task where it is assigned.
If the Unit was not part of a Task in the Mission, false is returned.
If the Unit is part of a Task in the Mission, true is returned.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The CLIENT or UNIT of the Player crashing.

<h4> Returns </h4>
* <u>Boolean</u>  true if Unit is part of a Task in the Mission.


### MISSION:AddScoring()
Add a scoring to the mission.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* [MISSION](#mission-class-)



### MISSION:GetScoring()
Get the scoring object of a mission.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### MISSION:GetGroups()
Get the groups for which TASKS are given in the mission

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-) 


### MISSION:SetMenu(MenuTime)
Sets the Planned Task menu.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>

### MISSION:RemoveMenu(MenuTime)
Removes the Planned Task menu.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>

### MISSION:GetCommandCenter()
Gets the COMMANDCENTER.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* [COMMANDCENTER](#commandcenter-class-) 


### MISSION:RemoveTaskMenu(Task)
Removes a Task menu.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [TASK](#task-class-) Task

<h4> Returns </h4>
* [MISSION](#mission-class-)



### MISSION:GetMenu(TaskGroup)
Gets the mission menu for the coalition.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [GROUP](#group-class-) TaskGroup

<h4> Returns </h4>
* [MENU_COALITION](#menu_coalition-class-) 


### GetTask()
Get the TASK identified by the TaskNumber from the Mission. This function is useful in GoalFunctions.

<h4> Parameters </h4>
* <u>String</u> TaskName : The Name of the [Task](#task-module-) within the [Mission](#mission-module-).

<h4> Returns </h4>
* [TASK](#task-class-)  The Task
* <u>Nil</u>  Returns nil if no task was found.


### MISSION:AddTask(Task)
Register a [Task](#task-module-) to be completed within the [Mission](#mission-module-).
Note that there can be multiple [Task](#task-module-)s registered to be completed.
Each Task can be set a certain Goals. The Mission will not be completed until all Goals are reached.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [TASK](#task-class-) Task : is the [Task](#task-module-) object.

<h4> Returns </h4>
* [TASK](#task-class-)  The task added.


### MISSION:RemoveTask(Task)
Removes a [Task](#task-module-) to be completed within the [Mission](#mission-module-).
Note that there can be multiple [Task](#task-module-)s registered to be completed.
Each Task can be set a certain Goals. The Mission will not be completed until all Goals are reached.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [TASK](#task-class-) Task : is the [Task](#task-module-) object.

<h4> Returns </h4>
* <u>Nil</u>  The cleaned Task reference.


### MISSION:GetNextTaskID(Task)
Return the next [Task](#task-module-) ID to be completed within the [Mission](#mission-module-).

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self
* [TASK](#task-class-) Task : is the [Task](#task-module-) object.

<h4> Returns </h4>
* [TASK](#task-class-)  The task added.


### MISSION:IsCompleted()
Is the [Mission](#mission-module-) **Completed**.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### MISSION:IsIdle()
Is the [Mission](#mission-module-) **Idle**.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### MISSION:IsOngoing()
Is the [Mission](#mission-module-) **Ongoing**.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### MISSION:IsFailed()
Is the [Mission](#mission-module-) **Failed**.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### MISSION:IsHold()
Is the [Mission](#mission-module-) **Hold**.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### MISSION:HasGroup()
Validates if the Mission has a Group

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if the Mission has a Group.


### MISSION:ReportSummary()
Create a summary report of the Mission (one line).

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### MISSION:ReportOverview()
Create a overview report of the Mission (multiple lines).

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### MISSION:ReportDetails()
Create a detailed report of the Mission, listing all the details of the Task.

<h4> Parameters </h4>
* [MISSION](#mission-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### MISSION.GetTasks()
``` lua
-- Get Tasks from the Mission.
Tasks = Mission:GetTasks()
env.info( "Task 2 Completion = " .. Tasks[2]:GetGoalPercentage() .. "%" )
```

<h4> Parameters </h4>
<h4> Returns </h4>
* {TASK,...}  Structure of TASKS with the [TASK](#task-module-) number as the key.


