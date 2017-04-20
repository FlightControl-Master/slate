# Core.Spot Module
**Core  (Release 2.1)** -- Management of SPOT logistics, that can be transported from and to transportation carriers.

![Banner Image](/includes/Pictures/SPOT/Dia1.JPG)



Spot lases points endlessly or for a duration.



#####  Demo Missions

#####  [SPOT Demo Missions source code]()

#####  [SPOT Demo Missions, only for beta testers]()

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [SPOT YouTube Channel]()



This module is still under construction, but is described above works already, and will keep working ...

## SPOT Class
<pre>
Inheritance : The SPOT Class inherits from the following parents :
BASE
	`-- SPOT
</pre>

### SPOT:New(Recce, LaserCode, Duration)

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self
* [UNIT](#unit-class-) Recce
* <u>Number</u> LaserCode
* <u>Number</u> Duration

<h4> Returns </h4>
* [SPOT](#spot-class-)



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

<h4> Parameters </h4>
* [SPOT](#spot-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if it is lasing


