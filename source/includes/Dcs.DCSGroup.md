# Dcs.DCSGroup Module


## Group Class
<pre>
Inheritance : The Group Class inherits from the following parents :
ERROR !
	`-- Group
</pre>

<h4> Attributes </h4>

* [ID](#id-class-)
ID : Identifier of a group. It is assigned to a group by Mission Editor automatically.
* #Group.Category Category : Enum contains identifiers of group types.


### getByName()
Returns group by the name assigned to the group in Mission Editor.
@function [parent=#Group] getByName

<h4> Parameters </h4>
* <u>String</u> name

<h4> Returns </h4>
* #Group 


### Group:isExist()
returns true if the group exist or false otherwise.
@function [parent=#Group] isExist

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* <u>Boolean</u> 


### Group:destroy()
Destroys the group and all of its units.
@function [parent=#Group] destroy

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>

### Group:getCategory()
Returns category of the group.
@function [parent=#Group] getCategory

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* #Group.Category 


### Group:getCoalition()
Returns the coalition of the group.
@function [parent=#Group] getCoalition

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* Dcs.DCSCoalitionWrapper.Object#coalition.side 


### Group:getName()
Returns the group's name. This is the same name assigned to the group in Mission Editor.
@function [parent=#Group] getName

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* <u>String</u> 


### Group:getID()
Returns the group identifier.
@function [parent=#Group] getID

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* [ID](#id-class-)



### Group:getUnit(unitNumber)
Returns the unit with number unitNumber. If the unit is not exists the function will return nil.
@function [parent=#Group] getUnit

<h4> Parameters </h4>
* #Group self
* <u>Number</u> unitNumber

<h4> Returns </h4>
* Dcs.DCSWrapper.Unit#Unit 


### Group:getSize()
Returns current size of the group. If some of the units will be destroyed, As units are destroyed the size of the group will be changed.
@function [parent=#Group] getSize

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* <u>Number</u> 


### Group:getInitialSize()
Returns initial size of the group. If some of the units will be destroyed, initial size of the group will not be changed. Initial size limits the unitNumber parameter for Group.getUnit() function.
@function [parent=#Group] getInitialSize

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* <u>Number</u> 


### Group:getUnits()
Returns array of the units present in the group now. Destroyed units will not be enlisted at all.
@function [parent=#Group] getUnits

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* #list<Dcs.DCSWrapper.Unit#Unit>  array of Units


### Group:getController()
Returns controller of the group.
@function [parent=#Group] getController

<h4> Parameters </h4>
* #Group self

<h4> Returns </h4>
* [Controller](#controller-class-) 


## Group.Category Class
<pre>
The Group.Category class does not inherit
</pre>

<h4> Attributes </h4>

* AIRPLANE self
* HELICOPTER self
* GROUND self
* SHIP self


