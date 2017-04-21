# Dcs.land Module


## land Class
<pre>
Inheritance : The land Class inherits from the following parents :
ERROR !
	`-- land
</pre>
<h4> Attributes </h4>

* #land.SurfaceType SurfaceType


### getHeight()
Returns altitude MSL of the point.
@function [parent=#land] getHeight

<h4> Parameters </h4>
* #Vec2 point : point on the ground.

<h4> Returns </h4>
* [Distance](#distance-class-) 


### getSurfaceType()
returns surface type at the given point.
@function [parent=#land] getSurfaceType

<h4> Parameters </h4>
* #Vec2 point : Point on the land.

<h4> Returns </h4>
* #land.SurfaceType 


## land.SurfaceType Class
<pre>
The land.SurfaceType class does not inherit
</pre>
<h4> Attributes </h4>

* LAND self
* SHALLOW_WATER self
* WATER self
* ROAD self
* RUNWAY self


