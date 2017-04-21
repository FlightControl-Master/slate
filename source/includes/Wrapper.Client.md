# Wrapper.Client Module
This module contains the CLIENT class.

##### 1) [CLIENT](#client-class-) class, extends [UNIT](#unit-class-)

Clients are those **Units** defined within the Mission Editor that have the skillset defined as __Client__ or __Player__.
Note that clients are NOT the same as Units, they are NOT necessarily alive.
The [CLIENT](#client-class-) class is a wrapper class to handle the DCS Unit objects that have the skillset defined as __Client__ or __Player__:

* Wraps the DCS Unit objects with skill level set to Player or Client.
* Support all DCS Unit APIs.
* Enhance with Unit specific APIs not in the DCS Group API set.
* When player joins Unit, execute alive init logic.
* Handles messages to players.
* Manage the "state" of the DCS Unit.

Clients are being used by the [MISSION](#mission-module-) class to follow players and register their successes.

##### 1.1) CLIENT reference methods

For each DCS Unit having skill level Player or Client, a CLIENT wrapper object (instance) will be created within the _[DATABASE](#database-module-) object.
This is done at the beginning of the mission (when the mission starts).

The CLIENT class does not contain a :New() method, rather it provides :Find() methods to retrieve the object reference
using the DCS Unit or the DCS UnitName.

Another thing to know is that CLIENT objects do not "contain" the DCS Unit object.
The CLIENT methods will reference the DCS Unit object by name when it is needed during API execution.
If the DCS Unit object does not exist or is nil, the CLIENT methods will return nil and log an exception in the DCS.log file.

The CLIENT class provides the following functions to retrieve quickly the relevant CLIENT instance:

* [CLIENT:Find()](#client-find-clientname-clientbriefing): Find a CLIENT instance from the _DATABASE object using a DCS Unit object.
* [CLIENT:FindByName()](#client-findbyname-clientname-clientbriefing-error): Find a CLIENT instance from the _DATABASE object using a DCS Unit name.

IMPORTANT: ONE SHOULD NEVER SANATIZE these CLIENT OBJECT REFERENCES! (make the CLIENT object references nil).

## CLIENT Class
<pre>
Inheritance : The CLIENT Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
				`-- CONTROLLABLE
					`-- UNIT
						`-- CLIENT
</pre>


### CLIENT:Find(ClientName, ClientBriefing)
``` lua
-- Create new Clients.
local Mission = MISSIONSCHEDULER.AddMission( 'Russia Transport Troops SA-6', 'Operational', 'Transport troops from the control center to one of the SA-6 SAM sites to activate their operation.', 'Russia' )
Mission:AddGoal( DeploySA6TroopsGoal )

Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*HOT-Deploy Troops 1' ):Transport() )
Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*RAMP-Deploy Troops 3' ):Transport() )
Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*HOT-Deploy Troops 2' ):Transport() )
Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*RAMP-Deploy Troops 4' ):Transport() )
```
Finds a CLIENT from the _DATABASE using the relevant DCS Unit.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>String</u> ClientName : Name of the DCS **Unit** as defined within the Mission Editor.
* <u>String</u> ClientBriefing : Text that describes the briefing of the mission when a Player logs into the Client.

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:FindByName(ClientName, ClientBriefing, Error)
``` lua
-- Create new Clients.
local Mission = MISSIONSCHEDULER.AddMission( 'Russia Transport Troops SA-6', 'Operational', 'Transport troops from the control center to one of the SA-6 SAM sites to activate their operation.', 'Russia' )
Mission:AddGoal( DeploySA6TroopsGoal )

Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*HOT-Deploy Troops 1' ):Transport() )
Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*RAMP-Deploy Troops 3' ):Transport() )
Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*HOT-Deploy Troops 2' ):Transport() )
Mission:AddClient( CLIENT:FindByName( 'RU MI-8MTV2*RAMP-Deploy Troops 4' ):Transport() )
```
Finds a CLIENT from the _DATABASE using the relevant Client Unit Name.
As an optional parameter, a briefing text can be given also.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>String</u> ClientName : Name of the DCS **Unit** as defined within the Mission Editor.
* <u>String</u> ClientBriefing : Text that describes the briefing of the mission when a Player logs into the Client.
* <u>Boolean</u> Error : A flag that indicates whether an error should be raised if the CLIENT cannot be found. By default an error will be raised.

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:Transport()
Transport defines that the Client is a Transport. Transports show cargo.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:AddBriefing(ClientBriefing)
AddBriefing adds a briefing to a CLIENT when a player joins a mission.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>String</u> ClientBriefing : is the text defining the Mission briefing.

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:ShowBriefing()
Show the briefing of a CLIENT.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:ShowMissionBriefing(MissionBriefing)
Show the mission briefing of a MISSION to the CLIENT.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>String</u> MissionBriefing

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:Reset(ClientName)
Resets a CLIENT.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>String</u> ClientName : Name of the Group as defined within the Mission Editor. The Group must have a Unit with the type Client.

<h4> Returns </h4>

### CLIENT:IsMultiSeated()
Checks if the CLIENT is a multi-seated UNIT.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if multi-seated.


### CLIENT:Alive(CallBackFunction)
Checks for a client alive event and calls a function on a continuous basis.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>Function()</u> CallBackFunction : Create a function that will be called when a player joins the slot.

<h4> Returns </h4>
* [CLIENT](#client-class-)



### CLIENT:GetDCSGroup()
Return the DCSGroup of a Client.
This function is modified to deal with a couple of bugs in DCS 1.5.3

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Group#Group 


### CLIENT:GetClientGroupID()
Get the group ID of the client.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* [Group.ID](#group.id-class-) 


### CLIENT:GetClientGroupName()
Get the name of the group of the client.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* <u>String</u> 


### CLIENT:GetClientGroupUnit()
Returns the UNIT of the CLIENT.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* [UNIT](#unit-class-) 


### CLIENT:GetClientGroupDCSUnit()
Returns the DCSUnit of the CLIENT.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* [Unit](#unit-class-) 


### CLIENT:IsTransport()
Evaluates if the CLIENT is a transport.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true is a transport.


### CLIENT:ShowCargo()
Shows the [CARGO](#cargo-class-) contained within the CLIENT to the player as a message.
The [CARGO](#cargo-class-) is shown using the [MESSAGE](#message-class-) distribution system.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self

<h4> Returns </h4>

### CLIENT:Message(Message, MessageDuration, MessageCategory, MessageInterval, MessageID)
The main message driver for the CLIENT.
This function displays various messages to the Player logged into the CLIENT through the DCS World Messaging system.

<h4> Parameters </h4>
* [CLIENT](#client-class-)
self
* <u>String</u> Message : is the text describing the message.
* <u>Number</u> MessageDuration : is the duration in seconds that the Message should be displayed.
* <u>String</u> MessageCategory : is the category of the message (the title).
* <u>Number</u> MessageInterval : is the interval in seconds between the display of the [MESSAGE](#message-class-) when the CLIENT is in the air.
* <u>String</u> MessageID : is the identifier of the message when displayed with intervals.

<h4> Returns </h4>

