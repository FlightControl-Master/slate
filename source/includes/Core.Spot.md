# Core.Spot Module
**Core 2.1** -- Management of SPOT logistics, that can be transported from and to transportation carriers.

![Banner Image](/includes/Pictures/SPOT/Dia1.JPG)



SPOT implements the DCS Spot class functionality, but adds additional luxury to be able to:

* Spot for a defined duration.
* wiggle the spot at the target.
* Provide a [Unit](#unit-module-) as a target, instead of a point.
* Implement a status machine, LaseOn, LaseOff.



#####  Demo Missions

#####  [SPOT Demo Missions source code]()

#####  [SPOT Demo Missions, only for beta testers]()

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [SPOT YouTube Channel]()



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* [**Ciribob**](https://forums.eagle.ru/member.php?u=112175): Showing the way how to lase targets + how laser codes work!!! Explained the autolase script.
* [**EasyEB**](https://forums.eagle.ru/member.php?u=112055): Ideas and Beta Testing
* [**Wingthor**](https://forums.eagle.ru/member.php?u=123698): Beta Testing


#####  Authors:

* **FlightControl**: Design & Programming

## SPOT Class
<pre>
Inheritance : The SPOT Class inherits from the following parents :
BASE
	`-- FSM
		`-- SPOT
</pre>

SPOT implements the DCS Spot class functionality, but adds additional luxury to be able to:

* Mark targets for a defined duration.
* wiggle the spot at the target.
* Provide a [Unit](#unit-module-) as a target, instead of a point.
* Implement a status machine, LaseOn, LaseOff.

#####  1. SPOT constructor

* [SPOT:New()](#spot-new-recce-lasercode-duration)..\Presentations\SPOT\Dia2.JPG): Creates a new SPOT object.

#####  2. SPOT is a FSM

![Process]()

#####  2.1 SPOT States

* **Off**: Lasing is switched off.
* **On**: Lasing is switched on.
* **Destroyed**: Target is destroyed.

#####  2.2 SPOT Events

* **SPOT-LaseOn-Target, LaserCode, Duration)**: Lase to a target.
* **SPOT-LaseOff-**: Stop lasing the target.
* **SPOT-Lasing-**: Target is being lased.
* **SPOT-Destroyed-**: Triggered when target is destroyed.

#####  3. Check if a Target is being lased

The method SPOT-IsLasing- indicates whether lasing is on or off.




### SPOT:New(Recce, LaserCode, Duration)
SPOT Constructor.

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* [UNIT](#unit-class-) Recce
* <u>Number</u> LaserCode
* <u>Number</u> Duration

<h4> Returns </h4>
* [SPOT](#spot-class-)



### SPOT:OnBeforeLaseOn(From, Event, To)
LaseOn Handler OnBefore for SPOT
@function [parent=#SPOT] OnBeforeLaseOn

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>
* <u>Boolean</u> 


### SPOT:OnAfterLaseOn(From, Event, To)
LaseOn Handler OnAfter for SPOT
@function [parent=#SPOT] OnAfterLaseOn

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### SPOT:LaseOn()
LaseOn Trigger for SPOT
@function [parent=#SPOT] LaseOn

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self

<h4> Returns </h4>

### SPOT:OnBeforeLaseOff(From, Event, To)
LaseOff Handler OnBefore for SPOT
@function [parent=#SPOT] OnBeforeLaseOff

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>
* <u>Boolean</u> 


### SPOT:OnAfterLaseOff(From, Event, To)
LaseOff Handler OnAfter for SPOT
@function [parent=#SPOT] OnAfterLaseOff

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### SPOT:LaseOff()
LaseOff Trigger for SPOT
@function [parent=#SPOT] LaseOff

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self

<h4> Returns </h4>

### SPOT:OnBeforeDestroyed(From, Event, To)
Destroyed Handler OnBefore for SPOT
@function [parent=#SPOT] OnBeforeDestroyed

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>
* <u>Boolean</u> 


### SPOT:OnAfterDestroyed(From, Event, To)
Destroyed Handler OnAfter for SPOT
@function [parent=#SPOT] OnAfterDestroyed

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* <u>String</u> From
* <u>String</u> Event
* <u>String</u> To

<h4> Returns </h4>

### SPOT:Destroyed()
Destroyed Trigger for SPOT
@function [parent=#SPOT] Destroyed

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self

<h4> Returns </h4>

### SPOT:onafterLaseOn(self, self, self, Target, LaserCode, Duration)

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* From self
* Event self
* To self
* [POSITIONABLE](#positionable-class-) Target
* <u>Number</u> LaserCode
* <u>Number</u> Duration

<h4> Returns </h4>

### SPOT:OnEventDead(EventData)

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### SPOT:onafterLasing(self, self, self)

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* From self
* Event self
* To self

<h4> Returns </h4>

### SPOT:onafterLaseOff(self, self, self)

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* From self
* Event self
* To self

<h4> Returns </h4>
* [SPOT](#spot-class-)



### SPOT:IsLasing()
Check if the SPOT is lasing

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if it is lasing


