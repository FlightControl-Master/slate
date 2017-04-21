# Wrapper.Identifiable Module
This module contains the IDENTIFIABLE class.

##### 1) [IDENTIFIABLE](#identifiable-class-) class, extends [OBJECT](#object-class-)

The [IDENTIFIABLE](#identifiable-class-) class is a wrapper class to handle the DCS Identifiable objects:

* Support all DCS Identifiable APIs.
* Enhance with Identifiable specific APIs not in the DCS Identifiable API set.
* Manage the "state" of the DCS Identifiable.

##### 1.1) IDENTIFIABLE constructor:

The IDENTIFIABLE class provides the following functions to construct a IDENTIFIABLE instance:

* [IDENTIFIABLE:New()](#identifiable-new-identifiablename): Create a IDENTIFIABLE instance.

##### 1.2) IDENTIFIABLE methods:

The following methods can be used to identify an identifiable object:

* IDENTIFIABLE-GetName-: Returns the name of the Identifiable.
* IDENTIFIABLE-IsAlive-: Returns if the Identifiable is alive.
* IDENTIFIABLE-GetTypeName-: Returns the type name of the Identifiable.
* IDENTIFIABLE-GetCoalition-: Returns the coalition of the Identifiable.
* IDENTIFIABLE-GetCountry-: Returns the country of the Identifiable.
* IDENTIFIABLE-GetDesc-: Returns the descriptor structure of the Identifiable.




## IDENTIFIABLE Class
<pre>
Inheritance : The IDENTIFIABLE Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
</pre>

<h4> Attributes </h4>

* <u>String</u> IdentifiableName : The name of the identifiable.


### IDENTIFIABLE:New(IdentifiableName)
Create a new IDENTIFIABLE from a DCSIdentifiable

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self
* Dcs.DCSWrapper.Identifiable#Identifiable IdentifiableName : The DCS Identifiable name

<h4> Returns </h4>
* [IDENTIFIABLE](#identifiable-class-)



### IDENTIFIABLE:IsAlive()
Returns if the Identifiable is alive.
If the Identifiable is not alive, nil is returned.
If the Identifiable is alive, true is returned.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* <u>Boolean</u>  true if Identifiable is alive.
* <u>Nil</u>  if the Identifiable is not existing or is not alive.


### IDENTIFIABLE:GetName()
Returns DCS Identifiable object name.
The function provides access to non-activated objects too.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* <u>String</u>  The name of the DCS Identifiable.
* <u>Nil</u>  The DCS Identifiable is not existing or alive.


### IDENTIFIABLE:GetTypeName()
Returns the type name of the DCS Identifiable.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* <u>String</u>  The type name of the DCS Identifiable.
* <u>Nil</u>  The DCS Identifiable is not existing or alive.


### IDENTIFIABLE:GetCategory()
Returns category of the DCS Identifiable.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Object#Object.Category  The category ID


### IDENTIFIABLE:GetCategoryName()
Returns the DCS Identifiable category name as defined within the DCS Identifiable Descriptor.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* <u>String</u>  The DCS Identifiable Category Name


### IDENTIFIABLE:GetCoalition()
Returns coalition of the Identifiable.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* Dcs.DCSCoalitionWrapper.Object#coalition.side  The side of the coalition.
* <u>Nil</u>  The DCS Identifiable is not existing or alive.


### IDENTIFIABLE:GetCountry()
Returns country of the Identifiable.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* [country.id](#country.id-class-)  The country identifier.
* <u>Nil</u>  The DCS Identifiable is not existing or alive.


### IDENTIFIABLE:GetDesc()
Returns Identifiable descriptor. Descriptor type depends on Identifiable category.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* Dcs.DCSWrapper.Identifiable#Identifiable.Desc  The Identifiable descriptor.
* <u>Nil</u>  The DCS Identifiable is not existing or alive.


### IDENTIFIABLE:GetCallsign()
Gets the CallSign of the IDENTIFIABLE, which is a blank by default.

<h4> Parameters </h4>
* [IDENTIFIABLE](#identifiable-class-)
self

<h4> Returns </h4>
* <u>String</u>  The CallSign of the IDENTIFIABLE.


