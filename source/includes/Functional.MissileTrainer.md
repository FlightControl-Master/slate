# Functional.MissileTrainer Module
This module contains the MISSILETRAINER class.



##### 1) [MISSILETRAINER](#missiletrainer-class) class, extends [BASE](#base-class)

The [MISSILETRAINER](#missiletrainer-class) class uses the DCS world messaging system to be alerted of any missiles fired, and when a missile would hit your aircraft,
the class will destroy the missile within a certain range, to avoid damage to your aircraft.
It suports the following functionality:

* Track the missiles fired at you and other players, providing bearing and range information of the missiles towards the airplanes.
* Provide alerts of missile launches, including detailed information of the units launching, including bearing, range �
* Provide alerts when a missile would have killed your aircraft.
* Provide alerts when the missile self destructs.
* Enable / Disable and Configure the Missile Trainer using the various menu options.

When running a mission where MISSILETRAINER is used, the following radio menu structure ( 'Radio Menu' -> 'Other (F10)' -> 'MissileTrainer' ) options are available for the players:

* **Messages**: Menu to configure all messages.
* **Messages On**: Show all messages.
* **Messages Off**: Disable all messages.
* **Tracking**: Menu to configure missile tracking messages.
* **To All**: Shows missile tracking messages to all players.
* **To Target**: Shows missile tracking messages only to the player where the missile is targetted at.
* **Tracking On**: Show missile tracking messages.
* **Tracking Off**: Disable missile tracking messages.
* **Frequency Increase**: Increases the missile tracking message frequency with one second.
* **Frequency Decrease**: Decreases the missile tracking message frequency with one second.
* **Alerts**: Menu to configure alert messages.
* **To All**: Shows alert messages to all players.
* **To Target**: Shows alert messages only to the player where the missile is (was) targetted at.
* **Hits On**: Show missile hit alert messages.
* **Hits Off**: Disable missile hit alert messages.
* **Launches On**: Show missile launch messages.
* **Launches Off**: Disable missile launch messages.
* **Details**: Menu to configure message details.
* **Range On**: Shows range information when a missile is fired to a target.
* **Range Off**: Disable range information when a missile is fired to a target.
* **Bearing On**: Shows bearing information when a missile is fired to a target.
* **Bearing Off**: Disable bearing information when a missile is fired to a target.
* **Distance**: Menu to configure the distance when a missile needs to be destroyed when near to a player, during tracking. This will improve/influence hit calculation accuracy, but has the risk of damaging the aircraft when the missile reaches the aircraft before the distance is measured.
* **50 meter**: Destroys the missile when the distance to the aircraft is below or equal to 50 meter.
* **100 meter**: Destroys the missile when the distance to the aircraft is below or equal to 100 meter.
* **150 meter**: Destroys the missile when the distance to the aircraft is below or equal to 150 meter.
* **200 meter**: Destroys the missile when the distance to the aircraft is below or equal to 200 meter.


##### 1.1) MISSILETRAINER construction methods:

Create a new MISSILETRAINER object with the [MISSILETRAINER:New()](#missiletrainer-new-distance-briefing) method:

* [MISSILETRAINER:New()](#missiletrainer-new-distance-briefing): Creates a new MISSILETRAINER object taking the maximum distance to your aircraft to evaluate when a missile needs to be destroyed.

MISSILETRAINER will collect each unit declared in the mission with a skill level "Client" and "Player", and will monitor the missiles shot at those.

##### 1.2) MISSILETRAINER initialization methods:

A MISSILETRAINER object will behave differently based on the usage of initialization methods:

* [MISSILETRAINER:InitMessagesOnOff()](#missiletrainer-initmessagesonoff-messagesonoff): Sets by default the display of any message to be ON or OFF.
* [MISSILETRAINER:InitTrackingToAll()](#missiletrainer-inittrackingtoall-trackingtoall): Sets by default the missile tracking report for all players or only for those missiles targetted to you.
* [MISSILETRAINER:InitTrackingOnOff()](#missiletrainer-inittrackingonoff-trackingonoff): Sets by default the display of missile tracking report to be ON or OFF.
* [MISSILETRAINER:InitTrackingFrequency()](#missiletrainer-inittrackingfrequency-trackingfrequency): Increases, decreases the missile tracking message display frequency with the provided time interval in seconds.
* [MISSILETRAINER:InitAlertsToAll()](#missiletrainer-initalertstoall-alertstoall): Sets by default the display of alerts to be shown to all players or only to you.
* [MISSILETRAINER:InitAlertsHitsOnOff()](#missiletrainer-initalertshitsonoff-alertshitsonoff): Sets by default the display of hit alerts ON or OFF.
* [MISSILETRAINER:InitAlertsLaunchesOnOff()](#missiletrainer-initalertslaunchesonoff-alertslaunchesonoff): Sets by default the display of launch alerts ON or OFF.
* [MISSILETRAINER:InitRangeOnOff()](#missiletrainer-initrangeonoff-detailsrangeonoff): Sets by default the display of range information of missiles ON of OFF.
* [MISSILETRAINER:InitBearingOnOff()](#missiletrainer-initbearingonoff-detailsbearingonoff): Sets by default the display of bearing information of missiles ON of OFF.
* [MISSILETRAINER:InitMenusOnOff()](#missiletrainer-initmenusonoff-menusonoff): Allows to configure the options through the radio menu.



CREDITS

**Stuka (Danny)** Who you can search on the Eagle Dynamics Forums.
Working together with Danny has resulted in the MISSILETRAINER class.
Danny has shared his ideas and together we made a design.
Together with the **476 virtual team**, we tested the MISSILETRAINER class, and got much positive feedback!

## MISSILETRAINER Class
<pre>
Inheritance : The MISSILETRAINER Class inherits from the following parents :
BASE
	`-- MISSILETRAINER
</pre>

<h4> Attributes </h4>

* [SET_CLIENT](#set_client-class) DBClients


### MISSILETRAINER:New(Distance, Briefing)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Number</u> Distance : The distance in meters when a tracked missile needs to be destroyed when close to a player.
* <u>String</u> Briefing : (Optional) Will show a text to the players when starting their mission. Can be used for briefing purposes.

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitMessagesOnOff(MessagesOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> MessagesOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitTrackingToAll(TrackingToAll)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> TrackingToAll : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitTrackingOnOff(TrackingOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> TrackingOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitTrackingFrequency(TrackingFrequency)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Number</u> TrackingFrequency : Provide a negative or positive value in seconds to incraese or decrease the display frequency.

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitAlertsToAll(AlertsToAll)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> AlertsToAll : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitAlertsHitsOnOff(AlertsHitsOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> AlertsHitsOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitAlertsLaunchesOnOff(AlertsLaunchesOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> AlertsLaunchesOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitRangeOnOff(DetailsRangeOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> DetailsRangeOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitBearingOnOff(DetailsBearingOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> DetailsBearingOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:InitMenusOnOff(MenusOnOff)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* <u>Boolean</u> MenusOnOff : true or false

<h4> Returns </h4>
* [MISSILETRAINER](#missiletrainer-class)
self


### MISSILETRAINER:OnEventShot(EventData)

<h4> Parameters </h4>
* [MISSILETRAINER](#missiletrainer-class)
self
* [EVENTDATA](#eventdata-class) EventData

<h4> Returns </h4>

