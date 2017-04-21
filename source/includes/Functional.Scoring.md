# Functional.Scoring Module
Single-Player:**Yes** / Multi-Player:**Yes** / Core:**Yes** -- **Administer the scoring of player achievements,
and create a CSV file logging the scoring events for use at team or squadron websites.**

![Banner Image](/includes/Pictures/SCORING/Dia1.JPG)



The [SCORING](#scoring-class-) class administers the scoring of player achievements,
and creates a CSV file logging the scoring events and results for use at team or squadron websites.

SCORING automatically calculates the threat level of the objects hit and destroyed by players,
which can be [Unit](#unit-module-), [Static) and @{Scenery](#static) and @{scenery-module-) objects.

Positive score points are granted when enemy or neutral targets are destroyed.
Negative score points or penalties are given when a friendly target is hit or destroyed.
This brings a lot of dynamism in the scoring, where players need to take care to inflict damage on the right target.
By default, penalties weight heavier in the scoring, to ensure that players don't commit fratricide.
The total score of the player is calculated by **adding the scores minus the penalties**.

![Banner Image](/includes/Pictures/SCORING/Dia4.JPG)

The score value is calculated based on the **threat level of the player** and the **threat level of the target**.
A calculated score takes the threat level of the target divided by a balanced threat level of the player unit.
As such, if the threat level of the target is high, and the player threat level is low, a higher score will be given than
if the threat level of the player would be high too.

![Banner Image](/includes/Pictures/SCORING/Dia5.JPG)

When multiple players hit the same target, and finally succeed in destroying the target, then each player who contributed to the target
destruction, will receive a score. This is important for targets that require significant damage before it can be destroyed, like
ships or heavy planes.

![Banner Image](/includes/Pictures/SCORING/Dia13.JPG)

Optionally, the score values can be **scaled** by a **scale**. Specific scales can be set for positive cores or negative penalties.
The default range of the scores granted is a value between 0 and 10. The default range of penalties given is a value between 0 and 30.

![Banner Image](/includes/Pictures/SCORING/Dia7.JPG)

**Additional scores** can be granted to **specific objects**, when the player(s) destroy these objects.

![Banner Image](/includes/Pictures/SCORING/Dia9.JPG)

Various [Zone](#zone-module-)s can be defined for which scores are also granted when objects in that [Zone](#zone-module-) are destroyed.
This is **specifically useful** to designate **scenery targets on the map** that will generate points when destroyed.

With a small change in MissionScripting.lua, the scoring results can also be logged in a **CSV file**.
These CSV files can be used to:

* Upload scoring to a database or a BI tool to publish the scoring results to the player community.
* Upload scoring in an (online) Excel like tool, using pivot tables and pivot charts to show mission results.
* Share scoring amoung players after the mission to discuss mission results.

Scores can be **reported**. **Menu options** are automatically added to **each player group** when a player joins a client slot or a CA unit.
Use the radio menu F10 to consult the scores while running the mission.
Scores can be reported for your user, or an overall score can be reported of all players currently active in the mission.

#####  1) [SCORING](#scoring-class-) class, extends [BASE](#base-class-)

#####  1.1) Set the destroy score or penalty scale

Score scales can be set for scores granted when enemies or friendlies are destroyed.
Use the method [SCORING:SetScaleDestroyScore()](#scoring-setscaledestroyscore-scale) to set the scale of enemy destroys (positive destroys).
Use the method [SCORING:SetScaleDestroyPenalty()](#scoring-setscaledestroypenalty-scale) to set the scale of friendly destroys (negative destroys).

local Scoring = SCORING:New( "Scoring File" )
Scoring:SetScaleDestroyScore( 10 )
Scoring:SetScaleDestroyPenalty( 40 )

The above sets the scale for valid scores to 10. So scores will be given in a scale from 0 to 10.
The penalties will be given in a scale from 0 to 40.

#####  1.2) Define special targets that will give extra scores.

Special targets can be set that will give extra scores to the players when these are destroyed.
Use the methods [SCORING:AddUnitScore()](#scoring-addunitscore-scoreunit-score) and [SCORING:RemoveUnitScore()](#scoring-removeunitscore-scoreunit) to specify a special additional score for a specific [Unit](#unit-module-)s.
Use the methods [SCORING:AddStaticScore()](#scoring-addstaticscore-scorestatic-score) and [SCORING:RemoveStaticScore()](#scoring-removestaticscore-scorestatic) to specify a special additional score for a specific [Static](#static-module-)s.
Use the method SCORING-SetGroupGroup- to specify a special additional score for a specific [Group](#group-module-)s.

local Scoring = SCORING:New( "Scoring File" )
Scoring:AddUnitScore( UNIT:FindByName( "Unit #001" ), 200 )
Scoring:AddStaticScore( STATIC:FindByName( "Static #1" ), 100 )

The above grants an additional score of 200 points for Unit #001 and an additional 100 points of Static #1 if these are destroyed.
Note that later in the mission, one can remove these scores set, for example, when the a goal achievement time limit is over.
For example, this can be done as follows:

Scoring:RemoveUnitScore( UNIT:FindByName( "Unit #001" ) )

#####  1.3) Define destruction zones that will give extra scores.

Define zones of destruction. Any object destroyed within the zone of the given category will give extra points.
Use the method [SCORING:AddZoneScore()](#scoring-addzonescore-scorezone-score) to add a [Zone](#zone-module-) for additional scoring.
Use the method [SCORING:RemoveZoneScore()](#scoring-removezonescore-scorezone) to remove a [Zone](#zone-module-) for additional scoring.
There are interesting variations that can be achieved with this functionality. For example, if the [Zone](#zone-module-) is a [ZONE_UNIT](#zone_unit-class-),
then the zone is a moving zone, and anything destroyed within that [Zone](#zone-module-) will generate points.
The other implementation could be to designate a scenery target (a building) in the mission editor surrounded by a [Zone](#zone-module-),
just large enough around that building.

#####  1.4) Add extra Goal scores upon an event or a condition.

A mission has goals and achievements. The scoring system provides an API to set additional scores when a goal or achievement event happens.
Use the method [SCORING:AddGoalScore()](#scoring-addgoalscore-playerunit-goaltag-text-score) to add a score for a Player at any time in your mission.

#####  1.5) Configure fratricide level.

When a player commits too much damage to friendlies, his penalty score will reach a certain level.
Use the method [SCORING:SetFratricide()](#scoring-setfratricide-fratricide) to define the level when a player gets kicked.
By default, the fratricide level is the default penalty mutiplier * 2 for the penalty score.

#####  1.6) Penalty score when a player changes the coalition.

When a player changes the coalition, he can receive a penalty score.
Use the method [SCORING:SetCoalitionChangePenalty()](#scoring-setcoalitionchangepenalty-coalitionchangepenalty) to define the penalty when a player changes coalition.
By default, the penalty for changing coalition is the default penalty scale.

#####  1.8) Define output CSV files.

The CSV file is given the name of the string given in the [SCORING:New()](#scoring-new-gamename){} constructor, followed by the .csv extension.
The file is incrementally saved in the **<User>\\Saved Games\\DCS\\Logs** folder, and has a time stamp indicating each mission run.
See the following example:

local ScoringFirstMission = SCORING:New( "FirstMission" )
local ScoringSecondMission = SCORING:New( "SecondMission" )

The above documents that 2 Scoring objects are created, ScoringFirstMission and ScoringSecondMission.

#####  1.9) Configure messages.

When players hit or destroy targets, messages are sent.
Various methods exist to configure:

* Which messages are sent upon the event.
* Which audience receives the message.

#####  1.9.1) Configure the messages sent upon the event.

Use the following methods to configure when to send messages. By default, all messages are sent.

* [SCORING:SetMessagesHit()](#scoring-setmessageshit-onoff): Configure to send messages after a target has been hit.
* [SCORING:SetMessagesDestroy()](#scoring-setmessagesdestroy-onoff): Configure to send messages after a target has been destroyed.
* SCORING-SetMessagesAddon-: Configure to send messages for additional score, after a target has been destroyed.
* [SCORING:SetMessagesZone()](#scoring-setmessageszone-onoff): Configure to send messages for additional score, after a target has been destroyed within a given zone.

#####  1.9.2) Configure the audience of the messages.

Use the following methods to configure the audience of the messages. By default, the messages are sent to all players in the mission.

* SCORING-SetMessagesToAll-: Configure to send messages to all players.
* SCORING-SetMessagesToCoalition-: Configure to send messages to only those players within the same coalition as the player.




#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-02-26: Initial class and API.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **Wingthor (TAW)**: Testing & Advice.
* **Dutch-Baron (TAW)**: Testing & Advice.
* **[Whisper](http://forums.eagle.ru/member.php?u=3829): Testing and Advice.

#####  Authors:

* **FlightControl**: Concept, Design & Programming.

## SCORING Class
<pre>
Inheritance : The SCORING Class inherits from the following parents :
BASE
	`-- SCORING
</pre>

<h4> Attributes </h4>

* Players A : collection of the current players that have joined the game.


### SCORING:New(GameName)
``` lua
-- Define a new scoring object for the mission Gori Valley.
ScoringObject = SCORING:New( "Gori Valley" )
```
Creates a new SCORING object to administer the scoring achieved by players.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> GameName : The name of the game. This name is also logged in the CSV score file.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:SetScaleDestroyScore(Scale)
Set the scale for scoring valid destroys (enemy destroys).
A default calculated score is a value between 1 and 10.
The scale magnifies the scores given to the players.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Number</u> Scale : The scale of the score given.

<h4> Returns </h4>

### SCORING:SetScaleDestroyPenalty(Scale)
Set the scale for scoring penalty destroys (friendly destroys).
A default calculated penalty is a value between 1 and 10.
The scale magnifies the scores given to the players.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Number</u> Scale : The scale of the score given.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:AddUnitScore(ScoreUnit, Score)
Add a [Unit](#unit-module-) for additional scoring when the [Unit](#unit-module-) is destroyed.
Note that if there was already a [Unit](#unit-module-) declared within the scoring with the same name,
then the old [Unit](#unit-module-)  will be replaced with the new [Unit](#unit-module-).

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [UNIT](#unit-class-) ScoreUnit : The [Unit](#unit-module-) for which the Score needs to be given.
* <u>Number</u> Score : The Score value.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:RemoveUnitScore(ScoreUnit)
Removes a [Unit](#unit-module-) for additional scoring when the [Unit](#unit-module-) is destroyed.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [UNIT](#unit-class-) ScoreUnit : The [Unit](#unit-module-) for which the Score needs to be given.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:AddStaticScore(ScoreStatic, Score)
Add a [Static](#static-module-) for additional scoring when the [Static](#static-module-) is destroyed.
Note that if there was already a [Static](#static-module-) declared within the scoring with the same name,
then the old [Static](#static-module-)  will be replaced with the new [Static](#static-module-).

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [UNIT](#unit-class-) ScoreStatic : The [Static](#static-module-) for which the Score needs to be given.
* <u>Number</u> Score : The Score value.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:RemoveStaticScore(ScoreStatic)
Removes a [Static](#static-module-) for additional scoring when the [Static](#static-module-) is destroyed.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [UNIT](#unit-class-) ScoreStatic : The [Static](#static-module-) for which the Score needs to be given.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:AddScoreGroup(ScoreGroup, Score)
Specify a special additional score for a [Group](#group-module-).

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [GROUP](#group-class-) ScoreGroup : The [Group](#group-module-) for which each [Unit](#unit-module-) a Score is given.
* <u>Number</u> Score : The Score value.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:AddZoneScore(ScoreZone, Score)
Add a [Zone](#zone-module-) to define additional scoring when any object is destroyed in that zone.
Note that if a [Zone](#zone-module-) with the same name is already within the scoring added, the [Zone](#zone-module-) (type) and Score will be replaced!
This allows for a dynamic destruction zone evolution within your mission.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [ZONE_BASE](#zone_base-class-) ScoreZone : The [Zone](#zone-module-) which defines the destruction score perimeters.
* <u>Number</u> Score : The Score value.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:RemoveZoneScore(ScoreZone)
Remove a [Zone](#zone-module-) for additional scoring.
The scoring will search if any [Zone](#zone-module-) is added with the given name, and will remove that zone from the scoring.
This allows for a dynamic destruction zone evolution within your mission.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [ZONE_BASE](#zone_base-class-) ScoreZone : The [Zone](#zone-module-) which defines the destruction score perimeters.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:SetMessagesHit(OnOff)
Configure to send messages after a target has been hit.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Boolean</u> OnOff : If true is given, the messages are sent.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:IfMessagesHit()
If to send messages after a target has been hit.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### SCORING:SetMessagesDestroy(OnOff)
Configure to send messages after a target has been destroyed.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Boolean</u> OnOff : If true is given, the messages are sent.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:IfMessagesDestroy()
If to send messages after a target has been destroyed.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### SCORING:SetMessagesScore(OnOff)
Configure to send messages after a target has been destroyed and receives additional scores.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Boolean</u> OnOff : If true is given, the messages are sent.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:IfMessagesScore()
If to send messages after a target has been destroyed and receives additional scores.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### SCORING:SetMessagesZone(OnOff)
Configure to send messages after a target has been hit in a zone, and additional score is received.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Boolean</u> OnOff : If true is given, the messages are sent.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:IfMessagesZone()
If to send messages after a target has been hit in a zone, and additional score is received.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### SCORING:SetMessagesToAll()
Configure to send messages to all players.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:IfMessagesToAll()
If to send messages to all players.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### SCORING:SetMessagesToCoalition()
Configure to send messages to only those players within the same coalition as the player.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:IfMessagesToCoalition()
If to send messages to only those players within the same coalition as the player.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self

<h4> Returns </h4>
* <u>Boolean</u> 


### SCORING:SetFratricide(Fratricide)
When a player commits too much damage to friendlies, his penalty score will reach a certain level.
Use this method to define the level when a player gets kicked.
By default, the fratricide level is the default penalty mutiplier * 2 for the penalty score.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Number</u> Fratricide : The amount of maximum penalty that may be inflicted by a friendly player before he gets kicked.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:SetCoalitionChangePenalty(CoalitionChangePenalty)
When a player changes the coalition, he can receive a penalty score.
Use the method [SCORING:SetCoalitionChangePenalty()](#scoring-setcoalitionchangepenalty-coalitionchangepenalty) to define the penalty when a player changes coalition.
By default, the penalty for changing coalition is the default penalty scale.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>Number</u> CoalitionChangePenalty : The amount of penalty that is given.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:AddGoalScore(PlayerUnit, GoalTag, Text, Score)
Add a goal score for a player.
The method takes the PlayerUnit for which the Goal score needs to be set.
The GoalTag is a string or identifier that is taken into the CSV file scoring log to identify the goal.
A free text can be given that is shown to the players.
The Score can be both positive and negative.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [UNIT](#unit-class-) PlayerUnit : The [Unit](#unit-module-) of the Player. Other Properties for the scoring are taken from this PlayerUnit, like coalition, type etc.
* <u>String</u> GoalTag : The string or identifier that is used in the CSV file to identify the goal (sort or group later in Excel).
* <u>String</u> Text : A free text that is shown to the players.
* <u>Number</u> Score : The score can be both positive or negative ( Penalty ).

<h4> Returns </h4>

### SCORING:OnEventPlayerEnterUnit(Event)
Handles the OnPlayerEnterUnit event for the scoring.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>

### SCORING:OnEventPlayerLeaveUnit(Event)
Handles the OnPlayerLeaveUnit event for the scoring.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>

### SCORING:ReportDetailedPlayerHits(PlayerName)
Produce detailed report of player hit scores.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> PlayerName : The name of the player.

<h4> Returns </h4>
* <u>String</u>  The report.


### SCORING:ReportDetailedPlayerDestroys(PlayerName)
Produce detailed report of player destroy scores.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> PlayerName : The name of the player.

<h4> Returns </h4>
* <u>String</u>  The report.


### SCORING:ReportDetailedPlayerCoalitionChanges(PlayerName)
Produce detailed report of player penalty scores because of changing the coalition.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> PlayerName : The name of the player.

<h4> Returns </h4>
* <u>String</u>  The report.


### SCORING:ReportDetailedPlayerGoals(PlayerName)
Produce detailed report of player goal scores.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> PlayerName : The name of the player.

<h4> Returns </h4>
* <u>String</u>  The report.


### SCORING:ReportDetailedPlayerMissions(PlayerName)
Produce detailed report of player penalty scores because of changing the coalition.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> PlayerName : The name of the player.

<h4> Returns </h4>
* <u>String</u>  The report.


### SCORING:ReportScoreGroupSummary(PlayerGroup)
Report Group Score Summary

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [GROUP](#group-class-) PlayerGroup : The player group.

<h4> Returns </h4>

### SCORING:ReportScoreGroupDetailed(PlayerGroup)
Report Group Score Detailed

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [GROUP](#group-class-) PlayerGroup : The player group.

<h4> Returns </h4>

### SCORING:ReportScoreAllSummary(PlayerGroup)
Report all players score

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* [GROUP](#group-class-) PlayerGroup : The player group.

<h4> Returns </h4>

### SCORING:OpenCSV(ScoringCSV)
``` lua
-- Open a new CSV file to log the scores of the game Gori Valley. Let the name of the CSV file begin with "Player Scores".
ScoringObject = SCORING:New( "Gori Valley" )
ScoringObject:OpenCSV( "Player Scores" )
```
Opens a score CSV file to log the scores.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> ScoringCSV

<h4> Returns </h4>
* [SCORING](#scoring-class-)



### SCORING:ScoreCSV(PlayerName, TargetPlayerName, ScoreType, ScoreTimes, ScoreAmount, PlayerUnitName, PlayerUnitCoalition, PlayerUnitCategory, PlayerUnitType, TargetUnitName, TargetUnitCoalition, TargetUnitCategory, TargetUnitType)
Registers a score for a player.

<h4> Parameters </h4>
* [SCORING](#scoring-class-)
self
* <u>String</u> PlayerName : The name of the player.
* <u>String</u> TargetPlayerName : The name of the target player.
* <u>String</u> ScoreType : The type of the score.
* <u>String</u> ScoreTimes : The amount of scores achieved.
* <u>String</u> ScoreAmount : The score given.
* <u>String</u> PlayerUnitName : The unit name of the player.
* <u>String</u> PlayerUnitCoalition : The coalition of the player unit.
* <u>String</u> PlayerUnitCategory : The category of the player unit.
* <u>String</u> PlayerUnitType : The type of the player unit.
* <u>String</u> TargetUnitName : The name of the target unit.
* <u>String</u> TargetUnitCoalition : The coalition of the target unit.
* <u>String</u> TargetUnitCategory : The category of the target unit.
* <u>String</u> TargetUnitType : The type of the target unit.

<h4> Returns </h4>
* [SCORING](#scoring-class-)



