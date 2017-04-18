# Wrapper.Static Module
This module contains the STATIC class.

##### 1) [STATIC](#static-class-) class, extends [POSITIONABLE](#positionable-class-)

Statics are **Static Units** defined within the Mission Editor.
Note that Statics are almost the same as Units, but they don't have a controller.
The [STATIC](#static-class-) class is a wrapper class to handle the DCS Static objects:

* Wraps the DCS Static objects.
* Support all DCS Static APIs.
* Enhance with Static specific APIs not in the DCS API set.

##### 1.1) STATIC reference methods

For each DCS Static will have a STATIC wrapper object (instance) within the _[DATABASE](#database-module-) object.
This is done at the beginning of the mission (when the mission starts).

The STATIC class does not contain a :New() method, rather it provides :Find() methods to retrieve the object reference
using the Static Name.

Another thing to know is that STATIC objects do not "contain" the DCS Static object.
The STATIc methods will reference the DCS Static object by name when it is needed during API execution.
If the DCS Static object does not exist or is nil, the STATIC methods will return nil and log an exception in the DCS.log file.

The STATIc class provides the following functions to retrieve quickly the relevant STATIC instance:

* [STATIC:FindByName()](#static-findbyname-staticname-raiseerror): Find a STATIC instance from the _DATABASE object using a DCS Static name.

IMPORTANT: ONE SHOULD NEVER SANATIZE these STATIC OBJECT REFERENCES! (make the STATIC object references nil).

## STATIC Class
<pre>
Inheritance : The STATIC Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
				`-- STATIC
</pre>


### STATIC:FindByName(StaticName, RaiseError)

<h4> Parameters </h4>
* [STATIC](#static-class-)
self
* <u>String</u> StaticName : Name of the DCS **Static** as defined within the Mission Editor.
* <u>Boolean</u> RaiseError : Raise an error if not found.

<h4> Returns </h4>
* [STATIC](#static-class-)



