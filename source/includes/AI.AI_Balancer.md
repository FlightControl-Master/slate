# AI.AI_Balancer Module
Single-Player:**No** / Multi-Player:**Yes** / AI:**Yes** / Human:**No** / Types:**All** -- **AI Balancing will replace in multi player missions
non-occupied human slots with AI groups, in order to provide an engaging simulation environment,
even when there are hardly any players in the mission.**

![Banner Image](/includes/Pictures/AI_Balancer/Dia1.JPG)



#####  1) [AI_BALANCER](#ai_balancer-class) class, extends [FSM_SET](#fsm_set-class)

The [AI_BALANCER](#ai_balancer-class) class monitors and manages as many replacement AI groups as there are
CLIENTS in a SET_CLIENT collection, which are not occupied by human players.
In other words, use AI_BALANCER to simulate human behaviour by spawning in replacement AI in multi player missions.

The parent class [FSM_SET](#fsm_set-class) manages the functionality to control the Finite State Machine (FSM).
The mission designer can tailor the behaviour of the AI_BALANCER, by defining event and state transition methods.
An explanation about state and event transition methods can be found in the [FSM](#fsm-module) module documentation.

The mission designer can tailor the AI_BALANCER behaviour, by implementing a state or event handling method for the following:

* **AI_BALANCER-OnAfterSpawned**( AISet, From, Event, To, AIGroup ): Define to add extra logic when an AI is spawned.

#####  1.1) AI_BALANCER construction

Create a new AI_BALANCER object with the [AI_BALANCER:New()](#ai_balancer-new-setclient-spawnai) method:

#####  1.2) AI_BALANCER is a FSM

![Process](/includes/Pictures/AI_Balancer/Dia13.JPG)

#####  1.2.1) AI_BALANCER States

* **Monitoring** ( Set ): Monitoring the Set if all AI is spawned for the Clients.
* **Spawning** ( Set, ClientName ): There is a new AI group spawned with ClientName as the name of reference.
* **Spawned** ( Set, AIGroup ): A new AI has been spawned. You can handle this event to customize the AI behaviour with other AI FSMs or own processes.
* **Destroying** ( Set, AIGroup ): The AI is being destroyed.
* **Returning** ( Set, AIGroup ): The AI is returning to the airbase specified by the ReturnToAirbase methods. Handle this state to customize the return behaviour of the AI, if any.

#####  1.2.2) AI_BALANCER Events

* **Monitor** ( Set ): Every 10 seconds, the Monitor event is triggered to monitor the Set.
* **Spawn** ( Set, ClientName ): Triggers when there is a new AI group to be spawned with ClientName as the name of reference.
* **Spawned** ( Set, AIGroup ): Triggers when a new AI has been spawned. You can handle this event to customize the AI behaviour with other AI FSMs or own processes.
* **Destroy** ( Set, AIGroup ): The AI is being destroyed.
* **Return** ( Set, AIGroup ): The AI is returning to the airbase specified by the ReturnToAirbase methods.

#####  1.3) AI_BALANCER spawn interval for replacement AI

Use the method [AI_BALANCER:InitSpawnInterval()](#ai_balancer-initspawninterval-earliest-latest) to set the earliest and latest interval in seconds that is waited until a new replacement AI is spawned.

#####  1.4) AI_BALANCER returns AI to Airbases

By default, When a human player joins a slot that is AI_BALANCED, the AI group will be destroyed by default.
However, there are 2 additional options that you can use to customize the destroy behaviour.
When a human player joins a slot, you can configure to let the AI return to:

* [AI_BALANCER:ReturnToHomeAirbase()](#ai_balancer-returntohomeairbase-returntresholdrange): Returns the AI to the **home** [AIRBASE](#airbase-class).
* [AI_BALANCER:ReturnToNearestAirbases()](#ai_balancer-returntonearestairbases-returntresholdrange-returnairbaseset): Returns the AI to the **nearest friendly** [AIRBASE](#airbase-class).

Note that when AI returns to an airbase, the AI_BALANCER will trigger the **Return** event and the AI will return,
otherwise the AI_BALANCER will trigger a **Destroy** event, and the AI will be destroyed.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-01-17: There is still a problem with AI being destroyed, but not respawned. Need to check further upon that.

2017-01-08: AI_BALANCER:**InitSpawnInterval( Earliest, Latest )** added.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* **[Dutch_Baron](https://forums.eagle.ru/member.php?u=112075)**: Working together with James has resulted in the creation of the AI_BALANCER class. James has shared his ideas on balancing AI with air units, and together we made a first design which you can use now :-)
* **SNAFU**: Had a couple of mails with the guys to validate, if the same concept in the GCI/CAP script could be reworked within MOOSE. None of the script code has been used however within the new AI_BALANCER moose class.

#####  Authors:

* FlightControl: Framework Design &  Programming and Documentation.

## AI_BALANCER Class
<pre>
Inheritance : The AI_BALANCER Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_SET
			`-- AI_BALANCER
</pre>

<h4> Attributes </h4>

* [SET_CLIENT](#set_client-class) SetClient
* [SPAWN](#spawn-class) SpawnAI
* [GROUP](#group-class) Test


### AI_BALANCER:New(SetClient, SpawnAI)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* [SET_CLIENT](#set_client-class) SetClient : A SET\_CLIENT object that will contain the CLIENT objects to be monitored if they are alive or not (joined by a player).
* [SPAWN](#spawn-class) SpawnAI : The default Spawn object to spawn new AI Groups when needed.

<h4> Returns </h4>
* [AI_BALANCER](#ai_balancer-class)
self


### AI_BALANCER:InitSpawnInterval(Earliest, Latest)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* <u>Number</u> Earliest : The earliest a new AI can be spawned in seconds.
* <u>Number</u> Latest : The latest a new AI can be spawned in seconds.

<h4> Returns </h4>
* self self


### AI_BALANCER:ReturnToNearestAirbases(ReturnTresholdRange, ReturnAirbaseSet)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* [Distance](#distance-class) ReturnTresholdRange : If there is an enemy [CLIENT](#client-class) within the ReturnTresholdRange given in meters, the AI will not return to the nearest [AIRBASE](#airbase-class).
* [SET_AIRBASE](#set_airbase-class) ReturnAirbaseSet : The SET of [SET_AIRBASE](#set_airbase-class)s to evaluate where to return to.

<h4> Returns </h4>

### AI_BALANCER:ReturnToHomeAirbase(ReturnTresholdRange)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* [Distance](#distance-class) ReturnTresholdRange : If there is an enemy [CLIENT](#client-class) within the ReturnTresholdRange given in meters, the AI will not return to the nearest [AIRBASE](#airbase-class).

<h4> Returns </h4>

### AI_BALANCER:onenterSpawning(SetGroup, ClientName, AIGroup)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* [SET_GROUP](#set_group-class) SetGroup
* <u>String</u> ClientName
* [GROUP](#group-class) AIGroup

<h4> Returns </h4>

### AI_BALANCER:onenterDestroying(SetGroup, AIGroup)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* [SET_GROUP](#set_group-class) SetGroup
* [GROUP](#group-class) AIGroup

<h4> Returns </h4>

### AI_BALANCER:onenterReturning(SetGroup, AIGroup)

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self
* [SET_GROUP](#set_group-class) SetGroup
* [GROUP](#group-class) AIGroup

<h4> Returns </h4>

### AI_BALANCER:onenterMonitoring()

<h4> Parameters </h4>
* [AI_BALANCER](#ai_balancer-class)
self

<h4> Returns </h4>

