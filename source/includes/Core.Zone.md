# Core.Zone Module
**Core** - ZONE classes define **zones** within your mission of **various forms**, with **various capabilities**.

![Banner Image](/includes/Pictures/ZONE/Dia1.JPG)



There are essentially two core functions that zones accomodate:

* Test if an object is within the zone boundaries.
* Provide the zone behaviour. Some zones are static, while others are moveable.

The object classes are using the zone classes to test the zone boundaries, which can take various forms:

* Test if completely within the zone.
* Test if partly within the zone (for [GROUP](#group-class) objects).
* Test if not in the zone.
* Distance to the nearest intersecting point of the zone.
* Distance to the center of the zone.
* ...

Each of these ZONE classes have a zone name, and specific parameters defining the zone type:

* [ZONE_BASE](#zone_base-class): The ZONE_BASE class defining the base for all other zone classes.
* [ZONE_RADIUS](#zone_radius-class): The ZONE_RADIUS class defined by a zone name, a location and a radius.
* [ZONE](#zone-class): The ZONE class, defined by the zone name as defined within the Mission Editor.
* [ZONE_UNIT](#zone_unit-class): The ZONE_UNIT class defines by a zone around a [UNIT](#unit-class) with a radius.
* [ZONE_GROUP](#zone_group-class): The ZONE_GROUP class defines by a zone around a [GROUP](#group-class) with a radius.
* [ZONE_POLYGON](#zone_polygon-class): The ZONE_POLYGON class defines by a sequence of [GROUP](#group-class) waypoints within the Mission Editor, forming a polygon.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-02-28: ZONE\_BASE:**IsVec2InZone()** replaces ZONE\_BASE:_IsPointVec2InZone()_.
2017-02-28: ZONE\_BASE:**IsVec3InZone()** replaces ZONE\_BASE:_IsPointVec3InZone()_.
2017-02-28: ZONE\_RADIUS:**IsVec2InZone()** replaces ZONE\_RADIUS:_IsPointVec2InZone()_.
2017-02-28: ZONE\_RADIUS:**IsVec3InZone()** replaces ZONE\_RADIUS:_IsPointVec3InZone()_.
2017-02-28: ZONE\_POLYGON:**IsVec2InZone()** replaces ZONE\_POLYGON:_IsPointVec2InZone()_.
2017-02-28: ZONE\_POLYGON:**IsVec3InZone()** replaces ZONE\_POLYGON:_IsPointVec3InZone()_.

2017-02-18: ZONE\_POLYGON_BASE:**GetRandomPointVec2()** added.

2017-02-18: ZONE\_POLYGON_BASE:**GetRandomPointVec3()** added.

2017-02-18: ZONE\_RADIUS:**GetRandomPointVec3( inner, outer )** added.

2017-02-18: ZONE\_RADIUS:**GetRandomPointVec2( inner, outer )** added.

2016-08-15: ZONE\_BASE:**GetName()** added.

2016-08-15: ZONE\_BASE:**SetZoneProbability( ZoneProbability )** added.

2016-08-15: ZONE\_BASE:**GetZoneProbability()** added.

2016-08-15: ZONE\_BASE:**GetZoneMaybe()** added.



## ZONE_BASE Class
<pre>
Inheritance : The ZONE_BASE Class inherits from the following parents :
BASE
	`-- ZONE_BASE
</pre>

This class is an abstract BASE class for derived classes, and is not meant to be instantiated.

#####  1.1) Each zone has a name:

* [ZONE_BASE:GetName()](#zone_base-getname): Returns the name of the zone.

#####  1.2) Each zone implements two polymorphic functions defined in [ZONE_BASE](#zone_base-class):

* [ZONE_BASE:IsVec2InZone()](#zone_base-isvec2inzone-vec2): Returns if a Vec2 is within the zone.
* [ZONE_BASE:IsVec3InZone()](#zone_base-isvec3inzone-vec3): Returns if a Vec3 is within the zone.

#####  1.3) A zone has a probability factor that can be set to randomize a selection between zones:

* ZONE_BASE-SetRandomizeProbability: Set the randomization probability of a zone to be selected, taking a value between 0 and 1 ( 0 = 0%, 1 = 100% )
* ZONE_BASE-GetRandomizeProbability: Get the randomization probability of a zone to be selected, passing a value between 0 and 1 ( 0 = 0%, 1 = 100% )
* [ZONE_BASE:GetZoneMaybe()](#zone_base-getzonemaybe): Get the zone taking into account the randomization probability. nil is returned if this zone is not a candidate.

#####  1.4) A zone manages Vectors:

* [ZONE_BASE:GetVec2()](#zone_base-getvec2): Returns the @{DCSTypes#Vec2} coordinate of the zone.
* [ZONE_BASE:GetRandomVec2()](#zone_base-getrandomvec2): Define a random @{DCSTypes#Vec2} within the zone.

#####  1.5) A zone has a bounding square:

* [ZONE_BASE:GetBoundingSquare()](#zone_base-getboundingsquare): Get the outer most bounding square of the zone.

#####  1.6) A zone can be marked:

* [ZONE_BASE:SmokeZone()](#zone_base-smokezone-smokecolor): Smokes the zone boundaries in a color.
* ZONE_BASE-FlareZone: Flares the zone boundaries in a color.



The ZONE_BASE class

<h4> Attributes </h4>

* <u>String</u> ZoneName : Name of the zone.
* <u>Number</u> ZoneProbability : A value between 0 and 1. 0 = 0% and 1 = 100% probability.


### ZONE_BASE:New(ZoneName)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* <u>String</u> ZoneName : Name of the zone.

<h4> Returns </h4>
* [ZONE_BASE](#zone_base-class)
self


### ZONE_BASE:GetName()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* <u>String</u> The : name of the zone.


### ZONE_BASE:IsVec2InZone(Vec2)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* [Vec2](#vec2-class) Vec2 : The location to test.

<h4> Returns </h4>
* <u>Boolean</u> true : if the location is within the zone.


### ZONE_BASE:IsVec3InZone(Vec3)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* [Vec3](#vec3-class) Vec3 : The point to test.

<h4> Returns </h4>
* <u>Boolean</u> true : if the point is within the zone.


### ZONE_BASE:GetVec2()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* <u>Nil</u>. self


### ZONE_BASE:GetPointVec2(Height)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* [Distance](#distance-class) Height : The height to add to the land height where the center of the zone is located.

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) The : PointVec2 of the zone.


### ZONE_BASE:GetVec3(Height)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* [Distance](#distance-class) Height : The height to add to the land height where the center of the zone is located.

<h4> Returns </h4>
* [Vec3](#vec3-class) The : Vec3 of the zone.


### ZONE_BASE:GetPointVec3(Height)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* [Distance](#distance-class) Height : The height to add to the land height where the center of the zone is located.

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class) The : PointVec3 of the zone.


### ZONE_BASE:GetRandomVec2()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : Vec2 coordinates.


### ZONE_BASE:GetRandomPointVec2()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) The : PointVec2 coordinates.


### ZONE_BASE:GetRandomPointVec3()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class) The : PointVec3 coordinates.


### ZONE_BASE:GetBoundingSquare()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* <u>Nil</u> The : bounding square.


### ZONE_BASE:BoundZone()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>

### ZONE_BASE:SmokeZone(SmokeColor)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* [SMOKECOLOR](#smokecolor-class) SmokeColor : The smoke color.

<h4> Returns </h4>

### ZONE_BASE:SetZoneProbability(A)

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self
* ZoneProbability A : value between 0 and 1. 0 = 0% and 1 = 100% probability.

<h4> Returns </h4>

### ZONE_BASE:GetZoneProbability()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* <u>Number</u> A : value between 0 and 1. 0 = 0% and 1 = 100% probability.


### ZONE_BASE:GetZoneMaybe()

<h4> Parameters </h4>
* [ZONE_BASE](#zone_base-class)
self

<h4> Returns </h4>
* [ZONE_BASE](#zone_base-class)
The : zone is selected taking into account the randomization probability factor.
* <u>Nil</u> The : zone is not selected taking into account the randomization probability factor.


## ZONE_BASE.BoundingSquare Class
<pre>
**The ZONE_BASE.BoundingSquare class does not inherit**
</pre>

<h4> Attributes </h4>

* [Distance](#distance-class) x1 : The lower x coordinate (left down)
* [Distance](#distance-class) y1 : The lower y coordinate (left down)
* [Distance](#distance-class) x2 : The higher x coordinate (right up)
* [Distance](#distance-class) y2 : The higher y coordinate (right up)


## ZONE_RADIUS Class
<pre>
Inheritance : The ZONE_RADIUS Class inherits from the following parents :
BASE
	`-- ZONE_BASE
		`-- ZONE_RADIUS
</pre>

The ZONE_RADIUS class defined by a zone name, a location and a radius.
This class implements the inherited functions from [ZONE_BASE](#zone_base-class) taking into account the own zone format and properties.

#####  2.1) [ZONE_RADIUS](#zone_radius-class) constructor

* [ZONE_RADIUS:New()](#zone_radius-new-zonename-vec2-radius): Constructor.

#####  2.2) Manage the radius of the zone

* [ZONE_RADIUS:SetRadius()](#zone_radius-setradius-radius): Sets the radius of the zone.
* [ZONE_RADIUS:GetRadius()](#zone_radius-getradius): Returns the radius of the zone.

#####  2.3) Manage the location of the zone

* [ZONE_RADIUS:SetVec2()](#zone_radius-setvec2-vec2): Sets the @{DCSTypes#Vec2} of the zone.
* [ZONE_RADIUS:GetVec2()](#zone_radius-getvec2): Returns the @{DCSTypes#Vec2} of the zone.
* [ZONE_RADIUS:GetVec3()](#zone_radius-getvec3-height): Returns the @{DCSTypes#Vec3} of the zone, taking an additional height parameter.

#####  2.4) Zone point randomization

Various functions exist to find random points within the zone.

* [ZONE_RADIUS:GetRandomVec2()](#zone_radius-getrandomvec2-inner-outer): Gets a random 2D point in the zone.
* [ZONE_RADIUS:GetRandomPointVec2()](#zone_radius-getrandompointvec2-inner-outer): Gets a @{Point#POINT_VEC2} object representing a random 2D point in the zone.
* [ZONE_RADIUS:GetRandomPointVec3()](#zone_radius-getrandompointvec3-inner-outer): Gets a @{Point#POINT_VEC3} object representing a random 3D point in the zone. Note that the height of the point is at landheight.





The ZONE_RADIUS class, defined by a zone name, a location and a radius.

<h4> Attributes </h4>

* [Vec2](#vec2-class) Vec2 : The current location of the zone.
* [Distance](#distance-class) Radius : The radius of the zone.


### ZONE_RADIUS:New(ZoneName, Vec2, Radius)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* <u>String</u> ZoneName : Name of the zone.
* [Vec2](#vec2-class) Vec2 : The location of the zone.
* [Distance](#distance-class) Radius : The radius of the zone.

<h4> Returns </h4>
* [ZONE_RADIUS](#zone_radius-class)
self


### ZONE_RADIUS:BoundZone(Points, UnBound)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* <u>Number</u> Points : (optional) The amount of points in the circle.
* <u>Boolean</u> UnBound : If true the tyres will be destroyed.

<h4> Returns </h4>
* [ZONE_RADIUS](#zone_radius-class)
self


### ZONE_RADIUS:SmokeZone(SmokeColor, Points)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [SMOKECOLOR](#smokecolor-class) SmokeColor : The smoke color.
* <u>Number</u> Points : (optional) The amount of points in the circle.

<h4> Returns </h4>
* [ZONE_RADIUS](#zone_radius-class)
self


### ZONE_RADIUS:FlareZone(FlareColor, Points, Azimuth)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [FLARECOLOR](#flarecolor-class) FlareColor : The flare color.
* <u>Number</u> Points : (optional) The amount of points in the circle.
* [Azimuth](#azimuth-class) Azimuth : (optional) Azimuth The azimuth of the flare.

<h4> Returns </h4>
* [ZONE_RADIUS](#zone_radius-class)
self


### ZONE_RADIUS:GetRadius()

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self

<h4> Returns </h4>
* [Distance](#distance-class) The : radius of the zone.


### ZONE_RADIUS:SetRadius(Radius)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [Distance](#distance-class) Radius : The radius of the zone.

<h4> Returns </h4>
* [Distance](#distance-class) The : radius of the zone.


### ZONE_RADIUS:GetVec2()

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : location of the zone.


### ZONE_RADIUS:SetVec2(Vec2)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [Vec2](#vec2-class) Vec2 : The new location of the zone.

<h4> Returns </h4>
* [Vec2](#vec2-class) The : new location of the zone.


### ZONE_RADIUS:GetVec3(Height)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [Distance](#distance-class) Height : The height to add to the land height where the center of the zone is located.

<h4> Returns </h4>
* [Vec3](#vec3-class) The : point of the zone.


### ZONE_RADIUS:IsVec2InZone(Vec2)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [Vec2](#vec2-class) Vec2 : The location to test.

<h4> Returns </h4>
* <u>Boolean</u> true : if the location is within the zone.


### ZONE_RADIUS:IsVec3InZone(Vec3)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* [Vec3](#vec3-class) Vec3 : The point to test.

<h4> Returns </h4>
* <u>Boolean</u> true : if the point is within the zone.


### ZONE_RADIUS:GetRandomVec2(inner, outer)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* <u>Number</u> inner : (optional) Minimal distance from the center of the zone. Default is 0.
* <u>Number</u> outer : (optional) Maximal distance from the outer edge of the zone. Default is the radius of the zone.

<h4> Returns </h4>
* [Vec2](#vec2-class) The : random location within the zone.


### ZONE_RADIUS:GetRandomPointVec2(inner, outer)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* <u>Number</u> inner : (optional) Minimal distance from the center of the zone. Default is 0.
* <u>Number</u> outer : (optional) Maximal distance from the outer edge of the zone. Default is the radius of the zone.

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) The : @{Point#POINT_VEC2} object reflecting the random 3D location within the zone.


### ZONE_RADIUS:GetRandomPointVec3(inner, outer)

<h4> Parameters </h4>
* [ZONE_RADIUS](#zone_radius-class)
self
* <u>Number</u> inner : (optional) Minimal distance from the center of the zone. Default is 0.
* <u>Number</u> outer : (optional) Maximal distance from the outer edge of the zone. Default is the radius of the zone.

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class) The : @{Point#POINT_VEC3} object reflecting the random 3D location within the zone.


## ZONE Class
<pre>
Inheritance : The ZONE Class inherits from the following parents :
BASE
	`-- ZONE_BASE
		`-- ZONE_RADIUS
			`-- ZONE
</pre>

The ZONE class, defined by the zone name as defined within the Mission Editor.
This class implements the inherited functions from [ZONE_RADIUS](#zone_radius-class) taking into account the own zone format and properties.







### ZONE:New(ZoneName)

<h4> Parameters </h4>
* [ZONE](#zone-class)
self
* <u>String</u> ZoneName : The name of the zone as defined within the mission editor.

<h4> Returns </h4>
* [ZONE](#zone-class)
self


## ZONE_UNIT Class
<pre>
Inheritance : The ZONE_UNIT Class inherits from the following parents :
BASE
	`-- ZONE_BASE
		`-- ZONE_RADIUS
			`-- ZONE_UNIT
</pre>

The ZONE_UNIT class defined by a zone around a [UNIT](#unit-class) with a radius.
This class implements the inherited functions from [ZONE_RADIUS](#zone_radius-class) taking into account the own zone format and properties.





The ZONE_UNIT class defined by a zone around a [UNIT](#unit-class) with a radius.

<h4> Attributes </h4>

* [UNIT](#unit-class) ZoneUNIT


### ZONE_UNIT:New(ZoneName, ZoneUNIT, Radius)

<h4> Parameters </h4>
* [ZONE_UNIT](#zone_unit-class)
self
* <u>String</u> ZoneName : Name of the zone.
* [UNIT](#unit-class) ZoneUNIT : The unit as the center of the zone.
* [Distance](#distance-class) Radius : The radius of the zone.

<h4> Returns </h4>
* [ZONE_UNIT](#zone_unit-class)
self


### ZONE_UNIT:GetVec2()

<h4> Parameters </h4>
* [ZONE_UNIT](#zone_unit-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : location of the zone based on the [UNIT](#unit-class)location.


### ZONE_UNIT:GetRandomVec2()

<h4> Parameters </h4>
* [ZONE_UNIT](#zone_unit-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : random location within the zone.


### ZONE_UNIT:GetVec3(Height)

<h4> Parameters </h4>
* [ZONE_UNIT](#zone_unit-class)
self
* [Distance](#distance-class) Height : The height to add to the land height where the center of the zone is located.

<h4> Returns </h4>
* [Vec3](#vec3-class) The : point of the zone.


## ZONE_GROUP Class
<pre>
Inheritance : The ZONE_GROUP Class inherits from the following parents :
BASE
	`-- ZONE_BASE
		`-- ZONE_RADIUS
			`-- ZONE_GROUP
</pre>

The ZONE_GROUP class defines by a zone around a [GROUP](#group-class) with a radius. The current leader of the group defines the center of the zone.
This class implements the inherited functions from [ZONE_RADIUS](#zone_radius-class) taking into account the own zone format and properties.






<h4> Attributes </h4>

* [GROUP](#group-class) ZoneGROUP


### ZONE_GROUP:New(ZoneName, ZoneGROUP, Radius)

<h4> Parameters </h4>
* [ZONE_GROUP](#zone_group-class)
self
* <u>String</u> ZoneName : Name of the zone.
* [GROUP](#group-class) ZoneGROUP : The [Group](#group-module) as the center of the zone.
* [Distance](#distance-class) Radius : The radius of the zone.

<h4> Returns </h4>
* [ZONE_GROUP](#zone_group-class)
self


### ZONE_GROUP:GetVec2()

<h4> Parameters </h4>
* [ZONE_GROUP](#zone_group-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : location of the zone based on the [Group](#group-module) location.


### ZONE_GROUP:GetRandomVec2()

<h4> Parameters </h4>
* [ZONE_GROUP](#zone_group-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : random location of the zone based on the [Group](#group-module) location.


## ZONE_POLYGON_BASE Class
<pre>
Inheritance : The ZONE_POLYGON_BASE Class inherits from the following parents :
BASE
	`-- ZONE_BASE
		`-- ZONE_POLYGON_BASE
</pre>

The ZONE_POLYGON_BASE class defined by a sequence of [GROUP](#group-class) waypoints within the Mission Editor, forming a polygon.
This class implements the inherited functions from [ZONE_RADIUS](#zone_radius-class) taking into account the own zone format and properties.
This class is an abstract BASE class for derived classes, and is not meant to be instantiated.

#####  6.1) Zone point randomization

Various functions exist to find random points within the zone.

* [ZONE_POLYGON_BASE:GetRandomVec2()](#zone_polygon_base-getrandomvec2): Gets a random 2D point in the zone.
* [ZONE_POLYGON_BASE:GetRandomPointVec2()](#zone_polygon_base-getrandompointvec2): Return a @{Point#POINT_VEC2} object representing a random 2D point within the zone.
* [ZONE_POLYGON_BASE:GetRandomPointVec3()](#zone_polygon_base-getrandompointvec3): Return a @{Point#POINT_VEC3} object representing a random 3D point at landheight within the zone.






<h4> Attributes </h4>

* [ListVec2](#zone_polygon_base-listvec2-class) Polygon : The polygon defined by an array of @{DCSTypes#Vec2}.


### ZONE_POLYGON_BASE:New(ZoneName, PointsArray)

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self
* <u>String</u> ZoneName : Name of the zone.
* [ListVec2](#zone_polygon_base-listvec2-class) PointsArray : An array of @{DCSTypes#Vec2}, forming a polygon..

<h4> Returns </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self


### ZONE_POLYGON_BASE:Flush()

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self

<h4> Returns </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self


### ZONE_POLYGON_BASE:BoundZone(UnBound)

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self
* <u>Boolean</u> UnBound : If true, the tyres will be destroyed.

<h4> Returns </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self


### ZONE_POLYGON_BASE:SmokeZone(SmokeColor)

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self
* [SMOKECOLOR](#smokecolor-class) SmokeColor : The smoke color.

<h4> Returns </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self


### ZONE_POLYGON_BASE:IsVec2InZone(Vec2)

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self
* [Vec2](#vec2-class) Vec2 : The location to test.

<h4> Returns </h4>
* <u>Boolean</u> true : if the location is within the zone.


### ZONE_POLYGON_BASE:GetRandomVec2()

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : Vec2 coordinate.


### ZONE_POLYGON_BASE:GetRandomPointVec2()

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self

<h4> Returns </h4>
* @{Point#POINT_VEC2} self


### ZONE_POLYGON_BASE:GetRandomPointVec3()

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self

<h4> Returns </h4>
* @{Point#POINT_VEC3} self


### ZONE_POLYGON_BASE:GetBoundingSquare()

<h4> Parameters </h4>
* [ZONE_POLYGON_BASE](#zone_polygon_base-class)
self

<h4> Returns </h4>
* [BoundingSquare](#zone_polygon_base-boundingsquare-class) The : bounding square.


## ZONE_POLYGON_BASE.ListVec2 Class
<pre>
**The ZONE_POLYGON_BASE.ListVec2 class does not inherit**
</pre>


## ZONE_POLYGON Class
<pre>
Inheritance : The ZONE_POLYGON Class inherits from the following parents :
BASE
	`-- ZONE_BASE
		`-- ZONE_POLYGON_BASE
			`-- ZONE_POLYGON
</pre>

The ZONE_POLYGON class defined by a sequence of [GROUP](#group-class) waypoints within the Mission Editor, forming a polygon.
This class implements the inherited functions from [ZONE_RADIUS](#zone_radius-class) taking into account the own zone format and properties.







### ZONE_POLYGON:New(ZoneName, ZoneGroup)

<h4> Parameters </h4>
* [ZONE_POLYGON](#zone_polygon-class)
self
* <u>String</u> ZoneName : Name of the zone.
* [GROUP](#group-class) ZoneGroup : The GROUP waypoints as defined within the Mission Editor define the polygon shape.

<h4> Returns </h4>
* [ZONE_POLYGON](#zone_polygon-class)
self


