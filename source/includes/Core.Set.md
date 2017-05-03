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
Creates a new SET_BASE object, building a set of units belonging to a coalitions, categories, countries, types or with defined prefix names.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:GetSet()
Gets the Set.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:Add(ObjectName, Object)
Adds a [BASE](#base-class-) object in the [SET_BASE](#set_base-class-), using a given ObjectName as the index.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>String</u> ObjectName
* [BASE](#base-class-) Object

<h4> Returns </h4>
* [BASE](#base-class-)  The added BASE Object.


### SET_BASE:AddObject(Object)
Adds a [BASE](#base-class-) object in the [SET_BASE](#set_base-class-), using the Object Name as the index.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* [OBJECT](#object-class-) Object

<h4> Returns </h4>
* [BASE](#base-class-)  The added BASE Object.


### SET_BASE:Remove(ObjectName)
Removes a [BASE](#base-class-) object from the [SET_BASE](#set_base-class-) and derived classes, based on the Object Name.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>String</u> ObjectName

<h4> Returns </h4>

### SET_BASE:Get(ObjectName)
Gets a [BASE](#base-class-) object from the [SET_BASE](#set_base-class-) and derived classes, based on the Object Name.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>String</u> ObjectName

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:GetFirst()
Gets the first object from the [SET_BASE](#set_base-class-) and derived classes.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:GetLast()
Gets the last object from the [SET_BASE](#set_base-class-) and derived classes.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:GetRandom()
Gets a random object from the [SET_BASE](#set_base-class-) and derived classes.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [BASE](#base-class-) 


### SET_BASE:Count()
Retrieves the amount of objects in the [SET_BASE](#set_base-class-) and derived classes.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* <u>Number</u> 


### SET_BASE:SetDatabase(BaseSet)
Copies the Filter criteria from a given Set (for rebuilding a new Set based on an existing Set).

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* [SET_BASE](#set_base-class-)
BaseSet

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:SetIteratorIntervals(YieldInterval, TimeInterval)
Define the SET iterator **"yield interval"** and the **"time interval"**.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>Number</u> YieldInterval : Sets the frequency when the iterator loop will yield after the number of objects processed. The default frequency is 10 objects processed.
* <u>Number</u> TimeInterval : Sets the time in seconds when the main logic will resume the iterator loop. The default time is 0.001 seconds.

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:FilterOnce()
Filters for the defined collection.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:FilterStop()
Stops the filtering for the defined collection.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:FindNearestObjectFromPointVec2(PointVec2)
Iterate the SET_BASE while identifying the nearest object from a @{Point#POINT_VEC2}.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest object in the set.

<h4> Returns </h4>
* [BASE](#base-class-)  The closest object.


### SET_BASE:ForEach(IteratorFunction)
Iterate the SET_BASE and derived classes and call an iterator function for the given SET_BASE, providing the Object for each element within the set and optional parameters.

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called.

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:IsIncludeObject(Object)
Decides whether to include the Object

<h4> Parameters </h4>
* [SET_BASE](#set_base-class-)
self
* <u>List[]</u> Object

<h4> Returns </h4>
* [SET_BASE](#set_base-class-)



### SET_BASE:Flush()
Flushes the current SET_BASE contents in the log ... (for debugging reasons).

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
Creates a new SET_GROUP object, building a set of groups belonging to a coalitions, categories, countries, types or with defined prefix names.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:AddGroupsByName(AddGroupNames)
Add GROUP(s) to SET_GROUP.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-) self
* <u>String</u> AddGroupNames : A single name or an array of GROUP names.

<h4> Returns </h4>
* self 


### SET_GROUP:RemoveGroupsByName(RemoveGroupNames)
Remove GROUP(s) from SET_GROUP.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-) self
* [GROUP](#group-class-) RemoveGroupNames : A single name or an array of GROUP names.

<h4> Returns </h4>
* self 


### SET_GROUP:FindGroup(GroupName)
Finds a Group based on the Group Name.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> GroupName

<h4> Returns </h4>
* [GROUP](#group-class-)  The found Group.


### SET_GROUP:FindNearestGroupFromPointVec2(PointVec2)
Iterate the SET_GROUP while identifying the nearest object from a @{Point#POINT_VEC2}.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest object in the set.

<h4> Returns </h4>
* [GROUP](#group-class-)  The closest group.


### SET_GROUP:FilterCoalitions(Coalitions)
Builds a set of groups of coalitions.
Possible current coalitions are red, blue and neutral.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterCategories(Categories)
Builds a set of groups out of categories.
Possible current categories are plane, helicopter, ground, ship.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Categories : Can take the following values: "plane", "helicopter", "ground", "ship".

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterCountries(Countries)
Builds a set of groups of defined countries.
Possible current countries are those known within DCS world.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterPrefixes(Prefixes)
Builds a set of groups of defined GROUP prefixes.
All the groups starting with the given prefixes will be included within the set.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>String</u> Prefixes : The prefix of which the group name starts with.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:FilterStart()
Starts the filtering.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:AddInDatabase(Event)
Handles the Database to check on an event (birth) that the Object was added in the Database.
This is required, because sometimes the _DATABASE birth event gets called later than the SET_BASE birth event!

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the GROUP
* <u>List[]</u>  The GROUP


### SET_GROUP:FindInDatabase(Event)
Handles the Database to check on any event that Object exists in the Database.
This is required, because sometimes the _DATABASE event gets called later than the SET_BASE event or vise versa!

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the GROUP
* <u>List[]</u>  The GROUP


### SET_GROUP:ForEachGroup(IteratorFunction)
Iterate the SET_GROUP and call an iterator function for each **alive** GROUP, providing the GROUP and optional parameters.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:ForEachGroupCompletelyInZone(ZoneObject, IteratorFunction)
Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence completely in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:ForEachGroupPartlyInZone(ZoneObject, IteratorFunction)
Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence partly in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:ForEachGroupNotInZone(ZoneObject, IteratorFunction)
Iterate the SET_GROUP and call an iterator function for each **alive** GROUP presence not in a [Zone](#zone-module-), providing the GROUP and optional parameters to the called function.

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive GROUP in the SET_GROUP. The function needs to accept a GROUP parameter.

<h4> Returns </h4>
* [SET_GROUP](#set_group-class-)



### SET_GROUP:AllCompletelyInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

if MySetGroup:AllCompletelyInZone(MyZone) then
MESSAGE:New("All the SET's GROUP are in zone !", 10):ToAll()
else
MESSAGE:New("Some or all SET's GROUP are outside zone !", 10):ToAll()
end
```
Iterate the SET_GROUP and return true if all the [GROUP](#group-class-) are completely in the [ZONE](#zone-class-)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Boolean</u>  true if all the [GROUP](#group-class-) are completly in the [ZONE](#zone-class-), false otherwise


### SET_GROUP:AnyCompletelyInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

if MySetGroup:AnyCompletelyInZone(MyZone) then
MESSAGE:New("At least one GROUP is completely in zone !", 10):ToAll()
else
MESSAGE:New("No GROUP is completely in zone !", 10):ToAll()
end
```
Iterate the SET_GROUP and return true if at least one of the [GROUP](#group-class-) is completely inside the [ZONE](#zone-class-)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Boolean</u>  true if at least one of the [GROUP](#group-class-) is completly inside the [ZONE](#zone-class-), false otherwise.


### SET_GROUP:AnyInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

if MySetGroup:AnyPartlyInZone(MyZone) then
MESSAGE:New("At least one GROUP has at least one UNIT in zone !", 10):ToAll()
else
MESSAGE:New("No UNIT of any GROUP is in zone !", 10):ToAll()
end
```
Iterate the SET_GROUP and return true if at least one [UNIT](#unit-class-) of one [GROUP](#group-module-) of the [SET_GROUP](#set_group-module-) is in [ZONE](#zone-module-)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Boolean</u>  true if at least one of the [GROUP](#group-class-) is partly or completly inside the [ZONE](#zone-class-), false otherwise.


### SET_GROUP:AnyPartlyInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

if MySetGroup:AnyPartlyInZone(MyZone) then
MESSAGE:New("At least one GROUP is partially in the zone, but none are fully in it !", 10):ToAll()
else
MESSAGE:New("No GROUP are in zone, or one (or more) GROUP is completely in it !", 10):ToAll()
end
```
Iterate the SET_GROUP and return true if at least one [GROUP](#group-module-) of the [SET_GROUP](#set_group-module-) is partly in [ZONE](#zone-module-).
Will return false if a [GROUP](#group-module-) is fully in the [ZONE](#zone-module-)

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Boolean</u>  true if at least one of the [GROUP](#group-class-) is partly or completly inside the [ZONE](#zone-class-), false otherwise.


### SET_GROUP:NoneInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

if MySetGroup:NoneInZone(MyZone) then
MESSAGE:New("No GROUP is completely in zone !", 10):ToAll()
else
MESSAGE:New("No UNIT of any GROUP is in zone !", 10):ToAll()
end
```
Iterate the SET_GROUP and return true if no [GROUP](#group-module-) of the [SET_GROUP](#set_group-module-) is in [ZONE](#zone-module-)
This could also be achieved with `not SET_GROUP:AnyPartlyInZone(Zone)`, but it's easier for the
mission designer to add a dedicated method

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Boolean</u>  true if no [GROUP](#group-class-) is inside the [ZONE](#zone-class-) in any way, false otherwise.


### SET_GROUP:CountInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

MESSAGE:New("There are " .. MySetGroup:CountInZone(MyZone) .. " GROUPs in the Zone !", 10):ToAll()
```
Iterate the SET_GROUP and count how many GROUPs are completely in the Zone
That could easily be done with SET_GROUP:ForEachGroupCompletelyInZone(), but this function
provides an easy to use shortcut...

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Number</u>  the number of GROUPs completely in the Zone


### SET_GROUP:CountUnitInZone(ZoneObject)
``` lua
local MyZone = ZONE:New("Zone1")
local MySetGroup = SET_GROUP:New()
MySetGroup:AddGroupsByName({"Group1", "Group2"})

MESSAGE:New("There are " .. MySetGroup:CountUnitInZone(MyZone) .. " UNITs in the Zone !", 10):ToAll()
```
Iterate the SET_GROUP and count how many UNITs are completely in the Zone

<h4> Parameters </h4>
* [SET_GROUP](#set_group-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.

<h4> Returns </h4>
* <u>Number</u>  the number of GROUPs completely in the Zone


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
Creates a new SET_UNIT object, building a set of units belonging to a coalitions, categories, countries, types or with defined prefix names.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:AddUnit(AddUnit)
Add UNIT(s) to SET_UNIT.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> AddUnit : A single UNIT.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:AddUnitsByName(AddUnitNames)
Add UNIT(s) to SET_UNIT.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> AddUnitNames : A single name or an array of UNIT names.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:RemoveUnitsByName(RemoveUnitNames)
Remove UNIT(s) from SET_UNIT.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-) self
* [UNIT](#unit-class-) RemoveUnitNames : A single name or an array of UNIT names.

<h4> Returns </h4>
* self 


### SET_UNIT:FindUnit(UnitName)
Finds a Unit based on the Unit Name.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> UnitName

<h4> Returns </h4>
* [UNIT](#unit-class-)  The found Unit.


### SET_UNIT:FilterCoalitions(Coalitions)
Builds a set of units of coalitions.
Possible current coalitions are red, blue and neutral.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterCategories(Categories)
Builds a set of units out of categories.
Possible current categories are plane, helicopter, ground, ship.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Categories : Can take the following values: "plane", "helicopter", "ground", "ship".

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterTypes(Types)
Builds a set of units of defined unit types.
Possible current types are those types known within DCS world.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Types : Can take those type strings known within DCS world.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterCountries(Countries)
Builds a set of units of defined countries.
Possible current countries are those known within DCS world.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterPrefixes(Prefixes)
Builds a set of units of defined unit prefixes.
All the units starting with the given prefixes will be included within the set.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>String</u> Prefixes : The prefix of which the unit name starts with.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterHasRadar(RadarTypes)
Builds a set of units having a radar of give types.
All the units having a radar of a given type will be included within the set.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>List[]</u> RadarTypes : The radar types.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterHasSEAD()
Builds a set of SEADable units.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:FilterStart()
Starts the filtering.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:AddInDatabase(Event)
Handles the Database to check on an event (birth) that the Object was added in the Database.
This is required, because sometimes the _DATABASE birth event gets called later than the SET_BASE birth event!

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the UNIT
* <u>List[]</u>  The UNIT


### SET_UNIT:FindInDatabase(Event)
Handles the Database to check on any event that Object exists in the Database.
This is required, because sometimes the _DATABASE event gets called later than the SET_BASE event or vise versa!

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the UNIT
* <u>List[]</u>  The UNIT


### SET_UNIT:ForEachUnit(IteratorFunction)
Iterate the SET_UNIT and call an interator function for each **alive** UNIT, providing the UNIT and optional parameters.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive UNIT in the SET_UNIT. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:ForEachUnitCompletelyInZone(ZoneObject, IteratorFunction)
Iterate the SET_UNIT and call an iterator function for each **alive** UNIT presence completely in a [Zone](#zone-module-), providing the UNIT and optional parameters to the called function.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive UNIT in the SET_UNIT. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:ForEachUnitNotInZone(ZoneObject, IteratorFunction)
Iterate the SET_UNIT and call an iterator function for each **alive** UNIT presence not in a [Zone](#zone-module-), providing the UNIT and optional parameters to the called function.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive UNIT in the SET_UNIT. The function needs to accept a UNIT parameter.

<h4> Returns </h4>
* [SET_UNIT](#set_unit-class-)



### SET_UNIT:GetUnitTypes()
Returns map of unit types.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* #map<<u>String</u>,<u>Number</u>>  A map of the unit types found. The key is the UnitTypeName and the value is the amount of unit types found.


### SET_UNIT:GetUnitTypesText()
Returns a comma separated string of the unit types with a count in the  [Set](#set-module-).

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>String</u>  The unit types string


### SET_UNIT:GetUnitThreatLevels()
Returns map of unit threat levels.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>List[]</u>. 


### SET_UNIT:CalculateThreatLevelA2G()
Calculate the maxium A2G threat level of the SET_UNIT.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>

### SET_UNIT:HasRadar(RadarType)
Returns if the [Set](#set-module-) has targets having a radar (of a given type).

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self
* Dcs.DCSWrapper.Unit#Unit.RadarType RadarType

<h4> Returns </h4>
* <u>Number</u>  The amount of radars in the Set with the given type


### SET_UNIT:HasSEAD()
Returns if the [Set](#set-module-) has targets that can be SEADed.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The amount of SEADable units in the Set


### SET_UNIT:HasGroundUnits()
Returns if the [Set](#set-module-) has ground targets.

<h4> Parameters </h4>
* [SET_UNIT](#set_unit-class-)
self

<h4> Returns </h4>
* <u>Number</u>  The amount of ground targets in the Set.


### SET_UNIT:HasFriendlyUnits()
Returns if the [Set](#set-module-) has friendly ground units.

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
Retrieve the type names of the [Unit](#unit-module-)s in the SET, delimited by an optional delimiter.

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
Creates a new SET_CLIENT object, building a set of clients belonging to a coalitions, categories, countries, types or with defined prefix names.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:AddClientsByName(AddClientNames)
Add CLIENT(s) to SET_CLIENT.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-) self
* <u>String</u> AddClientNames : A single name or an array of CLIENT names.

<h4> Returns </h4>
* self 


### SET_CLIENT:RemoveClientsByName(RemoveClientNames)
Remove CLIENT(s) from SET_CLIENT.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-) self
* [CLIENT](#client-class-) RemoveClientNames : A single name or an array of CLIENT names.

<h4> Returns </h4>
* self 


### SET_CLIENT:FindClient(ClientName)
Finds a Client based on the Client Name.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> ClientName

<h4> Returns </h4>
* [CLIENT](#client-class-)  The found Client.


### SET_CLIENT:FilterCoalitions(Coalitions)
Builds a set of clients of coalitions.
Possible current coalitions are red, blue and neutral.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterCategories(Categories)
Builds a set of clients out of categories.
Possible current categories are plane, helicopter, ground, ship.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Categories : Can take the following values: "plane", "helicopter", "ground", "ship".

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterTypes(Types)
Builds a set of clients of defined client types.
Possible current types are those types known within DCS world.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Types : Can take those type strings known within DCS world.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterCountries(Countries)
Builds a set of clients of defined countries.
Possible current countries are those known within DCS world.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterPrefixes(Prefixes)
Builds a set of clients of defined client prefixes.
All the clients starting with the given prefixes will be included within the set.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>String</u> Prefixes : The prefix of which the client name starts with.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:FilterStart()
Starts the filtering.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:AddInDatabase(Event)
Handles the Database to check on an event (birth) that the Object was added in the Database.
This is required, because sometimes the _DATABASE birth event gets called later than the SET_BASE birth event!

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CLIENT
* <u>List[]</u>  The CLIENT


### SET_CLIENT:FindInDatabase(Event)
Handles the Database to check on any event that Object exists in the Database.
This is required, because sometimes the _DATABASE event gets called later than the SET_BASE event or vise versa!

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CLIENT
* <u>List[]</u>  The CLIENT


### SET_CLIENT:ForEachClient(IteratorFunction)
Iterate the SET_CLIENT and call an interator function for each **alive** CLIENT, providing the CLIENT and optional parameters.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CLIENT in the SET_CLIENT. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:ForEachClientInZone(ZoneObject, IteratorFunction)
Iterate the SET_CLIENT and call an iterator function for each **alive** CLIENT presence completely in a [Zone](#zone-module-), providing the CLIENT and optional parameters to the called function.

<h4> Parameters </h4>
* [SET_CLIENT](#set_client-class-)
self
* [ZONE](#zone-class-) ZoneObject : The Zone to be tested for.
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CLIENT in the SET_CLIENT. The function needs to accept a CLIENT parameter.

<h4> Returns </h4>
* [SET_CLIENT](#set_client-class-)



### SET_CLIENT:ForEachClientNotInZone(ZoneObject, IteratorFunction)
Iterate the SET_CLIENT and call an iterator function for each **alive** CLIENT presence not in a [Zone](#zone-module-), providing the CLIENT and optional parameters to the called function.

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
Creates a new SET_AIRBASE object, building a set of airbases belonging to a coalitions and categories.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:AddAirbasesByName(AddAirbaseNames)
Add AIRBASEs to SET_AIRBASE.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-) self
* <u>String</u> AddAirbaseNames : A single name or an array of AIRBASE names.

<h4> Returns </h4>
* self 


### SET_AIRBASE:RemoveAirbasesByName(RemoveAirbaseNames)
Remove AIRBASEs from SET_AIRBASE.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-) self
* [AIRBASE](#airbase-class-) RemoveAirbaseNames : A single name or an array of AIRBASE names.

<h4> Returns </h4>
* self 


### SET_AIRBASE:FindAirbase(AirbaseName)
Finds a Airbase based on the Airbase Name.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>String</u> AirbaseName

<h4> Returns </h4>
* [AIRBASE](#airbase-class-)  The found Airbase.


### SET_AIRBASE:FilterCoalitions(Coalitions)
Builds a set of airbases of coalitions.
Possible current coalitions are red, blue and neutral.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:FilterCategories(Categories)
Builds a set of airbases out of categories.
Possible current categories are plane, helicopter, ground, ship.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>String</u> Categories : Can take the following values: "airdrome", "helipad", "ship".

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:FilterStart()
Starts the filtering.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:AddInDatabase(Event)
Handles the Database to check on an event (birth) that the Object was added in the Database.
This is required, because sometimes the _DATABASE birth event gets called later than the SET_BASE birth event!

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the AIRBASE
* <u>List[]</u>  The AIRBASE


### SET_AIRBASE:FindInDatabase(Event)
Handles the Database to check on any event that Object exists in the Database.
This is required, because sometimes the _DATABASE event gets called later than the SET_BASE event or vise versa!

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the AIRBASE
* <u>List[]</u>  The AIRBASE


### SET_AIRBASE:ForEachAirbase(IteratorFunction)
Iterate the SET_AIRBASE and call an interator function for each AIRBASE, providing the AIRBASE and optional parameters.

<h4> Parameters </h4>
* [SET_AIRBASE](#set_airbase-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive AIRBASE in the SET_AIRBASE. The function needs to accept a AIRBASE parameter.

<h4> Returns </h4>
* [SET_AIRBASE](#set_airbase-class-)



### SET_AIRBASE:FindNearestAirbaseFromPointVec2(PointVec2)
Iterate the SET_AIRBASE while identifying the nearest [AIRBASE](#airbase-class-) from a @{Point#POINT_VEC2}.

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
(R2.1) Creates a new SET_CARGO object, building a set of cargos belonging to a coalitions and categories.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:AddCargosByName(AddCargoNames)
(R2.1) Add CARGOs to SET_CARGO.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-) self
* <u>String</u> AddCargoNames : A single name or an array of CARGO names.

<h4> Returns </h4>
* self 


### SET_CARGO:RemoveCargosByName(RemoveCargoNames)
(R2.1) Remove CARGOs from SET_CARGO.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-) self
* [CARGO](#cargo-class-) RemoveCargoNames : A single name or an array of CARGO names.

<h4> Returns </h4>
* self 


### SET_CARGO:FindCargo(CargoName)
(R2.1) Finds a Cargo based on the Cargo Name.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> CargoName

<h4> Returns </h4>
* [CARGO](#cargo-class-)  The found Cargo.


### SET_CARGO:FilterCoalitions(Coalitions)
(R2.1) Builds a set of cargos of coalitions.
Possible current coalitions are red, blue and neutral.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Coalitions : Can take the following values: "red", "blue", "neutral".

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterTypes(Types)
(R2.1) Builds a set of cargos of defined cargo types.
Possible current types are those types known within DCS world.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Types : Can take those type strings known within DCS world.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterCountries(Countries)
(R2.1) Builds a set of cargos of defined countries.
Possible current countries are those known within DCS world.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Countries : Can take those country strings known within DCS world.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterPrefixes(Prefixes)
(R2.1) Builds a set of cargos of defined cargo prefixes.
All the cargos starting with the given prefixes will be included within the set.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>String</u> Prefixes : The prefix of which the cargo name starts with.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FilterStart()
(R2.1) Starts the filtering.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:AddInDatabase(Event)
(R2.1) Handles the Database to check on an event (birth) that the Object was added in the Database.
This is required, because sometimes the _DATABASE birth event gets called later than the SET_BASE birth event!

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CARGO
* <u>List[]</u>  The CARGO


### SET_CARGO:FindInDatabase(Event)
(R2.1) Handles the Database to check on any event that Object exists in the Database.
This is required, because sometimes the _DATABASE event gets called later than the SET_BASE event or vise versa!

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) Event

<h4> Returns </h4>
* <u>String</u>  The name of the CARGO
* <u>List[]</u>  The CARGO


### SET_CARGO:ForEachCargo(IteratorFunction)
(R2.1) Iterate the SET_CARGO and call an interator function for each CARGO, providing the CARGO and optional parameters.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* <u>Function()</u> IteratorFunction : The function that will be called when there is an alive CARGO in the SET_CARGO. The function needs to accept a CARGO parameter.

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:FindNearestCargoFromPointVec2(PointVec2)
(R2.1) Iterate the SET_CARGO while identifying the nearest [CARGO](#cargo-class-) from a @{Point#POINT_VEC2}.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [POINT_VEC2](#point_vec2-class-) PointVec2 : A @{Point#POINT_VEC2} object from where to evaluate the closest [CARGO](#cargo-class-).

<h4> Returns </h4>
* [CARGO](#cargo-class-)  The closest [CARGO](#cargo-class-).


### SET_CARGO:IsIncludeObject(MCargo)
(R2.1)

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [AI_CARGO](#ai_cargo-class-) MCargo

<h4> Returns </h4>
* [SET_CARGO](#set_cargo-class-)



### SET_CARGO:OnEventNewCargo(EventData)
(R2.1) Handles the OnEventNewCargo event for the Set.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

### SET_CARGO:OnEventDeleteCargo(EventData)
(R2.1) Handles the OnDead or OnCrash event for alive units set.

<h4> Parameters </h4>
* [SET_CARGO](#set_cargo-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

