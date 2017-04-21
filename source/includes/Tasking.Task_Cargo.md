# Tasking.Task_Cargo Module
**Tasking (Release 2.1)** -- The TASK_CARGO models tasks for players to transport [Cargo](#cargo-module-).

![Banner Image](/includes/Pictures/TASK_CARGO/Dia1.JPG)



The Moose framework provides various CARGO classes that allow DCS phisical or logical objects to be transported or sling loaded by Carriers.
The CARGO_ classes, as part of the moose core, are able to Board, Load, UnBoard and UnLoad cargo between Carrier units.

This collection of classes in this module define tasks for human players to handle these cargo objects.
Cargo can be transported, picked-up, deployed and sling-loaded from and to other places.

The following classes are important to consider:

* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-): Defines a task for a human player to transport a set of cargo between various zones.

==

#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-03-09: Revised version.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## TASK_CARGO Class
<pre>
Inheritance : The TASK_CARGO Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_CARGO
</pre>

### TASK_CARGO:New(Mission, SetGroup, TaskName, SetCargo, TaskType)
Instantiates a new TASK_CARGO.

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* [MISSION](#mission-class-) Mission
* [SET_GROUP](#set_group-class-) SetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* [SET_CARGO](#set_cargo-class-) SetCargo : The scope of the cargo to be transported.
* <u>String</u> TaskType : The type of Cargo task.

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:GetPlannedMenuText()

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self

<h4> Returns </h4>

### TASK_CARGO:GetCargoSet()

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)  The Cargo Set.


### TASK_CARGO:GetDeployZones()

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self

<h4> Returns </h4>
* #list<Core.Zone#ZONE_BASE>  The Deployment Zones.


### TASK_CARGO:SetCargoPickup(Cargo, TaskUnit)

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* [AI_CARGO](#ai_cargo-class-) Cargo : The cargo.
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:SetDeployZone(DeployZone, TaskUnit)

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* [ZONE](#zone-class-) DeployZone
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:AddDeployZone(DeployZone, TaskUnit)

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* [ZONE](#zone-class-) DeployZone
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:RemoveDeployZone(DeployZone, TaskUnit)

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* [ZONE](#zone-class-) DeployZone
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:SetDeployZones(DeployZones, TaskUnit)

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* @list<Core.Zone#ZONE> DeployZones
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:GetTargetZone(TaskUnit)

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [ZONE_BASE](#zone_base-class-)  The Zone object where the Target is located on the map.


### TASK_CARGO:SetScoreOnDestroy(Text, Score, TaskUnit)
Set a score when a target in scope of the A2G attack, has been destroyed .

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* <u>String</u> Text : The text to display to the player, when the target has been destroyed.
* <u>Number</u> Score : The score in points.
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:SetScoreOnSuccess(Text, Score, TaskUnit)
Set a score when all the targets in scope of the A2G attack, have been destroyed.

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* <u>String</u> Text : The text to display to the player, when all targets hav been destroyed.
* <u>Number</u> Score : The score in points.
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



### TASK_CARGO:SetPenaltyOnFailed(Text, Penalty, TaskUnit)
Set a penalty when the A2G attack has failed.

<h4> Parameters </h4>
* [TASK_CARGO](#task_cargo-class-)
self
* <u>String</u> Text : The text to display to the player, when the A2G attack has failed.
* <u>Number</u> Penalty : The penalty in points.
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [TASK_CARGO](#task_cargo-class-)



## TASK_CARGO_TRANSPORT Class
<pre>
Inheritance : The TASK_CARGO_TRANSPORT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
			`-- TASK
				`-- TASK_CARGO
					`-- TASK_CARGO_TRANSPORT
</pre>


### TASK_CARGO_TRANSPORT:New(Mission, SetGroup, TaskName, SetCargo)
Instantiates a new TASK_CARGO_TRANSPORT.

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* [MISSION](#mission-class-) Mission
* [SET_GROUP](#set_group-class-) SetGroup : The set of groups for which the Task can be assigned.
* <u>String</u> TaskName : The name of the Task.
* [SET_CARGO](#set_cargo-class-) SetCargo : The scope of the cargo to be transported.

<h4> Returns </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)



### TASK_CARGO_TRANSPORT:OnBeforeCargoPickedUp(From, Event, To, TaskUnit, Cargo)
OnBefore Transition Handler for Event CargoPickedUp.
@function [parent=#TASK_CARGO_TRANSPORT] OnBeforeCargoPickedUp

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [UNIT](#unit-class-) TaskUnit : The Unit (Client) that PickedUp the cargo. You can use this to retrieve the PlayerName etc.
* [CARGO](#cargo-class-) Cargo : The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### TASK_CARGO_TRANSPORT:OnAfterCargoPickedUp(From, Event, To, TaskUnit, Cargo)
OnAfter Transition Handler for Event CargoPickedUp.
@function [parent=#TASK_CARGO_TRANSPORT] OnAfterCargoPickedUp

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [UNIT](#unit-class-) TaskUnit : The Unit (Client) that PickedUp the cargo. You can use this to retrieve the PlayerName etc.
* [CARGO](#cargo-class-) Cargo : The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.

<h4> Returns </h4>

### TASK_CARGO_TRANSPORT:CargoPickedUp(TaskUnit, Cargo)
Synchronous Event Trigger for Event CargoPickedUp.
@function [parent=#TASK_CARGO_TRANSPORT] CargoPickedUp

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* [UNIT](#unit-class-) TaskUnit : The Unit (Client) that PickedUp the cargo. You can use this to retrieve the PlayerName etc.
* [CARGO](#cargo-class-) Cargo : The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.

<h4> Returns </h4>

### TASK_CARGO_TRANSPORT:OnBeforeCargoDeployed(From, Event, To, TaskUnit, Cargo, DeployZone)
OnBefore Transition Handler for Event CargoDeployed.
@function [parent=#TASK_CARGO_TRANSPORT] OnBeforeCargoDeployed

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [UNIT](#unit-class-) TaskUnit : The Unit (Client) that Deployed the cargo. You can use this to retrieve the PlayerName etc.
* [CARGO](#cargo-class-) Cargo : The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.
* [ZONE](#zone-class-) DeployZone : The zone where the Cargo got Deployed or UnBoarded.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### TASK_CARGO_TRANSPORT:OnAfterCargoDeployed(From, Event, To, TaskUnit, Cargo, DeployZone)
OnAfter Transition Handler for Event CargoDeployed.
@function [parent=#TASK_CARGO_TRANSPORT] OnAfterCargoDeployed

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [UNIT](#unit-class-) TaskUnit : The Unit (Client) that Deployed the cargo. You can use this to retrieve the PlayerName etc.
* [CARGO](#cargo-class-) Cargo : The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.
* [ZONE](#zone-class-) DeployZone : The zone where the Cargo got Deployed or UnBoarded.

<h4> Returns </h4>

### TASK_CARGO_TRANSPORT:CargoDeployed(TaskUnit, Cargo, DeployZone)
Synchronous Event Trigger for Event CargoDeployed.
@function [parent=#TASK_CARGO_TRANSPORT] CargoDeployed

<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self
* [UNIT](#unit-class-) TaskUnit : The Unit (Client) that Deployed the cargo. You can use this to retrieve the PlayerName etc.
* [CARGO](#cargo-class-) Cargo : The Cargo that got PickedUp by the TaskUnit. You can use this to check Cargo Status.
* [ZONE](#zone-class-) DeployZone : The zone where the Cargo got Deployed or UnBoarded.

<h4> Returns </h4>

### TASK_CARGO_TRANSPORT:IsAllCargoTransported()


<h4> Parameters </h4>
* [TASK_CARGO_TRANSPORT](#task_cargo_transport-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


