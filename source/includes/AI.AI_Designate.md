# AI.AI_Designate Module
**AI (Release 2.1)** -- Management of target designation.

--![Banner Image](/includes/Pictures/DESIGNATE/Dia1.JPG)



## AI_DESIGNATE Class
<pre>
Inheritance : The AI_DESIGNATE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_DESIGNATE
</pre>

AI_DESIGNATE is orchestrating the designation of potential targets executed by a Recce group,
and communicates these to a dedicated attacking group of players,
so that following a dynamically generated menu system,
each detected set of potential targets can be lased or smoked...

The Recce group is detecting as part of the DETECTION_ class continuously targets.
Once targets have been detected, they will be reported. The AI_DESIGNATE object will fire the **Detect** event in this case!
As part of the reporting, the following happens:

* A message is sent to each GROUP of the Attack SET_GROUP, containing the threat level and the target composition.
* A menu is created and updated for each GROUP of the Attack SET_GROUP, containing the the treat level and the target composition.

One of the players in one of the Attack GROUPs, can then select a Target Set by selecting one of the menu options.
Each menu option has two modes:

* If the Target Set is not being designated, then the Designate menu for the target Set will provide options to Lase or Smoke the targets.
* If the Target Set is being designated, then the Designate menu will provide an option to cancel the designation.

In this way, the AI can assist players to designate ground targets for a coordinated attack!

Have FUN!

#####  1. AI_DESIGNATE constructor

* [AI_DESIGNATE:New()](#ai_designate-new-detection-groupset): Creates a new AI_DESIGNATE object.

#####  2. AI_DESIGNATE is a FSM

![Process](µ)

#####  2.1 AI_DESIGNATE States

* **Designating** ( Group ): The process is not started yet.

#####  2.2 AI_DESIGNATE Events

* **AI_DESIGNATE-Detect-**: Detect targets.
* **AI_DESIGNATE-LaseOn-**: Lase the targets with the specified Index.
* **AI_DESIGNATE-LaseOff-**: Stop lasing the targets with the specified Index.
* **AI_DESIGNATE-Smoke-**: Smoke the targets with the specified Index.
* **AI_DESIGNATE-Status-**: Report designation status.

#####  3. Set laser codes

An array of laser codes can be provided, that will be used by the AI_DESIGNATE when lasing.
The laser code is communicated by the Recce when it is lasing a larget.
Note that the default laser code is 1113.
Working known laser codes are: 1113,1462,1483,1537,1362,1214,1131,1182,1644,1614,1515,1411,1621,1138,1542,1678,1573,1314,1643,1257,1467,1375,1341,1275,1237

Use the method [AI_DESIGNATE:SetLaserCodes()](#ai_designate-setlasercodes-lasercodes) to set the possible laser codes to be selected from.
One laser code can be given or an sequence of laser codes through an table...

AIDesignate:SetLaserCodes( 1214 )

The above sets one laser code with the value 1214.

AIDesignate:SetLaserCodes( { 1214, 1131, 1614, 1138 } )

The above sets a collection of possible laser codes that can be assigned. **Note the { } notation!**







### AI_DESIGNATE:New(Detection, GroupSet)
AI_DESIGNATE Constructor. This class is an abstract class and should not be instantiated.

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self
* [DETECTION_BASE](#detection_base-class-) Detection
* [SET_GROUP](#set_group-class-) GroupSet : The set of groups to designate for.

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:OnBeforeDetect(From, Event, To)
Detect Handler OnBefore for AI_DESIGNATE
@function [parent=#AI_DESIGNATE] OnBeforeDetect

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>
* <u>Boolean</u> 


### AI_DESIGNATE:OnAfterDetect(From, Event, To)
Detect Handler OnAfter for AI_DESIGNATE
@function [parent=#AI_DESIGNATE] OnAfterDetect

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### AI_DESIGNATE:Detect()
Detect Trigger for AI_DESIGNATE
@function [parent=#AI_DESIGNATE] Detect

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>

### AI_DESIGNATE:SetLaserCodes(LaserCodes)
Set an array of possible laser codes.
Each new lase will select a code from this table.

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self
* #list<<u>Number</u>> LaserCodes

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:onafterDetect()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:SendStatus()
Sends the status to the Attack Groups.

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:SetDesignateMenu()
Sets the Designate Menu.

<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:MenuSmoke()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>

### AI_DESIGNATE:MenuLaseOn()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>

### AI_DESIGNATE:MenuLaseOff()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>

### AI_DESIGNATE:onafterLaseOn()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:onafterLasing()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:onafterLaseOff()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



### AI_DESIGNATE:onafterSmoke()


<h4> Parameters </h4>
* [AI_DESIGNATE](#ai_designate-class-)
self

<h4> Returns </h4>
* [AI_DESIGNATE](#ai_designate-class-)



