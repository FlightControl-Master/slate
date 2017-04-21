# Wrapper.Airbase Module
This module contains the AIRBASE classes.



##### 1) [AIRBASE](#airbase-class-) class, extends [POSITIONABLE](#positionable-class-)

The [AIRBASE](#airbase-module-) class is a wrapper class to handle the DCS Airbase objects:

* Support all DCS Airbase APIs.
* Enhance with Airbase specific APIs not in the DCS Airbase API set.


##### 1.1) AIRBASE reference methods

For each DCS Airbase object alive within a running mission, a AIRBASE wrapper object (instance) will be created within the _[DATABASE](#database-module-) object.
This is done at the beginning of the mission (when the mission starts).

The AIRBASE class **does not contain a :New()** method, rather it provides **:Find()** methods to retrieve the object reference
using the DCS Airbase or the DCS AirbaseName.

Another thing to know is that AIRBASE objects do not "contain" the DCS Airbase object.
The AIRBASE methods will reference the DCS Airbase object by name when it is needed during API execution.
If the DCS Airbase object does not exist or is nil, the AIRBASE methods will return nil and log an exception in the DCS.log file.

The AIRBASE class provides the following functions to retrieve quickly the relevant AIRBASE instance:

* [AIRBASE:Find()](#airbase-find-dcsairbase): Find a AIRBASE instance from the _DATABASE object using a DCS Airbase object.
* [AIRBASE:FindByName()](#airbase-findbyname-airbasename): Find a AIRBASE instance from the _DATABASE object using a DCS Airbase name.

IMPORTANT: ONE SHOULD NEVER SANATIZE these AIRBASE OBJECT REFERENCES! (make the AIRBASE object references nil).

##### 1.2) DCS AIRBASE APIs

The DCS Airbase APIs are used extensively within MOOSE. The AIRBASE class has for each DCS Airbase API a corresponding method.
To be able to distinguish easily in your code the difference between a AIRBASE API call and a DCS Airbase API call,
the first letter of the method is also capitalized. So, by example, the DCS Airbase method @{DCSWrapper.Airbase#Airbase.getName}()
is implemented in the AIRBASE class as AIRBASE-GetName-.

More functions will be added

During the MOOSE development, more functions will be added.

## AIRBASE Class
<pre>
Inheritance : The AIRBASE Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
				`-- AIRBASE
</pre>


### AIRBASE:Register(AirbaseName)
Create a new AIRBASE from DCSAirbase.

<h4> Parameters </h4>
* [AIRBASE](#airbase-class-)
self
* <u>String</u> AirbaseName : The name of the airbase.

<h4> Returns </h4>
* [AIRBASE](#airbase-class-) 


### AIRBASE:Find(DCSAirbase)
Finds a AIRBASE from the _DATABASE using a DCSAirbase object.

<h4> Parameters </h4>
* [AIRBASE](#airbase-class-)
self
* Dcs.DCSWrapper.Airbase#Airbase DCSAirbase : An existing DCS Airbase object reference.

<h4> Returns </h4>
* [AIRBASE](#airbase-class-) 


### AIRBASE:FindByName(AirbaseName)
Find a AIRBASE in the _DATABASE using the name of an existing DCS Airbase.

<h4> Parameters </h4>
* [AIRBASE](#airbase-class-)
self
* <u>String</u> AirbaseName : The Airbase Name.

<h4> Returns </h4>
* [AIRBASE](#airbase-class-) 


