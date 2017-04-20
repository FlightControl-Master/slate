# Core.Set Module
**Core** - SET_ classes define **collections** of objects to perform **bulk actions** and logically **group** objects.

![Banner Image](/includes/Pictures/SET/Dia1.JPG)



SET_ classes group objects of the same type into a collection, which is either:

* Manually managed using the **:Add...()** or **:Remove...()** methods. The initial SET can be filtered with the **SET_BASE-FilterOnce-** method
* Dynamically updated when new objects are created or objects are destroyed using the **SET_BASE-FilterStart-** method.

Various types of SET_ classes are available:

* [SET_UNIT](#set_unit-class-): Defines a colleciton of [Unit](#unit-module-)s filtered by filter criteria.
* [SET_GROUP](#set_group-class-): Defines a collection of [Group](#group-module-)s filtered by filter criteria.
* [SET_CLIENT](#set_client-class-): Defines a collection of [Client](#client-module-)s filterd by filter criteria.
* [SET_AIRBASE](#set_airbase-class-): Defines a collection of [Airbase](#airbase-module-)s filtered by filter criteria.

These classes are derived from [SET_BASE](#set_base-class-), which contains the main methods to manage SETs.

A multitude of other methods are available in SET_ classes that allow to:

* Validate the presence of objects in the SET.
* Trigger events when objects in the SET change a zone presence.

#####  Authors:

* FlightControl : Design & Programming

#####  Contributions:


## SET_BASE Class
<pre>
Inheritance : The SET_BASE Class inherits from the following parents :
BASE
	`-- SET_BASE
</pre>
The [SET_BASE](#set_base-class-) class defines the core functions that define a collection of objects.
A SET provides iterators to iterate the SET, but will **temporarily** yield the ForEach interator loop at defined **"intervals"** to the mail simulator loop.
In this way, large loops can be done while not blocking the simulator main processing loop.
The default **"yield interval"** is after 10 objects processed.
The default **"time interval"** is after 0.001 seconds.

#####  1.1) Add or remove objects from the SET

Some key core functions are [SET_BASE:Add()](#set_base-add-objectname-object) and [SET_BASE:Remove()](#set_base-remove-objectname) to add or remove objects from the SET in your logic.

#####  1.2) Define the SET iterator **"yield interval"** and the **"time interval"**

Modify the iterator intervals with the SET_BASE-SetInteratorIntervals- method.
You can set the **"yield interval"**, and the **"time interval"**. (See above).



<h4> Attributes </h4>

* <u>List[]</u> Filter
* <u>List[]</u> Set
* <u>List[]</u> List
* [SCHEDULER](#scheduler-class-) CallScheduler


### SET_BASE:New()
``` lua
-- Define a new SET_BASE Object. This DBObject will contain a reference to all Group and Unit Templates defined within the ME and the DCSRTE.
DBObject = SET_BASE:New()
```

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:GetSet()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:Add(ObjectName, Object)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>String</u> ObjectName
* [BASE](#base-class-) Object

<h4> Returns </h4>
* [BASE](#base-class-)  The added BASE Object.


### SET_BASE:AddObject(Object)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* [OBJECT](#object-class-) Object

<h4> Returns </h4>
* [BASE](#base-class-)  The added BASE Object.


### SET_BASE:Remove(ObjectName)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>String</u> ObjectName

<h4> Returns </h4>

### SET_BASE:Get(ObjectName)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>String</u> ObjectName

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:GetFirst()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:GetLast()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:GetRandom()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:Count()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* <u>Number</u> 


### SET_BASE:SetDatabase(BaseSet)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* [SET_BASE](#set_base-class-)
BaseSet

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:SetIteratorIntervals(YieldInterval, TimeInterval)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>Number</u> YieldInterval : Sets the frequency when the iterator loop will yield after the number of objects processed. The default frequency is 10 objects processed.
* <u>Number</u> TimeInterval : Sets the time in seconds when the main logic will resume the iterator loop. The default time is 0.001 seconds.

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:FilterOnce()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:FilterStop()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:FindNearestObjectFromPointVec2(PointVec2)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest object in the set.

<h4> Returns </h4>
* [BASE](#base-class-)  The closest object.


### SET_BASE:ForEach(IteratorFunction)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called.

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:IsIncludeObject(Object)

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>List[]</u> Object

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:Flush()

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* <u>String</u>  A string with the names of the objects.


## SET_GROUP Class
<pre>
Inheritance : The SET_GROUP Class inherits from the following parents :
BASE
	`-- SET_BASE
		`-- SET_GROUP
</pre>

Mission designers can use the [SET_GROUP](#set_group-class-) class to build sets of groups belonging to certain:

* Coalitions
* Categories
* Countries
* Starting with certain prefix strings.

#####  2.1) SET_GROUP constructor

Create a new SET_GROUP object with the SET_GROUP-New- method:

* SET_GROUP-New-: Creates a new SET_GROUP object.

#####  2.2) Add or Remove GROUP(s) from SET_GROUP

GROUPS can be added and removed using the [SET_GROUP:AddGroupsByName()](#set_group-addgroupsbyname-addgroupnames) and [SET_GROUP:RemoveGroupsByName()](#set_group-removegroupsbyname-removegroupnames) respectively.
These methods take a single GROUP name or an array of GROUP names to be added or removed from SET_GROUP.

#####  2.3) SET_GROUP filter criteria

You can set filter criteria to define the set of groups within the SET_GROUP.
Filter criteria are defined by:

* [SET_GROUP:FilterCoalitions()](#set_group-filtercoalitions-coalitions): Builds the SET_GROUP with the groups belonging to the coalition(s).
* [SET_GROUP:FilterCategories()](#set_group-filtercategories-categories): Builds the SET_GROUP with the groups belonging to the category(ies).
* [SET_GROUP:FilterCountries()](#set_group-filtercountries-countries): Builds the SET_GROUP with the gruops belonging to the country(ies).
* [SET_GROUP:FilterPrefixes()](#set_group-filterprefixes-prefixes): Builds the SET_GROUP with the groups starting with the same prefix string(s).

Once the filter criteria have been set for the SET_GROUP, you can start filtering using:

* SET_GROUP-FilterStart-: Starts the filtering of the groups within the SET_GROUP and add or remove GROUP objects **dynamically**.

Planned filter criteria within development are (so these are not yet available):

* SET_GROUP-FilterZones-: Builds the SET_GROUP with the groups within a [ZONE](#zone-class-).

#####  2.4) SET_GROUP iterators

Once the filters have been defined and the SET_GROUP has been built, you can iterate the SET_GROUP with the available iterator methods.
The iterator methods will walk the SET_GROUP set, and call for each element within the set a function that you provide.
The following iterator methods are currently available within the SET_GROUP:

* [SET_GROUP:ForEachGroup()](#set_group-foreachgroup-iteratorfunction): Calls a function for each alive group it finds within the SET_GROUP.
* [SET_GROUP:ForEachGroupCompletelyInZone()](#set_group-foreachgroupcompletelyinzone-zoneobject-iteratorfunction): Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence completely in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.
* [SET_GROUP:ForEachGroupPartlyInZone()](#set_group-foreachgrouppartlyinzone-zoneobject-iteratorfunction): Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence partly in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.
* [SET_GROUP:ForEachGroupNotInZone()](#set_group-foreachgroupnotinzone-zoneobject-iteratorfunction): Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence not in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.





### SET_GROUP:New()
``` lua
-- Define a new SET_GROUP Object. This DBObject will contain a reference to all alive GROUPS.
DBObject = SET_GROUP:New()
```

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:AddGroupsByName(AddGroupNames)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-) self
* <u>String</u> AddGroupNames : A single name or an array of GROUP names.

<h4> Returns </h4>
* self 


### SET_GROUP:RemoveGroupsByName(RemoveGroupNames)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-) self
* [GROUP](#group-class-) RemoveGroupNames : A single name or an array of GROUP names.

<h4> Returns </h4>
* self 


### SET_GROUP:FindGroup(GroupName)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> GroupName

<h4> Returns </h4>
* [GROUP](#group-class-)  The found Group.


### SET_GROUP:FindNearestGroupFromPointVec2(PointVec2)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest object in the set.

<h4> Returns </h4>
* [GROUP](#group-class-)  The closest group.


### SET_GROUP:FilterCoalitions(Coalitions)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterCategories(Categories)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Categories : Can take the following values: "plane", "helicopter", "ground", "ship".

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterCountries(Countries)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterPrefixes(Prefixes)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Prefixes : The prefix of which the group name starts with.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterStart()

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:AddInDatabase(Event)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the GROUP
* <u>List[]</u>  The GROUP


### SET_GROUP:FindInDatabase(Event)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the GROUP
* <u>List[]</u>  The GROUP


### SET_GROUP:ForEachGroup(IteratorFunction)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:ForEachGroupCompletelyInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:ForEachGroupPartlyInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:ForEachGroupNotInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:IsIncludeObject(MooseGroup)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [GROUP](#group-class-) MooseGroup

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



## SET_UNIT Class
<pre>
Inheritance : The SET_UNIT Class inherits from the following parents :
BASE
	`-- SET_BASE
		`-- SET_UNIT
</pre>

Mission designers can use the SET_UNIT class to build sets of units belonging to certain:

* Coalitions
* Categories
* Countries
* Unit types
* Starting with certain prefix strings.

#####  3.1) SET_UNIT constructor

Create a new SET_UNIT object with the SET_UNIT-New- method:

* SET_UNIT-New-: Creates a new SET_UNIT object.

#####  3.2) Add or Remove UNIT(s) from SET_UNIT

UNITs can be added and removed using the [SET_UNIT:AddUnitsByName()](#set_unit-addunitsbyname-addunitnames) and [SET_UNIT:RemoveUnitsByName()](#set_unit-removeunitsbyname-removeunitnames) respectively.
These methods take a single UNIT name or an array of UNIT names to be added or removed from SET_UNIT.

#####  3.3) SET_UNIT filter criteria

You can set filter criteria to define the set of units within the SET_UNIT.
Filter criteria are defined by:

* [SET_UNIT:FilterCoalitions()](#set_unit-filtercoalitions-coalitions): Builds the SET_UNIT with the units belonging to the coalition(s).
* [SET_UNIT:FilterCategories()](#set_unit-filtercategories-categories): Builds the SET_UNIT with the units belonging to the category(ies).
* [SET_UNIT:FilterTypes()](#set_unit-filtertypes-types): Builds the SET_UNIT with the units belonging to the unit type(s).
* [SET_UNIT:FilterCountries()](#set_unit-filtercountries-countries): Builds the SET_UNIT with the units belonging to the country(ies).
* [SET_UNIT:FilterPrefixes()](#set_unit-filterprefixes-prefixes): Builds the SET_UNIT with the units starting with the same prefix string(s).

Once the filter criteria have been set for the SET_UNIT, you can start filtering using:

* SET_UNIT-FilterStart-: Starts the filtering of the units within the SET_UNIT.

Planned filter criteria within development are (so these are not yet available):

* SET_UNIT-FilterZones-: Builds the SET_UNIT with the units within a [ZONE](#zone-class-).

#####  3.4) SET_UNIT iterators

Once the filters have been defined and the SET_UNIT has been built, you can iterate the SET_UNIT with the available iterator methods.
The iterator methods will walk the SET_UNIT set, and call for each element within the set a function that you provide.
The following iterator methods are currently available within the SET_UNIT:

* [SET_UNIT:ForEachUnit()](#set_unit-foreachunit-iteratorfunction): Calls a function for each alive unit it finds within the SET_UNIT.
* [SET_GROUP:ForEachGroupCompletelyInZone()](#set_group-foreachgroupcompletelyinzone-zoneobject-iteratorfunction): Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence completely in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.
* [SET_GROUP:ForEachGroupNotInZone()](#set_group-foreachgroupnotinzone-zoneobject-iteratorfunction): Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence not in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.

Planned iterators methods in development are (so these are not yet available):

* SET_UNIT-ForEachUnitInUnit-: Calls a function for each unit contained within the SET_UNIT.
* [SET_UNIT:ForEachUnitCompletelyInZone()](#set_unit-foreachunitcompletelyinzone-zoneobject-iteratorfunction): Iterate and call an iterator function for each **alive** UNIT presence completely in a [Zone](#zone-module-), providing the UNIT and optional parameters to the called function.
* [SET_UNIT:ForEachUnitNotInZone()](#set_unit-foreachunitnotinzone-zoneobject-iteratorfunction): Iterate and call an iterator function for each **alive** UNIT presence not in a [Zone](#zone-module-), providing the UNIT and optional parameters to the called function.

#####  3.5 ) SET_UNIT atomic methods

Various methods exist for a SET_UNIT to perform actions or calculations and retrieve results from the SET_UNIT:

* [SET_UNIT:GetTypeNames()](#set_unit-gettypenames-delimiter): Retrieve the type names of the [Unit](#unit-module-)s in the SET, delimited by a comma.





### SET_UNIT:New()
``` lua
-- Define a new SET_UNIT Object. This DBObject will contain a reference to all alive Units.
DBObject = SET_UNIT:New()
```

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:AddUnit(AddUnit)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> AddUnit : A single UNIT.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:AddUnitsByName(AddUnitNames)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> AddUnitNames : A single name or an array of UNIT names.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:RemoveUnitsByName(RemoveUnitNames)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-) self
* [UNIT](#unit-class-) RemoveUnitNames : A single name or an array of UNIT names.

<h4> Returns </h4>
* self 


### SET_UNIT:FindUnit(UnitName)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> UnitName

<h4> Returns </h4>
* [UNIT](#unit-class-)  The found Unit.


### SET_UNIT:FilterCoalitions(Coalitions)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterCategories(Categories)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Categories : Can take the following values: "plane", "helicopter", "ground", "ship".

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterTypes(Types)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Types : Can take those type strings known within DCS world.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterCountries(Countries)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterPrefixes(Prefixes)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Prefixes : The prefix of which the unit name starts with.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterHasRadar(RadarTypes)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>List[]</u> RadarTypes : The radar types.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterHasSEAD()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterStart()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:AddInDatabase(Event)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the UNIT
* <u>List[]</u>  The UNIT


### SET_UNIT:FindInDatabase(Event)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the UNIT
* <u>List[]</u>  The UNIT


### SET_UNIT:ForEachUnit(IteratorFunction)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive UNIT in the SET_UNIT. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:ForEachUnitCompletelyInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive UNIT in the SET_UNIT. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:ForEachUnitNotInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive UNIT in the SET_UNIT. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:GetUnitTypes()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* #map<<u>String</u>,<u>Number</u>>  A map of the unit types found. The key is the UnitTypeName and the value is the amount of unit types found.


### SET_UNIT:GetUnitTypesText()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The unit types string


### SET_UNIT:GetUnitThreatLevels()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>List[]</u>. 


### SET_UNIT:CalculateThreatLevelA2G()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>

### SET_UNIT:HasRadar(RadarType)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* Dcs.DCSWrapper.Unit#Unit.RadarType RadarType

<h4> Returns </h4>
* <u>Number</u>  The amount of radars in the Set with the given type


### SET_UNIT:HasSEAD()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The amount of SEADable units in the Set


### SET_UNIT:HasGroundUnits()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The amount of ground targets in the Set.


### SET_UNIT:HasFriendlyUnits()

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The amount of ground targets in the Set.


### SET_UNIT:IsIncludeObject(MUnit)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [UNIT](#unit-class-) MUnit

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:GetTypeNames(Delimiter)

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Delimiter : (optional) The delimiter, which is default a comma.

<h4> Returns </h4>
* <u>String</u>  The types of the [Unit](#unit-module-)s delimited.


## SET_CLIENT Class
<pre>
Inheritance : The SET_CLIENT Class inherits from the following parents :
BASE
	`-- SET_BASE
		`-- SET_CLIENT
</pre>

Mission designers can use the [SET_CLIENT](#set_client-class-) class to build sets of units belonging to certain:

* Coalitions
* Categories
* Countries
* Client types
* Starting with certain prefix strings.

#####  4.1) SET_CLIENT constructor

Create a new SET_CLIENT object with the SET_CLIENT-New- method:

* SET_CLIENT-New-: Creates a new SET_CLIENT object.

#####  4.2) Add or Remove CLIENT(s) from SET_CLIENT

CLIENTs can be added and removed using the [SET_CLIENT:AddClientsByName()](#set_client-addclientsbyname-addclientnames) and [SET_CLIENT:RemoveClientsByName()](#set_client-removeclientsbyname-removeclientnames) respectively.
These methods take a single CLIENT name or an array of CLIENT names to be added or removed from SET_CLIENT.

#####  4.3) SET_CLIENT filter criteria

You can set filter criteria to define the set of clients within the SET_CLIENT.
Filter criteria are defined by:

* [SET_CLIENT:FilterCoalitions()](#set_client-filtercoalitions-coalitions): Builds the SET_CLIENT with the clients belonging to the coalition(s).
* [SET_CLIENT:FilterCategories()](#set_client-filtercategories-categories): Builds the SET_CLIENT with the clients belonging to the category(ies).
* [SET_CLIENT:FilterTypes()](#set_client-filtertypes-types): Builds the SET_CLIENT with the clients belonging to the client type(s).
* [SET_CLIENT:FilterCountries()](#set_client-filtercountries-countries): Builds the SET_CLIENT with the clients belonging to the country(ies).
* [SET_CLIENT:FilterPrefixes()](#set_client-filterprefixes-prefixes): Builds the SET_CLIENT with the clients starting with the same prefix string(s).

Once the filter criteria have been set for the SET_CLIENT, you can start filtering using:

* SET_CLIENT-FilterStart-: Starts the filtering of the clients within the SET_CLIENT.

Planned filter criteria within development are (so these are not yet available):

* SET_CLIENT-FilterZones-: Builds the SET_CLIENT with the clients within a [ZONE](#zone-class-).

#####  4.4) SET_CLIENT iterators

Once the filters have been defined and the SET_CLIENT has been built, you can iterate the SET_CLIENT with the available iterator methods.
The iterator methods will walk the SET_CLIENT set, and call for each element within the set a function that you provide.
The following iterator methods are currently available within the SET_CLIENT:

* [SET_CLIENT:ForEachClient()](#set_client-foreachclient-iteratorfunction): Calls a function for each alive client it finds within the SET_CLIENT.





### SET_CLIENT:New()
``` lua
-- Define a new SET_CLIENT Object. This DBObject will contain a reference to all Clients.
DBObject = SET_CLIENT:New()
```

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:AddClientsByName(AddClientNames)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-) self
* <u>String</u> AddClientNames : A single name or an array of CLIENT names.

<h4> Returns </h4>
* self 


### SET_CLIENT:RemoveClientsByName(RemoveClientNames)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-) self
* [CLIENT](#client-class-) RemoveClientNames : A single name or an array of CLIENT names.

<h4> Returns </h4>
* self 


### SET_CLIENT:FindClient(ClientName)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> ClientName

<h4> Returns </h4>
* [CLIENT](#client-class-)  The found Client.


### SET_CLIENT:FilterCoalitions(Coalitions)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterCategories(Categories)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Categories : Can take the following values: "plane", "helicopter", "ground", "ship".

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterTypes(Types)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Types : Can take those type strings known within DCS world.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterCountries(Countries)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterPrefixes(Prefixes)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Prefixes : The prefix of which the client name starts with.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterStart()

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:AddInDatabase(Event)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CLIENT
* <u>List[]</u>  The CLIENT


### SET_CLIENT:FindInDatabase(Event)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CLIENT
* <u>List[]</u>  The CLIENT


### SET_CLIENT:ForEachClient(IteratorFunction)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CLIENT in the SET_CLIENT. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:ForEachClientInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CLIENT in the SET_CLIENT. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:ForEachClientNotInZone(ZoneObject, IteratorFunction)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CLIENT in the SET_CLIENT. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:IsIncludeObject(MClient)

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [CLIENT](#client-class-) MClient

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



## SET_AIRBASE Class
<pre>
Inheritance : The SET_AIRBASE Class inherits from the following parents :
BASE
	`-- SET_BASE
		`-- SET_AIRBASE
</pre>

Mission designers can use the [SET_AIRBASE](#set_airbase-class-) class to build sets of airbases optionally belonging to certain:

* Coalitions

#####  5.1) SET_AIRBASE constructor

Create a new SET_AIRBASE object with the SET_AIRBASE-New- method:

* SET_AIRBASE-New-: Creates a new SET_AIRBASE object.

#####  5.2) Add or Remove AIRBASEs from SET_AIRBASE

AIRBASEs can be added and removed using the [SET_AIRBASE:AddAirbasesByName()](#set_airbase-addairbasesbyname-addairbasenames) and [SET_AIRBASE:RemoveAirbasesByName()](#set_airbase-removeairbasesbyname-removeairbasenames) respectively.
These methods take a single AIRBASE name or an array of AIRBASE names to be added or removed from SET_AIRBASE.

#####  5.3) SET_AIRBASE filter criteria

You can set filter criteria to define the set of clients within the SET_AIRBASE.
Filter criteria are defined by:

* [SET_AIRBASE:FilterCoalitions()](#set_airbase-filtercoalitions-coalitions): Builds the SET_AIRBASE with the airbases belonging to the coalition(s).

Once the filter criteria have been set for the SET_AIRBASE, you can start filtering using:

* SET_AIRBASE-FilterStart-: Starts the filtering of the airbases within the SET_AIRBASE.

#####  5.4) SET_AIRBASE iterators

Once the filters have been defined and the SET_AIRBASE has been built, you can iterate the SET_AIRBASE with the available iterator methods.
The iterator methods will walk the SET_AIRBASE set, and call for each airbase within the set a function that you provide.
The following iterator methods are currently available within the SET_AIRBASE:

* [SET_AIRBASE:ForEachAirbase()](#set_airbase-foreachairbase-iteratorfunction): Calls a function for each airbase it finds within the SET_AIRBASE.





### SET_AIRBASE:New()
``` lua
-- Define a new SET_AIRBASE Object. The DatabaseSet will contain a reference to all Airbases.
DatabaseSet = SET_AIRBASE:New()
```

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:AddAirbasesByName(AddAirbaseNames)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-) self
* <u>String</u> AddAirbaseNames : A single name or an array of AIRBASE names.

<h4> Returns </h4>
* self 


### SET_AIRBASE:RemoveAirbasesByName(RemoveAirbaseNames)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-) self
* [AIRBASE](#airbase-class-) RemoveAirbaseNames : A single name or an array of AIRBASE names.

<h4> Returns </h4>
* self 


### SET_AIRBASE:FindAirbase(AirbaseName)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>String</u> AirbaseName

<h4> Returns </h4>
* [AIRBASE](#airbase-class-)  The found Airbase.


### SET_AIRBASE:FilterCoalitions(Coalitions)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:FilterCategories(Categories)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>String</u> Categories : Can take the following values: "airdrome", "helipad", "ship".

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:FilterStart()

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:AddInDatabase(Event)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the AIRBASE
* <u>List[]</u>  The AIRBASE


### SET_AIRBASE:FindInDatabase(Event)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the AIRBASE
* <u>List[]</u>  The AIRBASE


### SET_AIRBASE:ForEachAirbase(IteratorFunction)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive AIRBASE in the SET_AIRBASE. The function needs to accept a AIRBASE parameter.

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:FindNearestAirbaseFromPointVec2(PointVec2)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest [AIRBASE](#airbase-class-).

<h4> Returns </h4>
* [AIRBASE](#airbase-class-)  The closest [AIRBASE](#airbase-class-).


### SET_AIRBASE:IsIncludeObject(MAirbase)

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* [AIRBASE](#airbase-class-) MAirbase

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



## SET_CARGO Class
<pre>
Inheritance : The SET_CARGO Class inherits from the following parents :
BASE
	`-- SET_BASE
		`-- SET_CARGO
</pre>

Mission designers can use the [SET_CARGO](#set_cargo-class-) class to build sets of cargos optionally belonging to certain:

* Coalitions
* Types
* Name or Prefix

#####  SET_CARGO constructor

Create a new SET_CARGO object with the SET_CARGO-New- method:

* SET_CARGO-New-: Creates a new SET_CARGO object.

#####  Add or Remove CARGOs from SET_CARGO

CARGOs can be added and removed using the [SET_CARGO:AddCargosByName()](#set_cargo-addcargosbyname-addcargonames) and [SET_CARGO:RemoveCargosByName()](#set_cargo-removecargosbyname-removecargonames) respectively.
These methods take a single CARGO name or an array of CARGO names to be added or removed from SET_CARGO.

#####  SET_CARGO filter criteria

You can set filter criteria to automatically maintain the SET_CARGO contents.
Filter criteria are defined by:

* [SET_CARGO:FilterCoalitions()](#set_cargo-filtercoalitions-coalitions): Builds the SET_CARGO with the cargos belonging to the coalition(s).
* [SET_CARGO:FilterPrefixes()](#set_cargo-filterprefixes-prefixes): Builds the SET_CARGO with the cargos containing the prefix string(s).
* [SET_CARGO:FilterTypes()](#set_cargo-filtertypes-types): Builds the SET_CARGO with the cargos belonging to the cargo type(s).
* [SET_CARGO:FilterCountries()](#set_cargo-filtercountries-countries): Builds the SET_CARGO with the cargos belonging to the country(ies).

Once the filter criteria have been set for the SET_CARGO, you can start filtering using:

* SET_CARGO-FilterStart-: Starts the filtering of the cargos within the SET_CARGO.

#####  SET_CARGO iterators

Once the filters have been defined and the SET_CARGO has been built, you can iterate the SET_CARGO with the available iterator methods.
The iterator methods will walk the SET_CARGO set, and call for each cargo within the set a function that you provide.
The following iterator methods are currently available within the SET_CARGO:

* [SET_CARGO:ForEachCargo()](#set_cargo-foreachcargo-iteratorfunction): Calls a function for each cargo it finds within the SET_CARGO.





### SET_CARGO:New()
``` lua
-- Define a new SET_CARGO Object. The DatabaseSet will contain a reference to all Cargos.
DatabaseSet = SET_CARGO:New()
```

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:AddCargosByName(AddCargoNames)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-) self
* <u>String</u> AddCargoNames : A single name or an array of CARGO names.

<h4> Returns </h4>
* self 


### SET_CARGO:RemoveCargosByName(RemoveCargoNames)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-) self
* [CARGO](#cargo-class-) RemoveCargoNames : A single name or an array of CARGO names.

<h4> Returns </h4>
* self 


### SET_CARGO:FindCargo(CargoName)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> CargoName

<h4> Returns </h4>
* [CARGO](#cargo-class-)  The found Cargo.


### SET_CARGO:FilterCoalitions(Coalitions)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterTypes(Types)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Types : Can take those type strings known within DCS world.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterCountries(Countries)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterPrefixes(Prefixes)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Prefixes : The prefix of which the cargo name starts with.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterStart()

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:AddInDatabase(Event)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CARGO
* <u>List[]</u>  The CARGO


### SET_CARGO:FindInDatabase(Event)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CARGO
* <u>List[]</u>  The CARGO


### SET_CARGO:ForEachCargo(IteratorFunction)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CARGO in the SET_CARGO. The function needs to accept a CARGO parameter.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FindNearestCargoFromPointVec2(PointVec2)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest [CARGO](#cargo-class-).

<h4> Returns </h4>
* [CARGO](#cargo-class-)  The closest [CARGO](#cargo-class-).


### SET_CARGO:IsIncludeObject(MCargo)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [AI_CARGO](#ai_cargo-class-) MCargo

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:OnEventNewCargo(EventData)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### SET_CARGO:OnEventDeleteCargo(EventData)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

