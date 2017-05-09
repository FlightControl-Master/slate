# Wrapper.Positionable Module
This module contains the POSITIONABLE class.

##### 1) [POSITIONABLE](#positionable-class-) class, extends [IDENTIFIABLE](#identifiable-class-)

The [POSITIONABLE](#positionable-class-) class is a wrapper class to handle the POSITIONABLE objects:

* Support all DCS APIs.
* Enhance with POSITIONABLE specific APIs not in the DCS API set.
* Manage the "state" of the POSITIONABLE.

##### 1.1) POSITIONABLE constructor:

The POSITIONABLE class provides the following functions to construct a POSITIONABLE instance:

* [POSITIONABLE:New()](#positionable-new-positionablename): Create a POSITIONABLE instance.

##### 1.2) POSITIONABLE methods:

The following methods can be used to identify an measurable object:

* POSITIONABLE-GetID-: Returns the ID of the measurable object.
* POSITIONABLE-GetName-: Returns the name of the measurable object.



## POSITIONABLE Class
<pre>
Inheritance : The POSITIONABLE Class inherits from the following parents :
BASE
	`-- OBJECT
		`-- IDENTIFIABLE
			`-- POSITIONABLE
</pre>

<h4> Attributes </h4>

* <u>String</u> PositionableName : The name of the measurable.
* [SPOT](#spot-class-) Spot : The laser Spot.
* <u>Number</u> LaserCode : The last assigned laser code.


### POSITIONABLE:New(PositionableName)
Create a new POSITIONABLE from a DCSPositionable

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* Dcs.DCSWrapper.Positionable#Positionable PositionableName : The POSITIONABLE name

<h4> Returns </h4>
* [POSITIONABLE](#positionable-class-)



### POSITIONABLE:GetPositionVec3()
Returns the @{DCSTypes#Position3} position vectors indicating the point and direction vectors in 3D of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [Position](#position-class-)  The 3D position vectors of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetVec2()
Returns the @{DCSTypes#Vec2} vector indicating the point in 2D of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [Vec2](#vec2-class-)  The 2D point vector of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetPointVec2()
Returns a POINT_VEC2 object indicating the point in 2D of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class-)  The 2D point vector of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetPointVec3()
Returns a POINT_VEC3 object indicating the point in 3D of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class-)  The 3D point vector of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetCoordinate()
Returns a COORDINATE object indicating the point in 3D of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [COORDINATE](#coordinate-class-)  The COORDINATE of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetRandomVec3(Radius)
``` lua
-- If Radius is ignored, returns the [Vec3](#vec3-class-) of first UNIT of the GROUP
```
Returns a random @{DCSTypes#Vec3} vector within a range, indicating the point in 3D of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self
* <u>Number</u> Radius

<h4> Returns </h4>
* [Vec3](#vec3-class-)  The 3D point vector of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetVec3()
Returns the @{DCSTypes#Vec3} vector indicating the 3D vector of the POSITIONABLE within the mission.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [Vec3](#vec3-class-)  The 3D point vector of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetAltitude()
Returns the altitude of the POSITIONABLE.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [Distance](#distance-class-)  The altitude of the POSITIONABLE.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:IsAboveRunway()
Returns if the Positionable is located above a runway.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* <u>Boolean</u>  true if Positionable is above a runway.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetHeading()
Returns the POSITIONABLE heading in degrees.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* <u>Number</u>  The POSTIONABLE heading
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:InAir()
Returns true if the POSITIONABLE is in the air.
Polymorphic, is overridden in GROUP and UNIT.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* <u>Boolean</u>  true if in the air.
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetVelocity()
Returns the POSITIONABLE velocity vector.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* [Vec3](#vec3-class-)  The velocity vector
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:GetVelocityKMH()
Returns the POSITIONABLE velocity in km/h.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-) self

<h4> Returns </h4>
* <u>Number</u>  The velocity in km/h
* <u>Nil</u>  The POSITIONABLE is not existing or alive.


### POSITIONABLE:MessageToAll(Message, Duration, Name)
Send a message to all coalitions.
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* <u>String</u> Name : (optional) The Name of the sender. If not provided, the Name is the type of the Positionable.

<h4> Returns </h4>

### POSITIONABLE:MessageToCoalition(Message, Duration, MessageCoalition)
Send a message to a coalition.
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* [coalition](#coalition-class-) MessageCoalition : The Coalition receiving the message.

<h4> Returns </h4>

### POSITIONABLE:MessageToRed(Message, Duration, Name)
Send a message to the red coalition.
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* <u>String</u> Name : (optional) The Name of the sender. If not provided, the Name is the type of the Positionable.

<h4> Returns </h4>

### POSITIONABLE:MessageToBlue(Message, Duration, Name)
Send a message to the blue coalition.
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* <u>String</u> Name : (optional) The Name of the sender. If not provided, the Name is the type of the Positionable.

<h4> Returns </h4>

### POSITIONABLE:MessageToClient(Message, Duration, Client, Name)
Send a message to a client.
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* [CLIENT](#client-class-) Client : The client object receiving the message.
* <u>String</u> Name : (optional) The Name of the sender. If not provided, the Name is the type of the Positionable.

<h4> Returns </h4>

### POSITIONABLE:MessageToGroup(Message, Duration, MessageGroup, Name)
Send a message to a [Group](#group-module-).
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* [GROUP](#group-class-) MessageGroup : The GROUP object receiving the message.
* <u>String</u> Name : (optional) The Name of the sender. If not provided, the Name is the type of the Positionable.

<h4> Returns </h4>

### POSITIONABLE:Message(Message, Duration, Name)
Send a message to the players in the [Group](#group-module-).
The message will appear in the message area. The message will begin with the callsign of the group and the type of the first unit sending the message.

<h4> Parameters </h4>
* [POSITIONABLE](#positionable-class-)
self
* <u>String</u> Message : The message text
* [Duration](#duration-class-) Duration : The duration of the message.
* <u>String</u> Name : (optional) The Name of the sender. If not provided, the Name is the type of the Positionable.

<h4> Returns </h4>

## DCSPositionable Class
<pre>
The DCSPositionable class does not inherit
</pre>

<h4> Attributes </h4>

* id_ The : ID of the controllable in DCS


