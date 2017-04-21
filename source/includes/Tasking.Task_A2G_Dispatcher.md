# Tasking.Task_A2G_Dispatcher Module
**Tasking** - The TASK_A2G_DISPATCHER creates and manages player TASK_A2G tasks based on detected targets.



#####  1) @{#TASK_A2G_DISPATCHER} class, extends [DETECTION_MANAGER](#detection_manager-class-)

The @{#TASK_A2G_DISPATCHER} class implements the dynamic dispatching of tasks upon groups of detected units determined a [Set](#set-module-) of FAC (groups).
The FAC will detect units, will group them, and will dispatch [Task](#task-module-)s to groups. Depending on the type of target detected, different tasks will be dispatched.
Find a summary below describing for which situation a task type is created:

* **CAS Task**: Is created when there are enemy ground units within range of the FAC, while there are friendly units in the FAC perimeter.
* **BAI Task**: Is created when there are enemy ground units within range of the FAC, while there are NO other friendly units within the FAC perimeter.
* **SEAD Task**: Is created when there are enemy ground units wihtin range of the FAC, with air search radars.

Other task types will follow...

##### 3.1) TASK_A2G_DISPATCHER constructor:

The @{#TASK_A2G_DISPATCHER.New}() method creates a new TASK_A2G_DISPATCHER instance.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-03-09: Initial class and API.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## TASK_A2G_DISPATCHER Class
<pre>
Inheritance : The TASK_A2G_DISPATCHER Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_MANAGER
			`-- TASK_A2G_DISPATCHER
</pre>

<h4> Attributes </h4>

* [SET_GROUP](#set_group-class-) SetGroup : The groups to which the FAC will report to.
* [DETECTION_BASE](#detection_base-class-) Detection : The DETECTION_BASE object that is used to report the detected objects.
* [MISSION](#mission-class-) Mission


### TASK_A2G_DISPATCHER:New(Mission, SetGroup, Detection)
TASK_A2G_DISPATCHER constructor.

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* [MISSION](#mission-class-) Mission : The mission for which the task dispatching is done.
* [SET_GROUP](#set_group-class-) SetGroup : The set of groups that can join the tasks within the mission.
* [DETECTION_BASE](#detection_base-class-) Detection : The detection results that are used to dynamically assign new tasks to human players.

<h4> Returns </h4>
* #TASK_A2G_DISPATCHER 


### TASK_A2G_DISPATCHER:OnAfterAssign(From, Event, To, Task, TaskUnit, PlayerName)
OnAfter Transition Handler for Event Assign.
@function [parent=#TASK_A2G_DISPATCHER] OnAfterAssign

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [TASK_A2G](#task_a2g-class-) Task
* [UNIT](#unit-class-) TaskUnit
* <u>String</u> PlayerName

<h4> Returns </h4>

### TASK_A2G_DISPATCHER:EvaluateSEAD(DetectedItem)
Creates a SEAD task when there are targets for it.

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* [DETECTION_AREAS.DetectedItem](#detection_areas.detecteditem-class-) DetectedItem

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)  TargetSetUnit: The target set of units.
* <u>Nil</u>  If there are no targets to be set.


### TASK_A2G_DISPATCHER:EvaluateCAS(DetectedItem)
Creates a CAS task when there are targets for it.

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* [DETECTION_AREAS.DetectedItem](#detection_areas.detecteditem-class-) DetectedItem

<h4> Returns </h4>
* [TASK](#task-class-) 


### TASK_A2G_DISPATCHER:EvaluateBAI(DetectedItem)
Creates a BAI task when there are targets for it.

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* [DETECTION_AREAS.DetectedItem](#detection_areas.detecteditem-class-) DetectedItem

<h4> Returns </h4>
* [TASK](#task-class-) 


### TASK_A2G_DISPATCHER:EvaluateRemoveTask(Mission, Task, DetectedItem)
Evaluates the removal of the Task from the Mission.
Can only occur when the DetectedItem is Changed AND the state of the Task is "Planned".

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* [MISSION](#mission-class-) Mission
* [TASK](#task-class-) Task
* [DETECTION_AREAS.DetectedItem](#detection_areas.detecteditem-class-) DetectedItem

<h4> Returns </h4>
* [TASK](#task-class-) 


### TASK_A2G_DISPATCHER:ProcessDetected(Detection)
Assigns tasks in relation to the detected items to the [SET_GROUP](#set_group-class-).

<h4> Parameters </h4>
* #TASK_A2G_DISPATCHER self
* [DETECTION_BASE](#detection_base-class-) Detection : The detection created by the [DETECTION_BASE](#detection_base-class-) derived object.

<h4> Returns </h4>
* <u>Boolean</u>  Return true if you want the task assigning to continue... false will cancel the loop.


