# Tasking.CommandCenter Module
A COMMANDCENTER is the owner of multiple missions within MOOSE.
A COMMANDCENTER governs multiple missions, the tasking and the reporting.
## REPORT Class
<pre>
Inheritance : The REPORT Class inherits from the following parents :
BASE
	`-- REPORT
</pre>


### REPORT:New(Title)

<h4> Parameters </h4>
* [REPORT](#report-class-)
self
* <u>String</u> Title

<h4> Returns </h4>
* [REPORT](#report-class-)



### REPORT:Add(Text)

<h4> Parameters </h4>
* [REPORT](#report-class-)
self
* <u>String</u> Text

<h4> Returns </h4>
* [REPORT](#report-class-)



### REPORT:Text(Delimiter)

<h4> Parameters </h4>
* [REPORT](#report-class-)
self
* <u>String</u> Delimiter : (optional) A delimiter text.

<h4> Returns </h4>
* <u>String</u>  The report text.


## COMMANDCENTER Class
<pre>
Inheritance : The COMMANDCENTER Class inherits from the following parents :
BASE
	`-- COMMANDCENTER
</pre>

<h4> Attributes </h4>

* [GROUP](#group-class-) HQ
* Dcs.DCSCoalitionWrapper.Object#coalition CommandCenterCoalition


### COMMANDCENTER:New(CommandCenterPositionable, CommandCenterName)

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [POSITIONABLE](#positionable-class-) CommandCenterPositionable
* <u>String</u> CommandCenterName

<h4> Returns </h4>
* [COMMANDCENTER](#commandcenter-class-)



### COMMANDCENTER:GetName()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### COMMANDCENTER:GetPositionable()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* [POSITIONABLE](#positionable-class-) 


### COMMANDCENTER:GetMissions()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* #list<Tasking.Mission#MISSION> 


### COMMANDCENTER:AddMission(Mission)

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [MISSION](#mission-class-) Mission

<h4> Returns </h4>
* [MISSION](#mission-class-) 


### COMMANDCENTER:RemoveMission(Mission)

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [MISSION](#mission-class-) Mission

<h4> Returns </h4>
* [MISSION](#mission-class-) 


### COMMANDCENTER:SetMenu()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:GetMenu()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* [MENU_COALITION](#menu_coalition-class-) 


### COMMANDCENTER:HasGroup(self)

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [GROUP](#group-class-) self

<h4> Returns </h4>
* <u>Boolean</u> 


### COMMANDCENTER:MessageToAll()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:MessageToGroup(Message, TaskGroup, Name)

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* <u>String</u> Message
* [GROUP](#group-class-) TaskGroup
* #sring Name : (optional) The name of the Group used as a prefix for the message to the Group. If not provided, there will be nothing shown.

<h4> Returns </h4>

### COMMANDCENTER:MessageToCoalition()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:ReportSummary()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:ReportDetails()

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

