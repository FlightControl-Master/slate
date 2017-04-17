# Tasking.Task_A2G Module
**Tasking** - The TASK_A2G models tasks for players in Air to Ground engagements.

![Banner Image](/includes/Pictures/TASK_A2G/Dia1.JPG)


#####  1) @{Task_A2G#TASK_A2G} class, extends [TASK](#task-class)

The @{#TASK_A2G} class defines Air To Ground tasks for a [Set](#set-module) of Target Units,
based on the tasking capabilities defined in [TASK](#task-class).
The TASK_A2G is implemented using a [FSM_TASK](#fsm_task-class), and has the following statuses:

* **None**: Start of the process
* **Planned**: The A2G task is planned.
* **Assigned**: The A2G task is assigned to a [GROUP](#group-class).
* **Success**: The A2G task is successfully completed.
* **Failed**: The A2G task has failed. This will happen if the player exists the task early, without communicating a possible cancellation to HQ.

#####  1.1) Set the scoring of achievements in an A2G attack.

Scoring or penalties can be given in the following circumstances:

* @{#TASK_A2G.SetScoreOnDestroy}(): Set a score when a target in scope of the A2G attack, has been destroyed.
* @{#TASK_A2G.SetScoreOnSuccess}(): Set a score when all the targets in scope of the A2G attack, have been destroyed.
* @{#TASK_A2G.SetPenaltyOnFailed}(): Set a penalty when the A2G attack has failed.

#####  2) [TASK_SEAD](#task_sead-class) class, extends @{Task_A2G#TASK_A2G}

The [TASK_SEAD](#task_sead-class) class defines a SEAD task for a [Set](#set-module) of Target Units.



#####  3) [TASK_CAS](#task_cas-class) class, extends @{Task_A2G#TASK_A2G}

The [TASK_CAS](#task_cas-class) class defines a CAS task for a [Set](#set-module) of Target Units.



#####  4) [TASK_BAI](#task_bai-class) class, extends @{Task_A2G#TASK_A2G}

The [TASK_BAI](#task_bai-class) class defines a BAI task for a [Set](#set-module) of Target Units.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-03-09: Revised version.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **[WingThor]**: Concept, Advice & Testing.

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## TASK_A2G Class
<pre>
Inheritance : The TASK_A2G Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_A2G
</pre>

<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) TargetSetUnit


### TASK_A2G:New(Mission, SetGroup, TaskName, UnitSetTargets, TargetDistance, TargetZone)

<h4> Parameters </h4>
* #TASK_A2G self
* [MISSION](#mission-class) Mission
* [SET_GROUP](#set_group-class) SetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* [SET_UNIT](#set_unit-class) UnitSetTargets
* <u>Number</u> TargetDistance : The distance to Target when the Player is considered to have "arrived" at the engagement range.
* [ZONE_BASE](#zone_base-class) TargetZone : The target zone, if known.

<h4> Returns </h4>
* #TASK_A2G self


### TASK_A2G:GetPlannedMenuText()

<h4> Parameters </h4>
* #TASK_A2G self

<h4> Returns </h4>

### TASK_A2G:SetRendezVousPointVec2(RendezVousPointVec2, RendezVousRange, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [POINT_VEC2](#point_vec2-class) RendezVousPointVec2 : The PointVec2 object referencing to the 2D point where the RendezVous point is located on the map.
* <u>Number</u> RendezVousRange : The RendezVousRange that defines when the player is considered to have arrived at the RendezVous point.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>

### TASK_A2G:GetRendezVousPointVec2(TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) The : PointVec2 object referencing to the 2D point where the RendezVous point is located on the map.
* <u>Number</u> The : RendezVousRange that defines when the player is considered to have arrived at the RendezVous point.


### TASK_A2G:SetRendezVousZone(RendezVousZone, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [ZONE_BASE](#zone_base-class) RendezVousZone : The Zone object where the RendezVous is located on the map.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>

### TASK_A2G:GetRendezVousZone(TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [ZONE_BASE](#zone_base-class) The : Zone object where the RendezVous is located on the map.


### TASK_A2G:SetTargetPointVec2(TargetPointVec2, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [POINT_VEC2](#point_vec2-class) TargetPointVec2 : The PointVec2 object where the Target is located on the map.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>

### TASK_A2G:GetTargetPointVec2(TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) The : PointVec2 object where the Target is located on the map.


### TASK_A2G:SetTargetZone(TargetZone, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [ZONE_BASE](#zone_base-class) TargetZone : The Zone object where the Target is located on the map.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>

### TASK_A2G:GetTargetZone(TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* [ZONE_BASE](#zone_base-class) The : Zone object where the Target is located on the map.


### TASK_A2G:SetScoreOnDestroy(Text, Score, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* <u>String</u> Text : The text to display to the player, when the target has been destroyed.
* <u>Number</u> Score : The score in points.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* #TASK_A2G self


### TASK_A2G:SetScoreOnSuccess(Text, Score, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* <u>String</u> Text : The text to display to the player, when all targets hav been destroyed.
* <u>Number</u> Score : The score in points.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* #TASK_A2G self


### TASK_A2G:SetPenaltyOnFailed(Text, Penalty, TaskUnit)

<h4> Parameters </h4>
* #TASK_A2G self
* <u>String</u> Text : The text to display to the player, when the A2G attack has failed.
* <u>Number</u> Penalty : The penalty in points.
* [UNIT](#unit-class) TaskUnit

<h4> Returns </h4>
* #TASK_A2G self


## TASK_SEAD Class
<pre>
Inheritance : The TASK_SEAD Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_SEAD
</pre>

<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) TargetSetUnit


### TASK_SEAD:New(Mission, SetGroup, TaskName, TargetSetUnit)

<h4> Parameters </h4>
* [TASK_SEAD](#task_sead-class)
self
* [MISSION](#mission-class) Mission
* [SET_GROUP](#set_group-class) SetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* [SET_UNIT](#set_unit-class) TargetSetUnit

<h4> Returns </h4>
* [TASK_SEAD](#task_sead-class)
self


## TASK_BAI Class
<pre>
Inheritance : The TASK_BAI Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_BAI
</pre>

<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) TargetSetUnit


### TASK_BAI:New(Mission, SetGroup, TaskName, UnitSetTargets, TargetDistance, TargetZone)

<h4> Parameters </h4>
* [TASK_BAI](#task_bai-class)
self
* [MISSION](#mission-class) Mission
* [SET_GROUP](#set_group-class) SetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* [SET_UNIT](#set_unit-class) UnitSetTargets
* <u>Number</u> TargetDistance : The distance to Target when the Player is considered to have "arrived" at the engagement range.
* [ZONE_BASE](#zone_base-class) TargetZone : The target zone, if known.

<h4> Returns </h4>
* [TASK_BAI](#task_bai-class)
self


## TASK_CAS Class
<pre>
Inheritance : The TASK_CAS Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_CAS
</pre>

<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) TargetSetUnit


### TASK_CAS:New(Mission, SetGroup, TaskName, UnitSetTargets, TargetDistance, TargetZone)

<h4> Parameters </h4>
* [TASK_CAS](#task_cas-class)
self
* [MISSION](#mission-class) Mission
* [SET_GROUP](#set_group-class) SetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* [SET_UNIT](#set_unit-class) UnitSetTargets
* <u>Number</u> TargetDistance : The distance to Target when the Player is considered to have "arrived" at the engagement range.
* [ZONE_BASE](#zone_base-class) TargetZone : The target zone, if known.

<h4> Returns </h4>
* [TASK_CAS](#task_cas-class)
self


