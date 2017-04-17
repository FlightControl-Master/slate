# Tasking.Mission Module
A MISSION is the main owner of a Mission orchestration within MOOSE	. The Mission framework orchestrates [CLIENT](#client-module)s, [TASK](#task-module)s, [STAGE](#stage-module)s etc.
A [CLIENT](#client-module) needs to be registered within the [MISSION](#mission-module) through the function [AddClient](#addclient-module). A [TASK](#task-module) needs to be registered within the [MISSION](#mission-module) through the function [AddTask](#addtask-module).
## MISSION Class
<pre>
Inheritance : The MISSION Class inherits from the following parents :
BASE
	`-- FSM
		`-- MISSION
</pre>

<h4> Attributes </h4>

* [Clients](#mission-clients-class) _Clients
* [MENU_COALITION](#menu_coalition-class) MissionMenu
* <u>String</u> MissionBriefing


### MISSION:New(CommandCenter, MissionName, MissionPriority, MissionBriefing, MissionCoalition)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [COMMANDCENTER](#commandcenter-class) CommandCenter
* <u>String</u> MissionName : is the name of the mission. This name will be used to reference the status of each mission by the players.
* <u>String</u> MissionPriority : is a string indicating the "priority" of the Mission. f.e. "Primary", "Secondary" or "First", "Second". It is free format and up to the Mission designer to choose. There are no rules behind this field.
* <u>String</u> MissionBriefing : is a string indicating the mission briefing to be shown when a player joins a [CLIENT](#client-module).
* Dcs.DCSCoalitionWrapper.Object#coalition MissionCoalition : is a string indicating the coalition or party to which this mission belongs to. It is free format and can be chosen freely by the mission designer. Note that this field is not to be confused with the coalition concept of the ME. Examples of a Mission Coalition could be "NATO", "CCCP", "Intruders", "Terrorists"...

<h4> Returns </h4>
* [MISSION](#mission-class)
self


### MISSION:OnLeaveIdle(From, Event, To)
OnLeave Transition Handler for State Idle.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnEnterIdle(From, Event, To)
OnEnter Transition Handler for State Idle.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnLeaveOngoing(From, Event, To)
OnLeave Transition Handler for State Ongoing.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnEnterOngoing(From, Event, To)
OnEnter Transition Handler for State Ongoing.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeStart(From, Event, To)
OnBefore Transition Handler for Event Start.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnAfterStart(From, Event, To)
OnAfter Transition Handler for Event Start.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Start()
Synchronous Event Trigger for Event Start.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>

### MISSION:OnLeaveIdle(From, Event, To)
OnLeave Transition Handler for State Idle.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnEnterIdle(From, Event, To)
OnEnter Transition Handler for State Idle.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeStop(From, Event, To)
OnBefore Transition Handler for Event Stop.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnAfterStop(From, Event, To)
OnAfter Transition Handler for Event Stop.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Stop()
Synchronous Event Trigger for Event Stop.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>

### MISSION:OnLeaveCompleted(From, Event, To)
OnLeave Transition Handler for State Completed.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnEnterCompleted(From, Event, To)
OnEnter Transition Handler for State Completed.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeComplete(From, Event, To)
OnBefore Transition Handler for Event Complete.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnAfterComplete(From, Event, To)
OnAfter Transition Handler for Event Complete.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Complete()
Synchronous Event Trigger for Event Complete.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>

### MISSION:OnLeaveFailed(From, Event, To)
OnLeave Transition Handler for State Failed.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnEnterFailed(From, Event, To)
OnEnter Transition Handler for State Failed.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:OnBeforeFail(From, Event, To)
OnBefore Transition Handler for Event Fail.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### MISSION:OnAfterFail(From, Event, To)
OnAfter Transition Handler for Event Fail.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### MISSION:Fail()
Synchronous Event Trigger for Event Fail.

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>

### MISSION:GetName()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* [MISSION](#mission-class)
self


### MISSION:JoinUnit(PlayerUnit, PlayerGroup)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [UNIT](#unit-class) PlayerUnit : The CLIENT or UNIT of the Player joining the Mission.
* [GROUP](#group-class) PlayerGroup : The GROUP of the player joining the Mission.

<h4> Returns </h4>
* <u>Boolean</u> true : if Unit is part of a Task in the Mission.


### MISSION:AbortUnit(PlayerUnit)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [UNIT](#unit-class) PlayerUnit : The CLIENT or UNIT of the Player joining the Mission.

<h4> Returns </h4>
* <u>Boolean</u> true : if Unit is part of a Task in the Mission.


### MISSION:CrashUnit(PlayerUnit)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [UNIT](#unit-class) PlayerUnit : The CLIENT or UNIT of the Player crashing.

<h4> Returns </h4>
* <u>Boolean</u> true : if Unit is part of a Task in the Mission.


### MISSION:AddScoring()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* [MISSION](#mission-class)
self


### MISSION:GetScoring()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* [SCORING](#scoring-class)
Scoring


### MISSION:GetGroups()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class) self


### MISSION:SetMenu(MenuTime)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>

### MISSION:RemoveMenu(MenuTime)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* <u>Number</u> MenuTime

<h4> Returns </h4>

### MISSION:GetCommandCenter()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* [COMMANDCENTER](#commandcenter-class) self


### MISSION:RemoveTaskMenu(Task)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [TASK](#task-class) Task

<h4> Returns </h4>
* [MISSION](#mission-class)
self


### MISSION:GetMenu(TaskGroup)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [GROUP](#group-class) TaskGroup

<h4> Returns </h4>
* [MENU_COALITION](#menu_coalition-class) self


### GetTask()

<h4> Parameters </h4>
* <u>String</u> TaskName : The Name of the [Task](#task-module) within the [Mission](#mission-module).

<h4> Returns </h4>
* [TASK](#task-class) The : Task
* <u>Nil</u> Returns : nil if no task was found.


### MISSION:AddTask(Task)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [TASK](#task-class) Task : is the [Task](#task-module) object.

<h4> Returns </h4>
* [TASK](#task-class) The : task added.


### MISSION:RemoveTask(Task)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [TASK](#task-class) Task : is the [Task](#task-module) object.

<h4> Returns </h4>
* <u>Nil</u> The : cleaned Task reference.


### MISSION:GetNextTaskID(Task)

<h4> Parameters </h4>
* [MISSION](#mission-class)
self
* [TASK](#task-class) Task : is the [Task](#task-module) object.

<h4> Returns </h4>
* [TASK](#task-class) The : task added.


### MISSION:IsCompleted()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>Boolean</u> self


### MISSION:IsIdle()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>Boolean</u> self


### MISSION:IsOngoing()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>Boolean</u> self


### MISSION:IsFailed()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>Boolean</u> self


### MISSION:IsHold()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>Boolean</u> self


### MISSION:HasGroup()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if the Mission has a Group.


### MISSION:ReportSummary()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>String</u> self


### MISSION:ReportOverview()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>String</u> self


### MISSION:ReportDetails()

<h4> Parameters </h4>
* [MISSION](#mission-class)
self

<h4> Returns </h4>
* <u>String</u> self


### MISSION.GetTasks(()
``` lua
-- Get Tasks from the Mission.
Tasks = Mission:GetTasks()
env.info( "Task 2 Completion = " .. Tasks[2]:GetGoalPercentage() .. "%" )
```

<h4> Parameters </h4>
<h4> Returns </h4>
* {TASK,...} Structure : of TASKS with the [TASK](#task-module) number as the key.


