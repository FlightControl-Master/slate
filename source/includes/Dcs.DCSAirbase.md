# Dcs.DCSAirbase Module


## Airbase Class
<pre>
Inheritance : The Airbase Class inherits from the following parents :
ERROR !
	`-- Airbase
</pre>

<h4> Attributes </h4>

* #Airbase.ID ID : Identifier of an airbase. It assigned to an airbase by the Mission Editor automatically. This identifier is used in AI tasks to refer an airbase that exists (spawned and not dead) or not.
* #Airbase.Category Category : enum contains identifiers of airbase categories.
* #Airbase.Desc Desc : Airbase descriptor. Airdromes are unique and their types are unique, but helipads and ships are not always unique and may have the same type.


### getByName()
Returns airbase by its name. If no airbase found the function will return nil.

<h4> Parameters </h4>
* <u>String</u> name

<h4> Returns </h4>
* #Airbase self


### getDescByName()
Returns airbase descriptor by type name. If no descriptor is found the function will return nil.

<h4> Parameters </h4>
* #TypeName typeName : Airbase type name.

<h4> Returns </h4>
* #Airbase.Desc self


### Airbase:getUnit()
Returns Unit that is corresponded to the airbase. Works only for ships.

<h4> Parameters </h4>
* self self

<h4> Returns </h4>
* [Unit](#unit-class) self


### Airbase:getID()
Returns identifier of the airbase.

<h4> Parameters </h4>
* self self

<h4> Returns </h4>
* #Airbase.ID self


### Airbase:getCallsign()
Returns the airbase's callsign - the localized string.

<h4> Parameters </h4>
* self self

<h4> Returns </h4>
* <u>String</u> self


### Airbase:getDesc()
Returns descriptor of the airbase.

<h4> Parameters </h4>
* self self

<h4> Returns </h4>
* #Airbase.Desc self


## Airbase.Category Class
<pre>
The Airbase.Category class does not inherit
</pre>

<h4> Attributes </h4>

* AIRDROME self
* HELIPAD self
* SHIP self


## Airbase.Desc Class
<pre>
Inheritance : The Airbase.Desc Class inherits from the following parents :
Desc
	`-- Airbase.Desc
</pre>

<h4> Attributes </h4>

* #Airbase.Category category : Category of the airbase type.


