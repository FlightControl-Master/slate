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
Create a new REPORT.

<h4> Parameters </h4>
* [REPORT](#report-class-)
self
* <u>String</u> Title

<h4> Returns </h4>
* [REPORT](#report-class-)



### REPORT:Add(Text)
Add a new line to a REPORT.

<h4> Parameters </h4>
* [REPORT](#report-class-)
self
* <u>String</u> Text

<h4> Returns </h4>
* [REPORT](#report-class-)



### REPORT:Text(Delimiter)
Produces the text of the report, taking into account an optional delimeter, which is \n by default.

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
The constructor takes an IDENTIFIABLE as the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [POSITIONABLE](#positionable-class-) CommandCenterPositionable
* <u>String</u> CommandCenterName

<h4> Returns </h4>
* [COMMANDCENTER](#commandcenter-class-)



### COMMANDCENTER:GetName()
Gets the name of the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### COMMANDCENTER:GetPositionable()
Gets the POSITIONABLE of the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* [POSITIONABLE](#positionable-class-) 


### COMMANDCENTER:GetMissions()
Get the Missions governed by the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* #list<Tasking.Mission#MISSION> 


### COMMANDCENTER:AddMission(Mission)
Add a MISSION to be governed by the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [MISSION](#mission-class-) Mission

<h4> Returns </h4>
* [MISSION](#mission-class-) 


### COMMANDCENTER:RemoveMission(Mission)
Removes a MISSION to be governed by the HQ command center.
The given Mission is not nilified.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [MISSION](#mission-class-) Mission

<h4> Returns </h4>
* [MISSION](#mission-class-) 


### COMMANDCENTER:SetMenu()
Sets the menu structure of the Missions governed by the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:GetMenu()
Gets the commandcenter menu structure governed by the HQ command center.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>
* [MENU_COALITION](#menu_coalition-class-) 


### COMMANDCENTER:HasGroup(self)
Checks of the COMMANDCENTER has a GROUP.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* [GROUP](#group-class-) self

<h4> Returns </h4>
* <u>Boolean</u> 


### COMMANDCENTER:MessageToAll()
Send a CC message to the coalition of the CC.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:MessageToGroup(Message, TaskGroup, Name)
Send a CC message to a GROUP.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self
* <u>String</u> Message
* [GROUP](#group-class-) TaskGroup
* #sring Name : (optional) The name of the Group used as a prefix for the message to the Group. If not provided, there will be nothing shown.

<h4> Returns </h4>

### COMMANDCENTER:MessageToCoalition()
Send a CC message to the coalition of the CC.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:ReportSummary()
Report the status of all MISSIONs to a GROUP.
Each Mission is listed, with an indication how many Tasks are still to be completed.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

### COMMANDCENTER:ReportDetails()
Report the status of a Task to a Group.
Report the details of a Mission, listing the Mission, and all the Task details.

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class-)
self

<h4> Returns </h4>

