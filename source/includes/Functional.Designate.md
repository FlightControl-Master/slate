# Functional.Designate Module
**Funtional R2.1** -- Management of target **Designation**.

--![Banner Image](/includes/Pictures/DESIGNATE/Dia1.JPG)



DESIGNATE is orchestrating the designation of potential targets executed by a Recce group,
and communicates these to a dedicated attacking group of players,
so that following a dynamically generated menu system,
each detected set of potential targets can be lased or smoked...

Targets can be:

* **Lased** for a period of time.
* **Smoked**. Artillery or airplanes with Illuminatino ordonance need to be present. (WIP, but early demo ready.)
* **Illuminated** through an illumination bomb. Artillery or airplanes with Illuminatino ordonance need to be present. (WIP, but early demo ready.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* [**Ciribob**](https://forums.eagle.ru/member.php?u=112175): Showing the way how to lase targets + how laser codes work!!! Explained the autolase script.
* [**EasyEB**](https://forums.eagle.ru/member.php?u=112055): Ideas and Beta Testing
* [**Wingthor**](https://forums.eagle.ru/member.php?u=123698): Beta Testing


#####  Authors:

* **FlightControl**: Design & Programming

## DESIGNATE Class
<pre>
Inheritance : The DESIGNATE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- DESIGNATE
</pre>

DESIGNATE is orchestrating the designation of potential targets executed by a Recce group,
and communicates these to a dedicated attacking group of players,
so that following a dynamically generated menu system,
each detected set of potential targets can be lased or smoked...

Targets can be:

* **Lased** for a period of time.
* **Smoked**. Artillery or airplanes with Illuminatino ordonance need to be present. (WIP, but early demo ready.)
* **Illuminated** through an illumination bomb. Artillery or airplanes with Illuminatino ordonance need to be present. (WIP, but early demo ready.

The following terminology is being used throughout this document:

* The **DesignateObject** is the object of the DESIGNATE class, which is this class explained in the document.
* The **DetectionObject** is the object of a DETECTION_ class (DETECTION_TYPES, DETECTION_AREAS, DETECTION_UNITS), which is executing the detection and grouping of Targets into _DetectionItems_.
* **DetectionItems** is the list of detected target groupings by the _DetectionObject_. Each _DetectionItem_ contains a _TargetSet_.
* **DetectionItem** is one element of the _DetectionItems_ list, and contains a _TargetSet_.
* The **TargetSet** is a SET_UNITS collection of _Targets_, that have been detected by the _DetectionObject_.
* A **Target** is a detected UNIT object by the _DetectionObject_.
* A **Threat Level** is a number from 0 to 10 that is calculated based on the threat of the Target in an Air to Ground battle scenario.
* The **RecceSet** is a SET_GROUP collection that contains the **RecceGroups**.
* A **RecceGroup** is a GROUP object containing the **Recces**.
* A **Recce** is a UNIT object executing the reconnaissance as part the _DetectionObject_. A Recce can be of any UNIT type.
* An **AttackGroup** is a GROUP object that contain _Players_.
* A **Player** is an active CLIENT object containing a human player.
* A **Designate Menu** is the menu that is dynamically created during the designation process for each _AttackGroup_.

The RecceSet is continuously detecting for potential Targets, executing its task as part of the DetectionObject.
Once Targets have been detected, the DesignateObject will trigger the **Detect Event**.

As part of the Detect Event, the DetectionItems list is used by the DesignateObject to provide the Players with:

* The RecceGroups are reporting to each AttackGroup, sending **Messages** containing the Threat Level and the TargetSet composition.
* **Menu options** are created and updated for each AttackGroup, containing the Threat Level and the TargetSet composition.

A Player can then select an action from the Designate Menu.

**Note that each selected action will be executed for a TargetSet, thus the Target grouping done by the DetectionObject.**

Each **Menu Option** in the Designate Menu has two modes:

1. If the TargetSet **is not being designated**, then the **Designate Menu** option for the target Set will provide options to **Lase** or **Smoke** the targets.
2. If the Target Set **is being designated**, then the **Designate Menu** option will provide an option to stop or cancel the designation.

While designating, the RecceGroups will report any change in TargetSet composition or Target presence.

The following logic is executed when a TargetSet is selected to be *lased* from the Designation Menu:

* The RecceSet is searched for any Recce that is within *designation distance* from a Target in the TargetSet that is currently not being designated.
* If there is a Recce found that is currently no designating a target, and is within designation distance from the Target, then that Target will be designated.
* During designation, any Recce that does not have Line of Sight (LOS) and is not within disignation distance from the Target, will stop designating the Target, and a report is given.
* When a Recce is designating a Target, and that Target is destroyed, then the Recce will stop designating the Target, and will report the event.
* When a Recce is designating a Target, and that Recce is destroyed, then the Recce will be removed from the RecceSet and designation will stop without reporting.
* When all RecceGroups are destroyed from the RecceSet, then the DesignationObject will stop functioning, and nothing will be reported.

In this way, the DesignationObject assists players to designate ground targets for a coordinated attack!

Have FUN!

#####  1. DESIGNATE constructor

* [DESIGNATE:New()](#designate-new-cc-detection-attackset): Creates a new DESIGNATE object.

#####  2. DESIGNATE is a FSM

![Process](/includes/Pictures/DESIGNATE/Dia2.JPG)

#####  2.1 DESIGNATE States

* **Designating** ( Group ): The process is not started yet.

#####  2.2 DESIGNATE Events

* **DESIGNATE-Detect-**: Detect targets.
* **DESIGNATE-LaseOn-**: Lase the targets with the specified Index.
* **DESIGNATE-LaseOff-**: Stop lasing the targets with the specified Index.
* **DESIGNATE-Smoke-**: Smoke the targets with the specified Index.
* **DESIGNATE-Status-**: Report designation status.

#####  3. Laser codes

#####  3.1 Set possible laser codes

An array of laser codes can be provided, that will be used by the DESIGNATE when lasing.
The laser code is communicated by the Recce when it is lasing a larget.
Note that the default laser code is 1113.
Working known laser codes are: 1113,1462,1483,1537,1362,1214,1131,1182,1644,1614,1515,1411,1621,1138,1542,1678,1573,1314,1643,1257,1467,1375,1341,1275,1237

Use the method DESIGNATE-SetLaserCodes- to set the possible laser codes to be selected from.
One laser code can be given or an sequence of laser codes through an table...

Designate:SetLaserCodes( 1214 )

The above sets one laser code with the value 1214.

Designate:SetLaserCodes( { 1214, 1131, 1614, 1138 } )

The above sets a collection of possible laser codes that can be assigned. **Note the { } notation!**

#####  3.2 Auto generate laser codes

Use the method DESIGNATE-GenerateLaserCodes- to generate all possible laser codes. Logic implemented and advised by Ciribob!

#####  4. Autolase to automatically lase detected targets.

DetectionItems can be auto lased once detected by Recces. As such, there is almost no action required from the Players using the Designate Menu.
The **auto lase** function can be activated through the Designation Menu.
Use the method DESIGNATE-SetAutoLase- to activate or deactivate the auto lase function programmatically.
Note that autolase will automatically activate lasing for ALL DetectedItems. Individual items can be switched-off if required using the Designation Menu.

Designate:SetAutoLase( true )

Activate the auto lasing.

#####  5. Target prioritization on threat level

Targets can be detected of different types in one DetectionItem. Depending on the type of the Target, a different threat level applies in an Air to Ground combat context.
SAMs are of a higher threat than normal tanks. So, if the Target type was recognized, the Recces will select those targets that form the biggest threat first,
and will continue this until the remaining vehicles with the lowest threat have been reached.

This threat level prioritization can be activated using the method DESIGNATE-SetThreatLevelPrioritization-.
If not activated, Targets will be selected in a random order, but most like those first which are the closest to the Recce marking the Target.

Designate:SetThreatLevelPrioritization( true )

The example will activate the threat level prioritization for this the Designate object. Threats will be marked based on the threat level of the Target.

#####  6. Status Report

A status report is available that displays the current Targets detected, grouped per DetectionItem, and a list of which Targets are currently being marked.

* The status report can be shown by selecting "Status" -> "Report Status" from the Designation menu .
* The status report can be automatically flashed by selecting "Status" -> "Flash Status On".
* The automatic flashing of the status report can be deactivated by selecting "Status" -> "Flash Status Off".
* The flashing of the status menu is disabled by default.
* The method DESIGNATE-FlashStatusMenu- can be used to enable or disable to flashing of the status menu.

Designate:FlashStatusMenu( true )

The example will activate the flashing of the status menu for this Designate object.





### DESIGNATE:New(CC, Detection, AttackSet)
DESIGNATE Constructor. This class is an abstract class and should not be instantiated.

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self
* [COMMANDCENTER](#commandcenter-class-) CC
* [DETECTION_BASE](#detection_base-class-) Detection
* [SET_GROUP](#set_group-class-) AttackSet : The Attack collection of GROUP objects to designate and report for.

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:OnBeforeDetect(From, Event, To)
Detect Handler OnBefore for DESIGNATE
@function [parent=#DESIGNATE] OnBeforeDetect

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>
* <u>Boolean</u> 


### DESIGNATE:OnAfterDetect(From, Event, To)
Detect Handler OnAfter for DESIGNATE
@function [parent=#DESIGNATE] OnAfterDetect

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### DESIGNATE:Detect()
Detect Trigger for DESIGNATE
@function [parent=#DESIGNATE] Detect

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:OnBeforeIlluminate(From, Event, To)
Illuminate Handler OnBefore for DESIGNATE
@function [parent=#DESIGNATE] OnBeforeIlluminate

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>
* <u>Boolean</u> 


### DESIGNATE:OnAfterIlluminate(From, Event, To)
Illuminate Handler OnAfter for DESIGNATE
@function [parent=#DESIGNATE] OnAfterIlluminate

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### DESIGNATE:Illuminate()
Illuminate Trigger for DESIGNATE
@function [parent=#DESIGNATE] Illuminate

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:onafterDetect()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:SendStatus(AttackGroup, Duration)
Sends the status to the Attack Groups.

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self
* [GROUP](#group-class-) AttackGroup
* <u>Number</u> Duration : The time in seconds the report should be visible.

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:ActivateAutoLase()
Coordinates the Auto Lase.

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:SetDesignateMenu()
Sets the Designate Menu.

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:MenuStatus()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:MenuFlashStatus()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:MenuAutoLase()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:MenuSmoke()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:MenuIlluminate()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:MenuLaseOn()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:MenuLaseOff()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:onafterLaseOn()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>

### DESIGNATE:onafterLasing()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:onafterLaseOff()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:onafterSmoke()


<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:onafterIlluminate()
Illuminating

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



### DESIGNATE:onafterDone()
Done

<h4> Parameters </h4>
* [DESIGNATE](#designate-class-)
self

<h4> Returns </h4>
* [DESIGNATE](#designate-class-)



