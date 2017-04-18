# Functional.Escort Module
Taking the lead of AI escorting your flight.

[ESCORT](#escort-class-) class

The [ESCORT](#escort-class-) class allows you to interact with escorting AI on your flight and take the lead.
Each escorting group can be commanded with a whole set of radio commands (radio menu in your flight, and then F10).

The radio commands will vary according the category of the group. The richest set of commands are with Helicopters and AirPlanes.
Ships and Ground troops will have a more limited set, but they can provide support through the bombing of targets designated by the other escorts.

RADIO MENUs that can be created:

Find a summary below of the current available commands:

Navigation ...:

Escort group navigation functions:

* **"Join-Up and Follow at x meters":** The escort group fill follow you at about x meters, and they will follow you.
* **"Flare":** Provides menu commands to let the escort group shoot a flare in the air in a color.
* **"Smoke":** Provides menu commands to let the escort group smoke the air in a color. Note that smoking is only available for ground and naval troops.

Hold position ...:

Escort group navigation functions:

* **"At current location":** Stops the escort group and they will hover 30 meters above the ground at the position they stopped.
* **"At client location":** Stops the escort group and they will hover 30 meters above the ground at the position they stopped.

Report targets ...:

Report targets will make the escort group to report any target that it identifies within a 8km range. Any detected target can be attacked using the 4. Attack nearby targets function. (see below).

* **"Report now":** Will report the current detected targets.
* **"Report targets on":** Will make the escort group to report detected targets and will fill the "Attack nearby targets" menu list.
* **"Report targets off":** Will stop detecting targets.

Scan targets ...:

Menu items to pop-up the escort group for target scanning. After scanning, the escort group will resume with the mission or defined task.

* **"Scan targets 30 seconds":** Scan 30 seconds for targets.
* **"Scan targets 60 seconds":** Scan 60 seconds for targets.

Attack targets ...:

This menu item will list all detected targets within a 15km range. Depending on the level of detection (known/unknown) and visuality, the targets type will also be listed.

Request assistance from ...:

This menu item will list all detected targets within a 15km range, as with the menu item **Attack Targets**.
This menu item allows to request attack support from other escorts supporting the current client group.
eg. the function allows a player to request support from the Ship escort to attack a target identified by the Plane escort with its Tomahawk missiles.
eg. the function allows a player to request support from other Planes escorting to bomb the unit with illumination missiles or bombs, so that the main plane escort can attack the area.

ROE ...:

Sets the Rules of Engagement (ROE) of the escort group when in flight.

* **"Hold Fire":** The escort group will hold fire.
* **"Return Fire":** The escort group will return fire.
* **"Open Fire":** The escort group will open fire on designated targets.
* **"Weapon Free":** The escort group will engage with any target.

Evasion ...:

Will define the evasion techniques that the escort group will perform during flight or combat.

* **"Fight until death":** The escort group will have no reaction to threats.
* **"Use flares, chaff and jammers":** The escort group will use passive defense using flares and jammers. No evasive manoeuvres are executed.
* **"Evade enemy fire":** The rescort group will evade enemy fire before firing.
* **"Go below radar and evade fire":** The escort group will perform evasive vertical manoeuvres.

Resume Mission ...:

Escort groups can have their own mission. This menu item will allow the escort group to resume their Mission from a given waypoint.
Note that this is really fantastic, as you now have the dynamic of taking control of the escort groups, and allowing them to resume their path or mission.

ESCORT construction methods.

Create a new SPAWN object with the [ESCORT:New()](#escort-new-escortclient-escortgroup-escortname-escortbriefing) method:

* [ESCORT:New()](#escort-new-escortclient-escortgroup-escortname-escortbriefing): Creates a new ESCORT object from a [GROUP](#group-class-) for a [CLIENT](#client-class-), with an optional briefing text.

ESCORT initialization methods.

The following menus are created within the RADIO MENU (F10) of an active unit hosted by a player:

* [ESCORT:MenuFollowAt()](#escort-menufollowat-distance): Creates a menu to make the escort follow the client.
* [ESCORT:MenuHoldAtEscortPosition()](#escort-menuholdatescortposition-height-seconds-menutextformat): Creates a menu to hold the escort at its current position.
* [ESCORT:MenuHoldAtLeaderPosition()](#escort-menuholdatleaderposition-height-seconds-menutextformat): Creates a menu to hold the escort at the client position.
* [ESCORT:MenuScanForTargets()](#escort-menuscanfortargets-height-seconds-menutextformat): Creates a menu so that the escort scans targets.
* [ESCORT:MenuFlare()](#escort-menuflare-menutextformat): Creates a menu to disperse flares.
* [ESCORT:MenuSmoke()](#escort-menusmoke-menutextformat): Creates a menu to disparse smoke.
* [ESCORT:MenuReportTargets()](#escort-menureporttargets-seconds): Creates a menu so that the escort reports targets.
* ESCORT-MenuReportPosition-: Creates a menu so that the escort reports its current position from bullseye.
* @{#ESCORT.MenuAssistedAttack: Creates a menu so that the escort supportes assisted attack from other escorts with the client.
* @{#ESCORT.MenuROE: Creates a menu structure to set the rules of engagement of the escort.
* @{#ESCORT.MenuEvasion: Creates a menu structure to set the evasion techniques when the escort is under threat.
* ESCORT-MenuResumeMission-: Creates a menu structure so that the escort can resume from a waypoint.


@usage
-- Declare a new EscortPlanes object as follows:

-- First find the GROUP object and the CLIENT object.
local EscortClient = CLIENT:FindByName( "Unit Name" ) -- The Unit Name is the name of the unit flagged with the skill Client in the mission editor.
local EscortGroup = GROUP:FindByName( "Group Name" ) -- The Group Name is the name of the group that will escort the Escort Client.

-- Now use these 2 objects to construct the new EscortPlanes object.
EscortPlanes = ESCORT:New( EscortClient, EscortGroup, "Desert", "Welcome to the mission. You are escorted by a plane with code name 'Desert', which can be instructed through the F10 radio menu." )



## ESCORT Class
<pre>
Inheritance : The ESCORT Class inherits from the following parents :
BASE
	`-- ESCORT
</pre>

<h4> Attributes </h4>

* [CLIENT](#client-class-) EscortClient
* [GROUP](#group-class-) EscortGroup
* <u>String</u> EscortName
* [MODE](#escort-mode-class-)EscortMode : The mode the escort is in.
* [SCHEDULER](#scheduler-class-) FollowScheduler : The instance of the SCHEDULER class.
* <u>Number</u> FollowDistance : The current follow distance.
* <u>Boolean</u> ReportTargets : If true, nearby targets are reported.
* [AI.Option.Air.val.REACTION_ON_THREAT](#ai.option.air.val.reaction_on_threat-class-) OptionReactionOnThreat : Which REACTION_ON_THREAT is set to the EscortGroup.
* [MENU_CLIENT](#menu_client-class-) EscortMenuResumeMission
* [DETECTION_BASE](#detection_base-class-) Detection


### ESCORT:New(EscortClient, EscortGroup, EscortName, EscortBriefing)
``` lua
-- Declare a new EscortPlanes object as follows:

-- First find the GROUP object and the CLIENT object.
local EscortClient = CLIENT:FindByName( "Unit Name" ) -- The Unit Name is the name of the unit flagged with the skill Client in the mission editor.
local EscortGroup = GROUP:FindByName( "Group Name" ) -- The Group Name is the name of the group that will escort the Escort Client.

-- Now use these 2 objects to construct the new EscortPlanes object.
EscortPlanes = ESCORT:New( EscortClient, EscortGroup, "Desert", "Welcome to the mission. You are escorted by a plane with code name 'Desert', which can be instructed through the F10 radio menu." )
```

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [CLIENT](#client-class-) EscortClient : The client escorted by the EscortGroup.
* [GROUP](#group-class-) EscortGroup : The group AI escorting the EscortClient.
* <u>String</u> EscortName : Name of the escort.
* <u>String</u> EscortBriefing : A text showing the ESCORT briefing to the player. Note that if no EscortBriefing is provided, the default briefing will be shown.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:SetDetection(Detection)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [DETECTION_BASE](#detection_base-class-) Detection

<h4> Returns </h4>

### ESCORT:TestSmokeDirectionVector(SmokeDirection)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* <u>Boolean</u> SmokeDirection : If true, then the direction vector will be smoked.

<h4> Returns </h4>

### ESCORT:Menus()

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuFollowAt(Distance)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [Distance](#distance-class-) Distance : The distance in meters that the escort needs to follow the client.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuHoldAtEscortPosition(Height, Seconds, MenuTextFormat)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [Distance](#distance-class-) Height : Optional parameter that sets the height in meters to let the escort orbit at the current location. The default value is 30 meters.
* [Time](#time-class-) Seconds : Optional parameter that lets the escort orbit at the current position for a specified time. (not implemented yet). The default value is 0 seconds, meaning, that the escort will orbit forever until a sequent command is given.
* <u>String</u> MenuTextFormat : Optional parameter that shows the menu option text. The text string is formatted, and should contain two %d tokens in the string. The first for the Height, the second for the Time (if given). If no text is given, the default text will be displayed.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuHoldAtLeaderPosition(Height, Seconds, MenuTextFormat)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [Distance](#distance-class-) Height : Optional parameter that sets the height in meters to let the escort orbit at the current location. The default value is 30 meters.
* [Time](#time-class-) Seconds : Optional parameter that lets the escort orbit at the current position for a specified time. (not implemented yet). The default value is 0 seconds, meaning, that the escort will orbit forever until a sequent command is given.
* <u>String</u> MenuTextFormat : Optional parameter that shows the menu option text. The text string is formatted, and should contain one or two %d tokens in the string. The first for the Height, the second for the Time (if given). If no text is given, the default text will be displayed.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuScanForTargets(Height, Seconds, MenuTextFormat)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [Distance](#distance-class-) Height : Optional parameter that sets the height in meters to let the escort orbit at the current location. The default value is 30 meters.
* [Time](#time-class-) Seconds : Optional parameter that lets the escort orbit at the current position for a specified time. (not implemented yet). The default value is 0 seconds, meaning, that the escort will orbit forever until a sequent command is given.
* <u>String</u> MenuTextFormat : Optional parameter that shows the menu option text. The text string is formatted, and should contain one or two %d tokens in the string. The first for the Height, the second for the Time (if given). If no text is given, the default text will be displayed.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuFlare(MenuTextFormat)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* <u>String</u> MenuTextFormat : Optional parameter that shows the menu option text. If no text is given, the default text will be displayed.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuSmoke(MenuTextFormat)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* <u>String</u> MenuTextFormat : Optional parameter that shows the menu option text. If no text is given, the default text will be displayed.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuReportTargets(Seconds)

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self
* [Time](#time-class-) Seconds : Optional parameter that lets the escort report their current detected targets after specified time interval in seconds. The default time is 30 seconds.

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuAssistedAttack()

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuROE()

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuEvasion()

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:MenuResumeMission()

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self

<h4> Returns </h4>
* [ESCORT](#escort-class-)



### ESCORT:JoinUpAndFollow(EscortGroup, EscortClient, Distance)

<h4> Parameters </h4>
* [ESCORT](#escort-class-) self
* [GROUP](#group-class-) EscortGroup
* [CLIENT](#client-class-) EscortClient
* [Distance](#distance-class-) Distance

<h4> Returns </h4>

### ESCORT:RegisterRoute()

<h4> Parameters </h4>
* [ESCORT](#escort-class-)
self

<h4> Returns </h4>
* <u>List[]</u> 


## ESCORT.MODE Class
<pre>
The ESCORT.MODE class does not inherit
</pre>

<h4> Attributes </h4>

* <u>Number</u> FOLLOW
* <u>Number</u> MISSION


## MENUPARAM Class
<pre>
The MENUPARAM class does not inherit
</pre>

<h4> Attributes </h4>

* [ESCORT](#escort-class-)
ParamSelf
* #Distance ParamDistance
* <u>Function()</u> ParamFunction
* <u>String</u> ParamMessage


