# Functional.Detection Module
**Functional** - DETECTION_ classes model the detection of enemy units by FACs or RECCEs and group them according various methods.

![Banner Image](/includes/Pictures/DETECTION/Dia1.JPG)



DETECTION classes facilitate the detection of enemy units within the battle zone executed by FACs (Forward Air Controllers) or RECCEs (Reconnassance Units).
DETECTION uses the in-built detection capabilities of DCS World, but adds new functionalities.

Find the DETECTION classes documentation further in this document in the globals section.



#####  Demo Missions

#####  [DETECTION Demo Missions and Source Code](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master-release/DET%20-%20Detection)

#####  [DETECTION Demo Missions, only for Beta Testers](https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/DET%20-%20Detection)

#####  [ALL Demo Missions pack of the Latest Release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [DETECTION YouTube Channel](https://www.youtube.com/playlist?list=PL7ZUrU4zZUl3Cf5jpI6BS0sBOVWK__tji)



#####  Contributions:

* Mechanist : Early concept of DETECTION_AREAS.

#####  Authors:

* FlightControl : Analysis, Design, Programming, Testing

## DETECTION_BASE Class
<pre>
Inheritance : The DETECTION_BASE Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_BASE
</pre>

The DETECTION_BASE class defines the core functions to administer detected objects.
The DETECTION_BASE class will detect objects within the battle zone for a list of [Group](#group-module)s detecting targets following (a) detection method(s).

#####  DETECTION_BASE constructor

Construct a new DETECTION_BASE instance using the [DETECTION_BASE:New()](#detection_base-new-detectionsetgroup) method.

#####  Initialization

By default, detection will return detected objects with all the detection sensors available.
However, you can ask how the objects were found with specific detection methods.
If you use one of the below methods, the detection will work with the detection method specified.
You can specify to apply multiple detection methods.

Use the following functions to report the objects it detected using the methods Visual, Optical, Radar, IRST, RWR, DLINK:

* [DETECTION_BASE:InitDetectVisual()](#detection_base-initdetectvisual-detectvisual): Detected using Visual.
* [DETECTION_BASE:InitDetectOptical()](#detection_base-initdetectoptical-detectoptical): Detected using Optical.
* [DETECTION_BASE:InitDetectRadar()](#detection_base-initdetectradar-detectradar): Detected using Radar.
* [DETECTION_BASE:InitDetectIRST()](#detection_base-initdetectirst-detectirst): Detected using IRST.
* [DETECTION_BASE:InitDetectRWR()](#detection_base-initdetectrwr-detectrwr): Detected using RWR.
* [DETECTION_BASE:InitDetectDLINK()](#detection_base-initdetectdlink-detectdlink): Detected using DLINK.

#####  **Filter** detected units based on **category of the unit**

Filter the detected units based on Unit.Category using the method [DETECTION_BASE:FilterCategories()](#detection_base-filtercategories-filtercategories).
The different values of Unit.Category can be:

* Unit.Category.AIRPLANE
* Unit.Category.GROUND_UNIT
* Unit.Category.HELICOPTER
* Unit.Category.SHIP
* Unit.Category.STRUCTURE

Multiple Unit.Category entries can be given as a table and then these will be evaluated as an OR expression.

Example to filter a single category (Unit.Category.AIRPLANE).

DetectionObject:FilterCategories( Unit.Category.AIRPLANE )

Example to filter multiple categories (Unit.Category.AIRPLANE, Unit.Category.HELICOPTER). Note the {}.

DetectionObject:FilterCategories( { Unit.Category.AIRPLANE, Unit.Category.HELICOPTER } )


#####  **DETECTION_ derived classes** group the detected units into a **DetectedItems[]** list

DETECTION_BASE derived classes build a list called DetectedItems[], which is essentially a first later
of grouping of detected units. Each DetectedItem within the DetectedItems[] list contains
a SET_UNIT object that contains the  detected units that belong to that group.

Derived classes will apply different methods to group the detected units.
Examples are per area, per quadrant, per distance, per type.
See further the derived DETECTION classes on which grouping methods are currently supported.

Various methods exist how to retrieve the grouped items from a DETECTION_BASE derived class:

* The method [DETECTION_BASE:GetDetectedItems()](#detection_base-getdetecteditems) retrieves the DetectedItems[] list.
* A DetectedItem from the DetectedItems[] list can be retrieved using the method [DETECTION_BASE:GetDetectedItems()](#detection_base-getdetecteditems) DetectedItemIndex ).
Note that this method returns a DetectedItem element from the list, that contains a Set variable and further information
about the DetectedItem that is set by the DETECTION_BASE derived classes, used to group the DetectedItem.
* A DetectedSet from the DetectedItems[] list can be retrieved using the method [DETECTION_BASE:GetDetectedSet()](#detection_base-getdetectedset-index) DetectedItemIndex ).
This method retrieves the Set from a DetectedItem element from the DetectedItem list (DetectedItems[ DetectedItemIndex ].Set ).

#####  **Visual filters** to fine-tune the probability of the detected objects

By default, DCS World will return any object that is in LOS and within "visual reach", or detectable through one of the electronic detection means.
That being said, the DCS World detection algorithm can sometimes be unrealistic.
Especially for a visual detection, DCS World is able to report within 1 second a detailed detection of a group of 20 units (including types of the units) that are 10 kilometers away, using only visual capabilities.
Additionally, trees and other obstacles are not accounted during the DCS World detection.

Therefore, an additional (optional) filtering has been built into the DETECTION_BASE class, that can be set for visual detected units.
For electronic detection, this filtering is not applied, only for visually detected targets.

The following additional filtering can be applied for visual filtering:

* A probability factor per kilometer distance.
* A probability factor based on the alpha angle between the detected object and the unit detecting.
A detection from a higher altitude allows for better detection than when on the ground.
* Define a probability factor for "cloudy zones", which are zones where forests or villages are located. In these zones, detection will be much more difficult.
The mission designer needs to define these cloudy zones within the mission, and needs to register these zones in the DETECTION_ objects additing a probability factor per zone.

I advise however, that, when you first use the DETECTION derived classes, that you don't use these filters.
Only when you experience unrealistic behaviour in your missions, these filters could be applied.


#####  Distance visual detection probability

Upon a **visual** detection, the further away a detected object is, the less likely it is to be detected properly.
Also, the speed of accurate detection plays a role.

A distance probability factor between 0 and 1 can be given, that will model a linear extrapolated probability over 10 km distance.

For example, if a probability factor of 0.6 (60%) is given, the extrapolated probabilities over 15 kilometers would like like:
1 km: 96%, 2 km: 92%, 3 km: 88%, 4 km: 84%, 5 km: 80%, 6 km: 76%, 7 km: 72%, 8 km: 68%, 9 km: 64%, 10 km: 60%, 11 km: 56%, 12 km: 52%, 13 km: 48%, 14 km: 44%, 15 km: 40%.

Note that based on this probability factor, not only the detection but also the **type** of the unit will be applied!

Use the method [DETECTION_BASE:SetDistanceProbability()](#detection_base-setdistanceprobability-the) to set the probability factor upon a 10 km distance.

#####  Alpha Angle visual detection probability

Upon a **visual** detection, the higher the unit is during the detecting process, the more likely the detected unit is to be detected properly.
A detection at a 90% alpha angle is the most optimal, a detection at 10% is less and a detection at 0% is less likely to be correct.

A probability factor between 0 and 1 can be given, that will model a progressive extrapolated probability if the target would be detected at a 0° angle.

For example, if a alpha angle probability factor of 0.7 is given, the extrapolated probabilities of the different angles would look like:
0°: 70%, 10°: 75,21%, 20°: 80,26%, 30°: 85%, 40°: 89,28%, 50°: 92,98%, 60°: 95,98%, 70°: 98,19%, 80°: 99,54%, 90°: 100%

Use the method [DETECTION_BASE:SetAlphaAngleProbability()](#detection_base-setalphaangleprobability-the) to set the probability factor if 0°.

#####  Cloudy Zones detection probability

Upon a **visual** detection, the more a detected unit is within a cloudy zone, the less likely the detected unit is to be detected successfully.
The Cloudy Zones work with the ZONE_BASE derived classes. The mission designer can define within the mission
zones that reflect cloudy areas where detected units may not be so easily visually detected.

Use the method [DETECTION_BASE:SetZoneProbability()](#detection_base-setzoneprobability-aray) to set for a defined number of zones, the probability factors.

Note however, that the more zones are defined to be "cloudy" within a detection, the more performance it will take
from the DETECTION_BASE to calculate the presence of the detected unit within each zone.
Expecially for ZONE_POLYGON, try to limit the amount of nodes of the polygon!

Typically, this kind of filter would be applied for very specific areas were a detection needs to be very realisting for
AI not to detect so easily targets within a forrest or village rich area.

#####  Accept / Reject detected units

DETECTION_BASE can accept or reject successful detections based on the location of the detected object,
if it is located in range or located inside or outside of specific zones.

#####  Detection acceptance of within range limit

A range can be set that will limit a successful detection for a unit.
Use the method [DETECTION_BASE:SetAcceptRange()](#detection_base-setacceptrange-acceptrange) to apply a range in meters till where detected units will be accepted.

local SetGroup = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterStart() -- Build a SetGroup of Forward Air Controllers.

-- Build a detect object.
local Detection = DETECTION_BASE:New( SetGroup )

-- This will accept detected units if the range is below 5000 meters.
Detection:SetAcceptRange( 5000 )

-- Start the Detection.
Detection:Start()


#####  Detection acceptance if within zone(s).

Specific ZONE_BASE object(s) can be given as a parameter, which will only accept a detection if the unit is within the specified ZONE_BASE object(s).
Use the method [DETECTION_BASE:SetAcceptZones()](#detection_base-setacceptzones-can) will accept detected units if they are within the specified zones.

local SetGroup = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterStart() -- Build a SetGroup of Forward Air Controllers.

-- Search fo the zones where units are to be accepted.
local ZoneAccept1 = ZONE:New( "AcceptZone1" )
local ZoneAccept2 = ZONE:New( "AcceptZone2" )

-- Build a detect object.
local Detection = DETECTION_BASE:New( SetGroup )

-- This will accept detected units by Detection when the unit is within ZoneAccept1 OR ZoneAccept2.
Detection:SetAcceptZones( { ZoneAccept1, ZoneAccept2 } )

-- Start the Detection.
Detection:Start()

#####  Detection rejectance if within zone(s).

Specific ZONE_BASE object(s) can be given as a parameter, which will reject detection if the unit is within the specified ZONE_BASE object(s).
Use the method [DETECTION_BASE:SetRejectZones()](#detection_base-setrejectzones-can) will reject detected units if they are within the specified zones.
An example of how to use the method is shown below.

local SetGroup = SET_GROUP:New():FilterPrefixes( "FAC" ):FilterStart() -- Build a SetGroup of Forward Air Controllers.

-- Search fo the zones where units are to be rejected.
local ZoneReject1 = ZONE:New( "RejectZone1" )
local ZoneReject2 = ZONE:New( "RejectZone2" )

-- Build a detect object.
local Detection = DETECTION_BASE:New( SetGroup )

-- This will reject detected units by Detection when the unit is within ZoneReject1 OR ZoneReject2.
Detection:SetRejectZones( { ZoneReject1, ZoneReject2 } )

-- Start the Detection.
Detection:Start()

#####  DETECTION_BASE is a Finite State Machine

Various Events and State Transitions can be tailored using DETECTION_BASE.

#####  DETECTION_BASE States

* **Detecting**: The detection is running.
* **Stopped**: The detection is stopped.

#####  DETECTION_BASE Events

* **Start**: Start the detection process.
* **Detect**: Detect new units.
* **Detected**: New units have been detected.
* **Stop**: Stop the detection process.




<h4> Attributes </h4>

* [SET_GROUP](#set_group-class) DetectionSetGroup : The [Set](#set-module) of GROUPs in the Forward Air Controller role.
* [Distance](#distance-class) DetectionRange : The range till which targets are accepted to be detected.
* [DetectedObjects](#detection_base-detectedobjects-class) DetectedObjects : The list of detected objects.
* <u>List[]</u> DetectedObjectsIdentified : Map of the DetectedObjects identified.
* <u>Number</u> DetectionRun


### DETECTION_BASE:New(DetectionSetGroup)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [SET_GROUP](#set_group-class) DetectionSetGroup : The [Set](#set-module) of GROUPs in the Forward Air Controller role.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:OnLeaveStopped(From, Event, To)
OnLeave Transition Handler for State Stopped.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnEnterStopped(From, Event, To)
OnEnter Transition Handler for State Stopped.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:OnBeforeStart(From, Event, To)
OnBefore Transition Handler for Event Start.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnAfterStart(From, Event, To)
OnAfter Transition Handler for Event Start.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:Start()
Synchronous Event Trigger for Event Start.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>

### DETECTION_BASE:OnLeaveDetecting(From, Event, To)
OnLeave Transition Handler for State Detecting.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnEnterDetecting(From, Event, To)
OnEnter Transition Handler for State Detecting.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:OnBeforeDetect(From, Event, To)
OnBefore Transition Handler for Event Detect.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnAfterDetect(From, Event, To)
OnAfter Transition Handler for Event Detect.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:Detect()
Synchronous Event Trigger for Event Detect.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>

### DETECTION_BASE:OnBeforeDetected(From, Event, To)
OnBefore Transition Handler for Event Detected.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnAfterDetected(From, Event, To)
OnAfter Transition Handler for Event Detected.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:Detected()
Synchronous Event Trigger for Event Detected.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>

### DETECTION_BASE:OnBeforeStop(From, Event, To)
OnBefore Transition Handler for Event Stop.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnAfterStop(From, Event, To)
OnAfter Transition Handler for Event Stop.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:Stop()
Synchronous Event Trigger for Event Stop.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>

### DETECTION_BASE:OnLeaveStopped(From, Event, To)
OnLeave Transition Handler for State Stopped.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u> Return : false to cancel Transition.


### DETECTION_BASE:OnEnterStopped(From, Event, To)
OnEnter Transition Handler for State Stopped.

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:onafterStart(From, Event, To)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:onafterDetect(From, Event, To)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### DETECTION_BASE:onafterDetectionGroup(From, Event, To, DetectionGroup)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.
* [GROUP](#group-class) DetectionGroup : The Group detecting.

<h4> Returns </h4>

### DETECTION_BASE:InitDetectVisual(DetectVisual)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Boolean</u> DetectVisual

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:InitDetectOptical(DetectOptical)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Boolean</u> DetectOptical

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:InitDetectRadar(DetectRadar)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Boolean</u> DetectRadar

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:InitDetectIRST(DetectIRST)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Boolean</u> DetectIRST

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:InitDetectRWR(DetectRWR)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Boolean</u> DetectRWR

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:InitDetectDLINK(DetectDLINK)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Boolean</u> DetectDLINK

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:FilterCategories(FilterCategories)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* #list<Dcs.DCSUnit#Unit> FilterCategories : The Categories entries

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetDetectionInterval(DetectionInterval)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> DetectionInterval : Interval in seconds.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetAcceptRange(AcceptRange)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> AcceptRange : Accept a detection if the unit is within the AcceptRange in meters.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetAcceptZones(Can)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* AcceptZones Can : be a list or ZONE_BASE objects, or a single ZONE_BASE object.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetRejectZones(Can)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* RejectZones Can : be a list or ZONE_BASE objects, or a single ZONE_BASE object.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetDistanceProbability(The)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* DistanceProbability The : probability factor.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetAlphaAngleProbability(The)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* AlphaAngleProbability The : probability factor.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:SetZoneProbability(Aray)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* ZoneArray Aray : of a The ZONE_BASE object and a ZoneProbability pair..

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:AcceptChanges(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:AddChangeItem(DetectedItem, ChangeCode)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem
* <u>String</u> ChangeCode

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:AddChangeUnit(DetectedItem, ChangeCode, ChangeUnitType)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem
* <u>String</u> ChangeCode
* <u>String</u> ChangeUnitType

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:IsFriendliesNearBy()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>
* <u>Boolean</u> trhe : if there are friendlies nearby


### DETECTION_BASE:ReportFriendliesNearBy()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>

### DETECTION_BASE:IsDetectedObjectIdentified(DetectedObject)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [DetectedObject](#detection_base-detectedobject-class) DetectedObject

<h4> Returns </h4>
* <u>Boolean</u> true : if already identified.


### DETECTION_BASE:IdentifyDetectedObject(DetectedObject)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [DetectedObject](#detection_base-detectedobject-class) DetectedObject

<h4> Returns </h4>

### DETECTION_BASE:UnIdentifyDetectedObject(DetectedObject)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* [DetectedObject](#detection_base-detectedobject-class) DetectedObject

<h4> Returns </h4>

### DETECTION_BASE:UnIdentifyAllDetectedObjects()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>

### DETECTION_BASE:GetDetectedObject(ObjectName)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> ObjectName

<h4> Returns </h4>
* [DetectedObject](#detection_base-detectedobject-class) self


### DETECTION_BASE:AddDetectedItem(DetectedItemIndex, Set)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> DetectedItemIndex : The index of the DetectedItem.
* [SET_UNIT](#set_unit-class) Set : (optional) The Set of Units to be added.

<h4> Returns </h4>
* [DetectedItem](#detection_base-detecteditem-class) self


### DETECTION_BASE:AddDetectedItemZone(DetectedItemIndex, Set, Zone)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>String</u> DetectedItemIndex : The index of the DetectedItem.
* [SET_UNIT](#set_unit-class) Set : (optional) The Set of Units to be added.
* [ZONE_UNIT](#zone_unit-class) Zone : (optional) The Zone to be added where the Units are located.

<h4> Returns </h4>
* [DetectedItem](#detection_base-detecteditem-class) self


### DETECTION_BASE:RemoveDetectedItem(DetectedItemIndex)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> DetectedItemIndex : The index or position in the DetectedItems list where the item needs to be removed.

<h4> Returns </h4>

### DETECTION_BASE:GetDetectedItems()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>
* [DetectedItems](#detection_base-detecteditems-class) self


### DETECTION_BASE:GetDetectedItemsCount()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>
* <u>Number</u> Count


### DETECTION_BASE:GetDetectedItem(Index)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> Index

<h4> Returns </h4>
* [DetectedItem](#detection_base-detecteditem-class) self


### DETECTION_BASE:GetDetectedSet(Index)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> Index

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class) DetectedSet


### DETECTION_BASE:GetDetectedZone(Index)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> Index

<h4> Returns </h4>
* [ZONE_UNIT](#zone_unit-class) DetectedZone


### DETECTION_BASE:DetectedItemReportSummary(self)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* Index self

<h4> Returns </h4>
* <u>String</u> self


### DETECTION_BASE:DetectedReportDetailed()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>
* <u>String</u> self


### DETECTION_BASE:GetDetectionSetGroup()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>
* [GROUP](#group-class) self


### DETECTION_BASE:CreateDetectionSets()

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


### DETECTION_BASE:Schedule(DelayTime, RepeatInterval)

<h4> Parameters </h4>
* [DETECTION_BASE](#detection_base-class)
self
* <u>Number</u> DelayTime : The delay in seconds to wait the reporting.
* <u>Number</u> RepeatInterval : The repeat interval in seconds for the reporting to happen repeatedly.

<h4> Returns </h4>
* [DETECTION_BASE](#detection_base-class)
self


## DETECTION_BASE.DetectedObjects Class
<pre>
**The DETECTION_BASE.DetectedObjects class does not inherit**
</pre>

## DETECTION_BASE.DetectedObject Class
<pre>
**The DETECTION_BASE.DetectedObject class does not inherit**
</pre>
<h4> Attributes </h4>

* <u>String</u> Name
* <u>Boolean</u> Visible
* <u>String</u> Type
* <u>Number</u> Distance
* <u>Boolean</u> Identified


## DETECTION_BASE.DetectedItems Class
<pre>
**The DETECTION_BASE.DetectedItems class does not inherit**
</pre>

## DETECTION_BASE.DetectedItem Class
<pre>
**The DETECTION_BASE.DetectedItem class does not inherit**
</pre>
<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) Set
* [SET_UNIT](#set_unit-class) Set : -- The Set of Units in the detected area.
* [ZONE_UNIT](#zone_unit-class) Zone : -- The Zone of the detected area.
* <u>Boolean</u> Changed : Documents if the detected area has changes.
* <u>List[]</u> Changes : A list of the changes reported on the detected area. (It is up to the user of the detected area to consume those changes).
* <u>Number</u> ItemID : -- The identifier of the detected area.
* <u>Boolean</u> FriendliesNearBy : Indicates if there are friendlies within the detected area.
* [UNIT](#unit-class) NearestFAC : The nearest FAC near the Area.


## DETECTION_UNITS Class
<pre>
Inheritance : The DETECTION_UNITS Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_BASE
			`-- DETECTION_UNITS
</pre>

The DETECTION_UNITS class will detect units within the battle zone.
It will build a DetectedItems list filled with DetectedItems. Each DetectedItem will contain a field Set, which contains a [SET_UNIT](#set_unit-class) containing ONE [UNIT](#unit-module) object reference.
Beware that when the amount of units detected is large, the DetectedItems list will be large also.


<h4> Attributes </h4>

* [Distance](#distance-class) DetectionRange : The range till which targets are detected.


### DETECTION_UNITS:New(DetectionSetGroup)

<h4> Parameters </h4>
* [DETECTION_UNITS](#detection_units-class) self
* [SET_GROUP](#set_group-class) DetectionSetGroup : The [Set](#set-module) of GROUPs in the Forward Air Controller role.

<h4> Returns </h4>
* [DETECTION_UNITS](#detection_units-class) self


### DETECTION_UNITS:GetChangeText(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_UNITS](#detection_units-class)
self
* [DetectedItem](#detection_units-detecteditem-class) DetectedItem

<h4> Returns </h4>
* <u>String</u> The : Changes text


### DETECTION_UNITS:CreateDetectionSets()

<h4> Parameters </h4>
* [DETECTION_UNITS](#detection_units-class)
self

<h4> Returns </h4>
* [DETECTION_UNITS](#detection_units-class)
self


### DETECTION_UNITS:DetectedItemReportSummary(self)

<h4> Parameters </h4>
* [DETECTION_UNITS](#detection_units-class)
self
* Index self

<h4> Returns </h4>
* <u>String</u> self


### DETECTION_UNITS:DetectedReportDetailed()

<h4> Parameters </h4>
* [DETECTION_UNITS](#detection_units-class)
self

<h4> Returns </h4>
* <u>String</u> self


## DETECTION_TYPES Class
<pre>
Inheritance : The DETECTION_TYPES Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_BASE
			`-- DETECTION_TYPES
</pre>

The DETECTION_TYPES class will detect units within the battle zone.
It will build a DetectedItems[] list filled with DetectedItems, grouped by the type of units detected.
Each DetectedItem will contain a field Set, which contains a [SET_UNIT](#set_unit-class) containing ONE [UNIT](#unit-module) object reference.
Beware that when the amount of different types detected is large, the DetectedItems[] list will be large also.



### DETECTION_TYPES:New(DetectionSetGroup)

<h4> Parameters </h4>
* [DETECTION_TYPES](#detection_types-class) self
* [SET_GROUP](#set_group-class) DetectionSetGroup : The [Set](#set-module) of GROUPs in the Recce role.

<h4> Returns </h4>
* [DETECTION_TYPES](#detection_types-class) self


### DETECTION_TYPES:GetChangeText(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_TYPES](#detection_types-class)
self
* [DetectedItem](#detection_types-detecteditem-class) DetectedItem

<h4> Returns </h4>
* <u>String</u> The : Changes text


### DETECTION_TYPES:CreateDetectionSets()

<h4> Parameters </h4>
* [DETECTION_TYPES](#detection_types-class)
self

<h4> Returns </h4>
* [DETECTION_TYPES](#detection_types-class)
self


### DETECTION_TYPES:DetectedItemReportSummary(self)

<h4> Parameters </h4>
* [DETECTION_TYPES](#detection_types-class)
self
* Index self

<h4> Returns </h4>
* <u>String</u> self


### DETECTION_TYPES:DetectedReportDetailed()

<h4> Parameters </h4>
* [DETECTION_TYPES](#detection_types-class)
self

<h4> Returns </h4>
* <u>String</u> self


## DETECTION_AREAS Class
<pre>
Inheritance : The DETECTION_AREAS Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_BASE
			`-- DETECTION_AREAS
</pre>

The DETECTION_AREAS class will detect units within the battle zone for a list of [Group](#group-module)s detecting targets following (a) detection method(s),
and will build a list (table) of [SET_UNIT](#set_unit-class)s containing the [UNIT](#unit-class)s detected.
The class is group the detected units within zones given a DetectedZoneRange parameter.
A set with multiple detected zones will be created as there are groups of units detected.

#####  4.1) Retrieve the Detected Unit Sets and Detected Zones

The methods to manage the DetectedItems[].Set(s) are implemented in [DECTECTION_BASE](#dectection_base-class) and
the methods to manage the DetectedItems[].Zone(s) is implemented in [DETECTION_AREAS](#detection_areas-class).

Retrieve the DetectedItems[].Set with the method [DETECTION_BASE:GetDetectedSet()](#detection_base-getdetectedset-index). A [SET_UNIT](#set_unit-class) object will be returned.

Retrieve the formed [Zone@ZONE_UNIT](#zone@zone_unit-module)s as a result of the grouping the detected units within the DetectionZoneRange, use the method DETECTION_BASE-GetDetectionZones.
To understand the amount of zones created, use the method DETECTION_BASE-GetDetectionZoneCount.
If you want to obtain a specific zone from the DetectedZones, use the method DETECTION_BASE-GetDetectionZone with a given index.

#####  4.4) Flare or Smoke detected units

Use the methods [DETECTION_AREAS:FlareDetectedUnits()](#detection_areas-flaredetectedunits) or [DETECTION_AREAS:SmokeDetectedUnits()](#detection_areas-smokedetectedunits) to flare or smoke the detected units when a new detection has taken place.

#####  4.5) Flare or Smoke or Bound detected zones

Use the methods:

* [DETECTION_AREAS:FlareDetectedZones()](#detection_areas-flaredetectedzones) to flare in a color
* [DETECTION_AREAS:SmokeDetectedZones()](#detection_areas-smokedetectedzones) to smoke in a color
* [DETECTION_AREAS:SmokeDetectedZones()](#detection_areas-smokedetectedzones) to bound with a tire with a white flag

the detected zones when a new detection has taken place.


<h4> Attributes </h4>

* [Distance](#distance-class) DetectionZoneRange : The range till which targets are grouped upon the first detected target.
* [DetectedItems](#detection_base-detecteditems-class) DetectedItems : A list of areas containing the set of [Unit](#unit-module)s, [Zone](#zone-module)s, the center [Unit](#unit-module) within the zone, and ID of each area that was detected within a DetectionZoneRange.


### DETECTION_AREAS:New(DetectionSetGroup, DetectionZoneRange)

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self
* [SET_GROUP](#set_group-class) DetectionSetGroup : The [Set](#set-module) of GROUPs in the Forward Air Controller role.
* [Distance](#distance-class) DetectionZoneRange : The range till which targets are grouped upon the first detected target.

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self


### DETECTION_AREAS:DetectedItemReportSummary(self)

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self
* Index self

<h4> Returns </h4>
* <u>String</u> self


### DETECTION_AREAS:IsFriendliesNearBy()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* <u>Boolean</u> trhe : if there are friendlies nearby


### DETECTION_AREAS:CalculateThreatLevelA2G(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem

<h4> Returns </h4>

### DETECTION_AREAS:NearestFAC(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem

<h4> Returns </h4>
* [UNIT](#unit-class) The : nearest FAC unit


### DETECTION_AREAS:GetTreatLevelA2G(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem

<h4> Returns </h4>
* <u>Number</u> a : scale from 0 to 10.


### DETECTION_AREAS:SmokeDetectedUnits()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self


### DETECTION_AREAS:FlareDetectedUnits()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self


### DETECTION_AREAS:SmokeDetectedZones()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self


### DETECTION_AREAS:FlareDetectedZones()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self


### DETECTION_AREAS:BoundDetectedZones()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self


### DETECTION_AREAS:GetChangeText(DetectedItem)

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self
* [DetectedItem](#detection_base-detecteditem-class) DetectedItem

<h4> Returns </h4>
* <u>String</u> The : Changes text


### DETECTION_AREAS:CreateDetectionSets()

<h4> Parameters </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

<h4> Returns </h4>
* [DETECTION_AREAS](#detection_areas-class)
self

