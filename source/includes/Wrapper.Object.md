# Wrapper.Object Module
This module contains the OBJECT class.

##### 1) [OBJECT](#object-class) class, extends [BASE](#base-class)

The [OBJECT](#object-class) class is a wrapper class to handle the DCS Object objects:

* Support all DCS Object APIs.
* Enhance with Object specific APIs not in the DCS Object API set.
* Manage the "state" of the DCS Object.

##### 1.1) OBJECT constructor:

The OBJECT class provides the following functions to construct a OBJECT instance:

* [OBJECT:New()](#object-new-objectname): Create a OBJECT instance.

##### 1.2) OBJECT methods:

The following methods can be used to identify an Object object:

* [OBJECT:GetID()](#object-getid): Returns the ID of the Object object.



## OBJECT Class
<pre>
Inheritance : The OBJECT Class inherits from the following parents :
BASE
	`-- OBJECT
</pre>

<h4> Attributes </h4>

* <u>String</u> ObjectName : The name of the Object.


### OBJECT:New(ObjectName)

<h4> Parameters </h4>
* [OBJECT](#object-class)
self
* Dcs.DCSWrapper.Object#Object ObjectName : The Object name

<h4> Returns </h4>
* [OBJECT](#object-class)
self


### OBJECT:GetID()

<h4> Parameters </h4>
* [OBJECT](#object-class) self

<h4> Returns </h4>
* Dcs.DCSWrapper.Object#Object.ID ObjectID
* <u>Nil</u> The : DCS Object is not existing or alive.


### OBJECT:Destroy()

<h4> Parameters </h4>
* [OBJECT](#object-class)
self

<h4> Returns </h4>
* <u>Nil</u> The : DCS Unit is not existing or alive.


## DCSObject Class
<pre>
The DCSObject class does not inherit
</pre>

<h4> Attributes </h4>

* id_ The : ID of the controllable in DCS


