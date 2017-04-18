# Core.Database Module
This module contains the DATABASE class, managing the database of mission objects.



##### 1) [DATABASE](#database-class-) class, extends [BASE](#base-class-)

Mission designers can use the DATABASE class to refer to:

* STATICS
* UNITS
* GROUPS
* CLIENTS
* AIRBASES
* PLAYERSJOINED
* PLAYERS
* CARGOS

On top, for internal MOOSE administration purposes, the DATBASE administers the Unit and Group TEMPLATES as defined within the Mission Editor.

Moose will automatically create one instance of the DATABASE class into the **global** object _DATABASE.
Moose refers to _DATABASE within the framework extensively, but you can also refer to the _DATABASE object within your missions if required.

##### 1.1) DATABASE iterators

You can iterate the database with the available iterator methods.
The iterator methods will walk the DATABASE set, and call for each element within the set a function that you provide.
The following iterator methods are currently available within the DATABASE:

* [DATABASE:ForEachUnit()](#database-foreachunit-iteratorfunction): Calls a function for each [UNIT](#unit-module-) it finds within the DATABASE.
* [DATABASE:ForEachGroup()](#database-foreachgroup-iteratorfunction): Calls a function for each [GROUP](#group-module-) it finds within the DATABASE.
* [DATABASE:ForEachPlayer()](#database-foreachplayer-iteratorfunction): Calls a function for each alive player it finds within the DATABASE.
* [DATABASE:ForEachPlayerJoined()](#database-foreachplayerjoined-iteratorfunction): Calls a function for each joined player it finds within the DATABASE.
* [DATABASE:ForEachClient()](#database-foreachclient-iteratorfunction): Calls a function for each [CLIENT](#client-module-) it finds within the DATABASE.
* DATABASE-ForEachClientAlive-: Calls a function for each alive [CLIENT](#client-module-) it finds within the DATABASE.



## DATABASE Class
<pre>
Inheritance : The DATABASE Class inherits from the following parents :
BASE
	`-- DATABASE
</pre>


### DATABASE:New()
``` lua
-- Define a new DATABASE Object. This DBObject will contain a reference to all Group and Unit Templates defined within the ME and the DCSRTE.
DBObject = DATABASE:New()
```

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:FindUnit(UnitName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> UnitName

<h4> Returns </h4>
* [UNIT](#unit-class-)  The found Unit.


### DATABASE:AddUnit()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:DeleteUnit()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:AddStatic()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:DeleteStatic()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:FindStatic(StaticName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> StaticName

<h4> Returns </h4>
* [STATIC](#static-class-)  The found STATIC.


### DATABASE:AddAirbase(AirbaseName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> AirbaseName : The name of the airbase

<h4> Returns </h4>

### DATABASE:DeleteAirbase(AirbaseName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> AirbaseName : The name of the airbase

<h4> Returns </h4>

### DATABASE:FindAirbase(AirbaseName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> AirbaseName

<h4> Returns </h4>
* [AIRBASE](#airbase-class-)  The found AIRBASE.


### DATABASE:AddCargo(CargoName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> CargoName : The name of the airbase

<h4> Returns </h4>

### DATABASE:DeleteCargo(CargoName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> CargoName : The name of the airbase

<h4> Returns </h4>

### DATABASE:FindCargo(CargoName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> CargoName

<h4> Returns </h4>
* [CARGO](#cargo-class-)  The found CARGO.


### DATABASE:FindClient(ClientName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> ClientName

<h4> Returns </h4>
* [CLIENT](#client-class-)  The found CLIENT.


### DATABASE:AddClient()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:FindGroup(GroupName)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> GroupName

<h4> Returns </h4>
* [GROUP](#group-class-)  The found GROUP.


### DATABASE:AddGroup()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:AddPlayer()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:DeletePlayer()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:Spawn(SpawnTemplate)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>List[]</u> SpawnTemplate

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE.SetStatusGroup(()

<h4> Parameters </h4>
<h4> Returns </h4>

### DATABASE.GetStatusGroup(()

<h4> Parameters </h4>
<h4> Returns </h4>

### DATABASE:GetStaticUnitTemplate()

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:ForEach(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive player in the database.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachUnit(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachGroup(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachPlayer(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept the player name.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachPlayerJoined(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachClient(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called object in the database. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachCargo(IteratorFunction)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:OnEventNewCargo(EventData)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### DATABASE:OnEventDeleteCargo(EventData)

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

