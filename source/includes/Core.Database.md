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
Creates a new DATABASE object, building a set of units belonging to a coalitions, categories, countries, types or with defined prefix names.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:FindUnit(UnitName)
Finds a Unit based on the Unit Name.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> UnitName

<h4> Returns </h4>
* [UNIT](#unit-class-)  The found Unit.


### DATABASE:AddUnit()
Adds a Unit based on the Unit Name in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:DeleteUnit()
Deletes a Unit from the DATABASE based on the Unit Name.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:AddStatic()
Adds a Static based on the Static Name in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:DeleteStatic()
Deletes a Static from the DATABASE based on the Static Name.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:FindStatic(StaticName)
Finds a STATIC based on the StaticName.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> StaticName

<h4> Returns </h4>
* [STATIC](#static-class-)  The found STATIC.


### DATABASE:AddAirbase(AirbaseName)
Adds a Airbase based on the Airbase Name in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> AirbaseName : The name of the airbase

<h4> Returns </h4>

### DATABASE:DeleteAirbase(AirbaseName)
Deletes a Airbase from the DATABASE based on the Airbase Name.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> AirbaseName : The name of the airbase

<h4> Returns </h4>

### DATABASE:FindAirbase(AirbaseName)
Finds an AIRBASE based on the AirbaseName.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> AirbaseName

<h4> Returns </h4>
* [AIRBASE](#airbase-class-)  The found AIRBASE.


### DATABASE:AddCargo(CargoName)
Adds a Cargo based on the Cargo Name in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> CargoName : The name of the airbase

<h4> Returns </h4>

### DATABASE:DeleteCargo(CargoName)
Deletes a Cargo from the DATABASE based on the Cargo Name.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> CargoName : The name of the airbase

<h4> Returns </h4>

### DATABASE:FindCargo(CargoName)
Finds an CARGO based on the CargoName.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> CargoName

<h4> Returns </h4>
* [CARGO](#cargo-class-)  The found CARGO.


### DATABASE:FindClient(ClientName)
Finds a CLIENT based on the ClientName.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> ClientName

<h4> Returns </h4>
* [CLIENT](#client-class-)  The found CLIENT.


### DATABASE:AddClient()
Adds a CLIENT based on the ClientName in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:FindGroup(GroupName)
Finds a GROUP based on the GroupName.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>String</u> GroupName

<h4> Returns </h4>
* [GROUP](#group-class-)  The found GROUP.


### DATABASE:AddGroup()
Adds a GROUP based on the GroupName in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:AddPlayer()
Adds a player based on the Player Name in the DATABASE.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:DeletePlayer()
Deletes a player from the DATABASE based on the Player Name.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self

<h4> Returns </h4>

### DATABASE:Spawn(SpawnTemplate)
Instantiate new Groups within the DCSRTE.
This method expects EXACTLY the same structure as a structure within the ME, and needs 2 additional fields defined:
SpawnCountryID, SpawnCategoryID
This method is used by the SPAWN class.

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
Iterate the DATABASE and call an iterator function for the given set, providing the Object for each element within the set and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive player in the database.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachUnit(IteratorFunction)
Iterate the DATABASE and call an iterator function for each **alive** UNIT, providing the UNIT and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachGroup(IteratorFunction)
Iterate the DATABASE and call an iterator function for each **alive** GROUP, providing the GROUP and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachPlayer(IteratorFunction)
Iterate the DATABASE and call an iterator function for each **ALIVE** player, providing the player name and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept the player name.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachPlayerJoined(IteratorFunction)
Iterate the DATABASE and call an iterator function for each player who has joined the mission, providing the Unit of the player and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachClient(IteratorFunction)
Iterate the DATABASE and call an iterator function for each CLIENT, providing the CLIENT to the function and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called object in the database. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:ForEachCargo(IteratorFunction)
Iterate the DATABASE and call an iterator function for each CARGO, providing the CARGO object to the function and optional parameters.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called for each object in the database. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [DATABASE](#database-class-)



### DATABASE:OnEventNewCargo(EventData)
Handles the OnEventNewCargo event.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### DATABASE:OnEventDeleteCargo(EventData)
Handles the OnEventDeleteCargo.

<h4> Parameters </h4>
* [DATABASE](#database-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

