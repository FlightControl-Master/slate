# Core.Point Module
**Core** - **POINT\_VEC** classes define an **extensive API** to **manage 3D points** in the simulation space.

##### 1) @{Point#POINT_VEC3} class, extends [BASE](#base-class)

The @{Point#POINT_VEC3} class defines a 3D point in the simulator.

**Important Note:** Most of the functions in this section were taken from MIST, and reworked to OO concepts.
In order to keep the credibility of the the author, I want to emphasize that the of the MIST framework was created by Grimes, who you can find on the Eagle Dynamics Forums.

#####  1.1) POINT_VEC3 constructor

A new POINT_VEC3 instance can be created with:

* @{Point#POINT_VEC3.New}(): a 3D point.
* @{Point#POINT_VEC3.NewFromVec3}(): a 3D point created from a @{DCSTypes#Vec3}.

#####  1.2) Manupulate the X, Y, Z coordinates of the point

A POINT_VEC3 class works in 3D space. It contains internally an X, Y, Z coordinate.
Methods exist to manupulate these coordinates.

The current X, Y, Z axis can be retrieved with the methods @{#POINT_VEC3.GetX}(), @{#POINT_VEC3.GetY}(), @{#POINT_VEC3.GetZ}() respectively.
The methods @{#POINT_VEC3.SetX}(), @{#POINT_VEC3.SetY}(), @{#POINT_VEC3.SetZ}() change the respective axis with a new value.
The current axis values can be changed by using the methods @{#POINT_VEC3.AddX}(), @{#POINT_VEC3.AddY}(), @{#POINT_VEC3.AddZ}()
to add or substract a value from the current respective axis value.
Note that the Set and Add methods return the current POINT_VEC3 object, so these manipulation methods can be chained... For example:

local Vec3 = PointVec3:AddX( 100 ):AddZ( 150 ):GetVec3()

#####  1.3) Create waypoints for routes

A POINT_VEC3 can prepare waypoints for Ground, Air and Naval groups to be embedded into a Route.


#####  1.5) Smoke, flare, explode, illuminate

At the point a smoke, flare, explosion and illumination bomb can be triggered. Use the following methods:

#####  1.5.1) Smoke

* @{#POINT_VEC3.Smoke}(): To smoke the point in a certain color.
* @{#POINT_VEC3.SmokeBlue}(): To smoke the point in blue.
* @{#POINT_VEC3.SmokeRed}(): To smoke the point in red.
* @{#POINT_VEC3.SmokeOrange}(): To smoke the point in orange.
* @{#POINT_VEC3.SmokeWhite}(): To smoke the point in white.
* @{#POINT_VEC3.SmokeGreen}(): To smoke the point in green.

#####  1.5.2) Flare

* @{#POINT_VEC3.Flare}(): To flare the point in a certain color.
* @{#POINT_VEC3.FlareRed}(): To flare the point in red.
* @{#POINT_VEC3.FlareYellow}(): To flare the point in yellow.
* @{#POINT_VEC3.FlareWhite}(): To flare the point in white.
* @{#POINT_VEC3.FlareGreen}(): To flare the point in green.

#####  1.5.3) Explode

* @{#POINT_VEC3.Explosion}(): To explode the point with a certain intensity.

#####  1.5.4) Illuminate

* @{#POINT_VEC3.IlluminationBomb}(): To illuminate the point.


##### 2) @{Point#POINT_VEC2} class, extends @{Point#POINT_VEC3}

The @{Point#POINT_VEC2} class defines a 2D point in the simulator. The height coordinate (if needed) will be the land height + an optional added height specified.

##### 2.1) POINT_VEC2 constructor

A new POINT_VEC2 instance can be created with:

* @{Point#POINT_VEC2.New}(): a 2D point, taking an additional height parameter.
* @{Point#POINT_VEC2.NewFromVec2}(): a 2D point created from a @{DCSTypes#Vec2}.

#####  1.2) Manupulate the X, Altitude, Y coordinates of the 2D point

A POINT_VEC2 class works in 2D space, with an altitude setting. It contains internally an X, Altitude, Y coordinate.
Methods exist to manupulate these coordinates.

The current X, Altitude, Y axis can be retrieved with the methods @{#POINT_VEC2.GetX}(), @{#POINT_VEC2.GetAlt}(), @{#POINT_VEC2.GetY}() respectively.
The methods @{#POINT_VEC2.SetX}(), @{#POINT_VEC2.SetAlt}(), @{#POINT_VEC2.SetY}() change the respective axis with a new value.
The current Lat(itude), Alt(itude), Lon(gitude) values can also be retrieved with the methods @{#POINT_VEC2.GetLat}(), @{#POINT_VEC2.GetAlt}(), @{#POINT_VEC2.GetLon}() respectively.
The current axis values can be changed by using the methods @{#POINT_VEC2.AddX}(), @{#POINT_VEC2.AddAlt}(), @{#POINT_VEC2.AddY}()
to add or substract a value from the current respective axis value.
Note that the Set and Add methods return the current POINT_VEC2 object, so these manipulation methods can be chained... For example:

local Vec2 = PointVec2:AddX( 100 ):AddY( 2000 ):GetVec2()



**API CHANGE HISTORY**


The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

Hereby the change log:

2017-03-03: POINT\_VEC3:**Explosion( ExplosionIntensity )** added.
2017-03-03: POINT\_VEC3:**IlluminationBomb()** added.

2017-02-18: POINT\_VEC3:**NewFromVec2( Vec2, LandHeightAdd )** added.

2016-08-12: POINT\_VEC3:**Translate( Distance, Angle )** added.

2016-08-06: Made PointVec3 and Vec3, PointVec2 and Vec2 terminology used in the code consistent.

* Replaced method _Point_Vec3() to **Vec3**() where the code manages a Vec3. Replaced all references to the method.
* Replaced method _Point_Vec2() to **Vec2**() where the code manages a Vec2. Replaced all references to the method.
* Replaced method Random_Point_Vec3() to **RandomVec3**() where the code manages a Vec3. Replaced all references to the method.
.


#####  Authors:

* FlightControl : Design & Programming

#####  Contributions:

## POINT_VEC3 Class
<pre>
Inheritance : The POINT_VEC3 Class inherits from the following parents :
BASE
	`-- POINT_VEC3
</pre>

<h4> Attributes </h4>

* <u>Number</u> x : The x coordinate in 3D space.
* <u>Number</u> y : The y coordinate in 3D space.
* <u>Number</u> z : The z coordiante in 3D space.
* [SMOKECOLOR](#smokecolor-class) SmokeColor
* [FLARECOLOR](#flarecolor-class) FlareColor
* #POINT_VEC3.RoutePointAltType RoutePointAltType
* #POINT_VEC3.RoutePointType RoutePointType
* #POINT_VEC3.RoutePointAction RoutePointAction


### POINT_VEC3:New(x, y, z)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Distance](#distance-class) x : The x coordinate of the Vec3 point, pointing to the North.
* [Distance](#distance-class) y : The y coordinate of the Vec3 point, pointing Upwards.
* [Distance](#distance-class) z : The z coordinate of the Vec3 point, pointing to the Right.

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class) self


### POINT_VEC3:NewFromVec2(Vec2)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Vec2](#vec2-class) Vec2 : The Vec2 point.

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class) self


### POINT_VEC3:NewFromVec3(Vec3)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Vec3](#vec3-class) Vec3 : The Vec3 point.

<h4> Returns </h4>
* [POINT_VEC3](#point_vec3-class) self


### POINT_VEC3:GetVec3()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* [Vec3](#vec3-class) The : Vec3 coodinate.


### POINT_VEC3:GetVec2()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* [Vec2](#vec2-class) The : Vec2 coodinate.


### POINT_VEC3:GetX()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* <u>Number</u> The : x coodinate.


### POINT_VEC3:GetY()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* <u>Number</u> The : y coodinate.


### POINT_VEC3:GetZ()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* <u>Number</u> The : z coodinate.


### POINT_VEC3:SetX(x)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> x : The x coordinate.

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:SetY(y)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> y : The y coordinate.

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:SetZ(z)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> z : The z coordinate.

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:AddX(x)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> x : The x coordinate value to add to the current x coodinate.

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:AddY(y)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> y : The y coordinate value to add to the current y coodinate.

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:AddZ(z)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> z : The z coordinate value to add to the current z coodinate.

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:GetRandomVec2InRadius(OuterRadius, InnerRadius)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Distance](#distance-class) OuterRadius
* [Distance](#distance-class) InnerRadius

<h4> Returns </h4>
* [Vec2](#vec2-class) Vec2


### POINT_VEC3:GetRandomPointVec2InRadius(OuterRadius, InnerRadius)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Distance](#distance-class) OuterRadius
* [Distance](#distance-class) InnerRadius

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC3:GetRandomVec3InRadius(OuterRadius, InnerRadius)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Distance](#distance-class) OuterRadius
* [Distance](#distance-class) InnerRadius

<h4> Returns </h4>
* [Vec3](#vec3-class) Vec3


### POINT_VEC3:GetRandomPointVec3InRadius(OuterRadius, InnerRadius)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Distance](#distance-class) OuterRadius
* [Distance](#distance-class) InnerRadius

<h4> Returns </h4>
* #POINT_VEC3 self


### POINT_VEC3:GetDirectionVec3(TargetPointVec3)

<h4> Parameters </h4>
* #POINT_VEC3 self
* #POINT_VEC3 TargetPointVec3 : The target POINT_VEC3.

<h4> Returns </h4>
* [Vec3](#vec3-class) DirectionVec3 : The direction vector in Vec3 format.


### POINT_VEC3:GetNorthCorrectionRadians()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* <u>Number</u> CorrectionRadians : The correction in radians.


### POINT_VEC3:GetDirectionRadians(DirectionVec3)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Vec3](#vec3-class) DirectionVec3 : The direction vector in Vec3 format.

<h4> Returns </h4>
* <u>Number</u> DirectionRadians : The direction in radians.


### POINT_VEC3:Get2DDistance(TargetPointVec3)

<h4> Parameters </h4>
* #POINT_VEC3 self
* #POINT_VEC3 TargetPointVec3 : The target POINT_VEC3.

<h4> Returns </h4>
* [Distance](#distance-class) Distance : The distance in meters.


### POINT_VEC3:Get3DDistance(TargetPointVec3)

<h4> Parameters </h4>
* #POINT_VEC3 self
* #POINT_VEC3 TargetPointVec3 : The target POINT_VEC3.

<h4> Returns </h4>
* [Distance](#distance-class) Distance : The distance in meters.


### POINT_VEC3:ToStringBR(AngleRadians, Distance)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> AngleRadians : The angle in randians
* <u>Number</u> Distance : The distance

<h4> Returns </h4>
* <u>String</u> The : BR Text


### POINT_VEC3:ToStringLL(AngleRadians, Distance)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> AngleRadians : The angle in randians
* <u>Number</u> Distance : The distance

<h4> Returns </h4>
* <u>String</u> The : BR Text


### POINT_VEC3:GetAltitudeText()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* <u>String</u> Altitude : text.


### POINT_VEC3:GetBRText(TargetPointVec3)

<h4> Parameters </h4>
* #POINT_VEC3 self
* #POINT_VEC3 TargetPointVec3 : The target POINT_VEC3.

<h4> Returns </h4>
* <u>String</u> The : BR text.


### POINT_VEC3:SetMetric(Metric)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Boolean</u> Metric : true means metric, false means NM.

<h4> Returns </h4>

### POINT_VEC3:IsMetric()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>
* <u>Boolean</u> Metric : true means metric, false means NM.


### POINT_VEC3:Translate(Distance, Angle)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Distance](#distance-class) Distance : The Distance to be added in meters.
* [Angle](#angle-class) Angle : The Angle in degrees.

<h4> Returns </h4>
* #POINT_VEC3 The : new calculated POINT_VEC3.


### POINT_VEC3:RoutePointAir(AltType, Type, Action, Speed, SpeedLocked)

<h4> Parameters </h4>
* #POINT_VEC3 self
* #POINT_VEC3.RoutePointAltType AltType : The altitude type.
* #POINT_VEC3.RoutePointType Type : The route point type.
* #POINT_VEC3.RoutePointAction Action : The route point action.
* [Speed](#speed-class) Speed : Airspeed in km/h.
* <u>Boolean</u> SpeedLocked : true means the speed is locked.

<h4> Returns </h4>
* <u>List[]</u> The : route point.


### POINT_VEC3:RoutePointGround(Speed, Formation)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Speed](#speed-class) Speed : Speed in km/h.
* #POINT_VEC3.RoutePointAction Formation : The route point Formation.

<h4> Returns </h4>
* <u>List[]</u> The : route point.


### POINT_VEC3:Explosion(ExplosionIntensity)

<h4> Parameters </h4>
* #POINT_VEC3 self
* <u>Number</u> ExplosionIntensity

<h4> Returns </h4>

### POINT_VEC3:IlluminationBomb()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

### POINT_VEC3:Smoke(SmokeColor)

<h4> Parameters </h4>
* #POINT_VEC3 self
* [SMOKECOLOR](#smokecolor-class) SmokeColor

<h4> Returns </h4>

### POINT_VEC3:SmokeGreen()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

### POINT_VEC3:SmokeRed()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

### POINT_VEC3:SmokeWhite()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

### POINT_VEC3:SmokeOrange()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

### POINT_VEC3:SmokeBlue()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

### POINT_VEC3:Flare(FlareColor, (optional))

<h4> Parameters </h4>
* #POINT_VEC3 self
* [FLARECOLOR](#flarecolor-class) FlareColor
* [Azimuth](#azimuth-class) (optional) : Azimuth The azimuth of the flare direction. The default azimuth is 0.

<h4> Returns </h4>

### POINT_VEC3:FlareWhite((optional))

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Azimuth](#azimuth-class) (optional) : Azimuth The azimuth of the flare direction. The default azimuth is 0.

<h4> Returns </h4>

### POINT_VEC3:FlareYellow((optional))

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Azimuth](#azimuth-class) (optional) : Azimuth The azimuth of the flare direction. The default azimuth is 0.

<h4> Returns </h4>

### POINT_VEC3:FlareGreen((optional))

<h4> Parameters </h4>
* #POINT_VEC3 self
* [Azimuth](#azimuth-class) (optional) : Azimuth The azimuth of the flare direction. The default azimuth is 0.

<h4> Returns </h4>

### POINT_VEC3:FlareRed()

<h4> Parameters </h4>
* #POINT_VEC3 self

<h4> Returns </h4>

## POINT_VEC2 Class
<pre>
Inheritance : The POINT_VEC2 Class inherits from the following parents :
BASE
	`-- POINT_VEC3
		`-- POINT_VEC2
</pre>

<h4> Attributes </h4>

* [Distance](#distance-class) x : The x coordinate in meters.
* [Distance](#distance-class) y : the y coordinate in meters.


### POINT_VEC2:New(x, y, LandHeightAdd)

<h4> Parameters </h4>
* #POINT_VEC2 self
* [Distance](#distance-class) x : The x coordinate of the Vec3 point, pointing to the North.
* [Distance](#distance-class) y : The y coordinate of the Vec3 point, pointing to the Right.
* [Distance](#distance-class) LandHeightAdd : (optional) The default height if required to be evaluated will be the land height of the x, y coordinate. You can specify an extra height to be added to the land height.

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) self


### POINT_VEC2:NewFromVec2(Vec2)

<h4> Parameters </h4>
* #POINT_VEC2 self
* [Vec2](#vec2-class) Vec2 : The Vec2 point.

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) self


### POINT_VEC2:NewFromVec3(Vec3)

<h4> Parameters </h4>
* #POINT_VEC2 self
* [Vec3](#vec3-class) Vec3 : The Vec3 point.

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) self


### POINT_VEC2:GetX()

<h4> Parameters </h4>
* #POINT_VEC2 self

<h4> Returns </h4>
* <u>Number</u> The : x coodinate.


### POINT_VEC2:GetY()

<h4> Parameters </h4>
* #POINT_VEC2 self

<h4> Returns </h4>
* <u>Number</u> The : y coodinate.


### POINT_VEC2:GetAlt()

<h4> Parameters </h4>
* #POINT_VEC2 self

<h4> Returns </h4>
* <u>Number</u> The : land altitude.


### POINT_VEC2:GetLat()

<h4> Parameters </h4>
* #POINT_VEC2 self

<h4> Returns </h4>
* <u>Number</u> The : x coodinate.


### POINT_VEC2:GetLon()

<h4> Parameters </h4>
* #POINT_VEC2 self

<h4> Returns </h4>
* <u>Number</u> The : y coodinate.


### POINT_VEC2:SetX(x)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> x : The x coordinate.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:SetY(y)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> y : The y coordinate.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:SetLat(x)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> x : The x coordinate.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:SetAlt(Altitude)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> Altitude : The land altitude. If nothing (nil) is given, then the current land altitude is set.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:SetLon(y)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> y : The y coordinate.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:AddX(x)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> x : The x coordinate.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:AddY(y)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> y : The y coordinate.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:AddAlt(Altitude)

<h4> Parameters </h4>
* #POINT_VEC2 self
* <u>Number</u> Altitude : The Altitude to add. If nothing (nil) is given, then the current land altitude is set.

<h4> Returns </h4>
* #POINT_VEC2 self


### POINT_VEC2:DistanceFromPointVec2(PointVec2Reference)

<h4> Parameters </h4>
* #POINT_VEC2 self
* #POINT_VEC2 PointVec2Reference : The reference @{#POINT_VEC2}.

<h4> Returns </h4>
* [Distance](#distance-class) The : distance from the reference @{#POINT_VEC2} in meters.


### POINT_VEC2:DistanceFromVec2(Vec2Reference)

<h4> Parameters </h4>
* #POINT_VEC2 self
* [Vec2](#vec2-class) Vec2Reference : The reference @{DCSTypes#Vec2}.

<h4> Returns </h4>
* [Distance](#distance-class) The : distance from the reference @{DCSTypes#Vec2} in meters.


### POINT_VEC2:GetAltitudeText()

<h4> Parameters </h4>
* #POINT_VEC2 self

<h4> Returns </h4>
* <u>String</u> Empty : string.


### POINT_VEC2:Translate(Distance, Angle)

<h4> Parameters </h4>
* #POINT_VEC2 self
* [Distance](#distance-class) Distance : The Distance to be added in meters.
* [Angle](#angle-class) Angle : The Angle in degrees.

<h4> Returns </h4>
* #POINT_VEC2 The : new calculated POINT_VEC2.


## POINT_VEC3.RoutePointAltType Class
<pre>
**The POINT_VEC3.RoutePointAltType class does not inherit**
</pre>

<h4> Attributes </h4>

* BARO "BARO"


## POINT_VEC3.RoutePointType Class
<pre>
**The POINT_VEC3.RoutePointType class does not inherit**
</pre>

<h4> Attributes </h4>

* TakeOffParking "TakeOffParking"
* TurningPoint "Turning : Point"


## POINT_VEC3.RoutePointAction Class
<pre>
**The POINT_VEC3.RoutePointAction class does not inherit**
</pre>

<h4> Attributes </h4>

* FromParkingArea "From : Parking Area"
* TurningPoint "Turning : Point"


