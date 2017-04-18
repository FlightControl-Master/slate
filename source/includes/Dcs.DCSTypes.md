# Dcs.DCSTypes Module


## Time Class
<pre>
Inheritance : The Time Class inherits from the following parents :
ERROR !
	`-- Time
</pre>


## ModelTime Class
<pre>
Inheritance : The ModelTime Class inherits from the following parents :
ERROR !
	`-- ModelTime
</pre>


## MissionTime Class
<pre>
Inheritance : The MissionTime Class inherits from the following parents :
ERROR !
	`-- MissionTime
</pre>


## Distance Class
<pre>
Inheritance : The Distance Class inherits from the following parents :
ERROR !
	`-- Distance
</pre>


## Angle Class
<pre>
Inheritance : The Angle Class inherits from the following parents :
ERROR !
	`-- Angle
</pre>


## Azimuth Class
<pre>
Inheritance : The Azimuth Class inherits from the following parents :
ERROR !
	`-- Azimuth
</pre>


## Mass Class
<pre>
Inheritance : The Mass Class inherits from the following parents :
ERROR !
	`-- Mass
</pre>


## Vec3 Class
<pre>
The Vec3 class does not inherit
</pre>
DCS world has 3-dimensional coordinate system. DCS ground is an infinite plain.

<h4> Attributes </h4>

* #Distance x : is directed to the north
* #Distance z : is directed to the east
* #Distance y : is directed up


## Vec2 Class
<pre>
The Vec2 class does not inherit
</pre>

<h4> Attributes </h4>

* #Distance x : Vec2.x = Vec3.x
* #Distance y : Vec2.y = Vec3.z


## Position3 Class
<pre>
The Position3 class does not inherit
</pre>

<h4> Attributes </h4>

* #Vec3 p
* #Vec3 x
* #Vec3 y
* #Vec3 z


## Box3 Class
<pre>
The Box3 class does not inherit
</pre>

<h4> Attributes </h4>

* #Vec3 min
* #Vec3 max


## TypeName Class
<pre>
Inheritance : The TypeName Class inherits from the following parents :
ERROR !
	`-- TypeName
</pre>


## AttributeName Class
<pre>
Inheritance : The AttributeName Class inherits from the following parents :
ERROR !
	`-- AttributeName
</pre>
Each object type may have attributes.
Attributes are enlisted in ./Scripts/Database/db_attributes.Lua.
To know what attributes the object type has, look for the unit type script in sub-directories planes/, helicopter/s, vehicles, navy/ of ./Scripts/Database/ directory.


## AttributeNameArray Class
<pre>
The AttributeNameArray class does not inherit
</pre>


## AI Class
<pre>
The AI class does not inherit
</pre>
<h4> Attributes </h4>

* [Skill](#ai-skill-class-)Skill
* [Task](#ai-task-class-)Task
* [Option](#ai-option-class-)Option


## AI.Skill Class
<pre>
The AI.Skill class does not inherit
</pre>
<h4> Attributes </h4>

* AVERAGE self
* GOOD self
* HIGH self
* EXCELLENT self
* PLAYER self
* CLIENT self


## AI.Task Class
<pre>
The AI.Task class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Task.WeaponExpend WeaponExpend
* #AI.Task.OrbitPattern OrbitPattern
* #AI.Task.Designation Designation
* #AI.Task.WaypointType WaypointType
* #AI.Task.TurnMethod TurnMethod
* #AI.Task.AltitudeType AltitudeType
* #AI.Task.VehicleFormation VehicleFormation


## AI.Task.WeaponExpend Class
<pre>
The AI.Task.WeaponExpend class does not inherit
</pre>
<h4> Attributes </h4>

* ONE self
* TWO self
* FOUR self
* QUARTER self
* HALF self
* ALL self


## AI.Task.OrbitPattern Class
<pre>
The AI.Task.OrbitPattern class does not inherit
</pre>
<h4> Attributes </h4>

* CIRCLE self
* RACE_TRACK self


## AI.Task.Designation Class
<pre>
The AI.Task.Designation class does not inherit
</pre>
<h4> Attributes </h4>

* NO self
* AUTO self
* WP self
* IR_POINTER self
* LASER self


## AI.Task.WaypointType Class
<pre>
The AI.Task.WaypointType class does not inherit
</pre>
<h4> Attributes </h4>

* TAKEOFF self
* TAKEOFF_PARKING self
* TURNING_POINT self
* LAND self


## AI.Task.TurnMethod Class
<pre>
The AI.Task.TurnMethod class does not inherit
</pre>
<h4> Attributes </h4>

* FLY_OVER_POINT self
* FIN_POINT self


## AI.Task.AltitudeType Class
<pre>
The AI.Task.AltitudeType class does not inherit
</pre>
<h4> Attributes </h4>

* BARO self
* RADIO self


## AI.Task.VehicleFormation Class
<pre>
The AI.Task.VehicleFormation class does not inherit
</pre>
<h4> Attributes </h4>

* OFF_ROAD self
* ON_ROAD self
* RANK self
* CONE self
* DIAMOND self
* VEE self
* ECHELON_LEFT self
* ECHELON_RIGHT self


## AI.Option Class
<pre>
The AI.Option class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Air self :                         Air
* #AI.Option.Ground self :                      Ground
* #AI.Option.Naval self :                       Naval


## AI.Option.Air Class
<pre>
The AI.Option.Air class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Air.id self :                      id
* #AI.Option.Air.val self :                     val


## AI.Option.Ground Class
<pre>
The AI.Option.Ground class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Ground.id self :                   id
* #AI.Option.Ground.val self :                  val


## AI.Option.Naval Class
<pre>
The AI.Option.Naval class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Naval.id self :                    id
* #AI.Option.Naval.val self :                   val


## AI.Option.Air.id Class
<pre>
The AI.Option.Air.id class does not inherit
</pre>
<h4> Attributes </h4>

* NO_OPTION self
* ROE self
* REACTION_ON_THREAT self
* RADAR_USING self
* FLARE_USING self
* FORMATION self
* RTB_ON_BINGO self
* SILENCE self


## AI.Option.Air.val Class
<pre>
The AI.Option.Air.val class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Air.val.ROE ROE
* #AI.Option.Air.val.REACTION_ON_THREAT REACTION_ON_THREAT
* #AI.Option.Air.val.RADAR_USING RADAR_USING
* #AI.Option.Air.val.FLARE_USING FLARE_USING


## AI.Option.Air.val.ROE Class
<pre>
The AI.Option.Air.val.ROE class does not inherit
</pre>
<h4> Attributes </h4>

* WEAPON_FREE self
* OPEN_FIRE_WEAPON_FREE self
* OPEN_FIRE self
* RETURN_FIRE self
* WEAPON_HOLD self


## AI.Option.Air.val.REACTION_ON_THREAT Class
<pre>
The AI.Option.Air.val.REACTION_ON_THREAT class does not inherit
</pre>
<h4> Attributes </h4>

* NO_REACTION self
* PASSIVE_DEFENCE self
* EVADE_FIRE self
* BYPASS_AND_ESCAPE self
* ALLOW_ABORT_MISSION self


## AI.Option.Air.val.RADAR_USING Class
<pre>
The AI.Option.Air.val.RADAR_USING class does not inherit
</pre>
<h4> Attributes </h4>

* NEVER self
* FOR_ATTACK_ONLY self
* FOR_SEARCH_IF_REQUIRED self
* FOR_CONTINUOUS_SEARCH self


## AI.Option.Air.val.FLARE_USING Class
<pre>
The AI.Option.Air.val.FLARE_USING class does not inherit
</pre>
<h4> Attributes </h4>

* NEVER self
* AGAINST_FIRED_MISSILE self
* WHEN_FLYING_IN_SAM_WEZ self
* WHEN_FLYING_NEAR_ENEMIES self


## AI.Option.Ground.id Class
<pre>
The AI.Option.Ground.id class does not inherit
</pre>
<h4> Attributes </h4>

* NO_OPTION self
* ROE @{#AI.Option.Ground.val.ROE}
* DISPERSE_ON_ATTACK true : or false
* ALARM_STATE @{#AI.Option.Ground.val.ALARM_STATE}


## AI.Option.Ground.val Class
<pre>
The AI.Option.Ground.val class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Ground.val.ROE self :              ROE
* #AI.Option.Ground.val.ALARM_STATE self :      ALARM_STATE


## AI.Option.Ground.val.ROE Class
<pre>
The AI.Option.Ground.val.ROE class does not inherit
</pre>
<h4> Attributes </h4>

* OPEN_FIRE self
* RETURN_FIRE self
* WEAPON_HOLD self


## AI.Option.Ground.val.ALARM_STATE Class
<pre>
The AI.Option.Ground.val.ALARM_STATE class does not inherit
</pre>
<h4> Attributes </h4>

* AUTO self
* GREEN self
* RED self


## AI.Option.Naval.id Class
<pre>
The AI.Option.Naval.id class does not inherit
</pre>
<h4> Attributes </h4>

* NO_OPTION self
* ROE self


## AI.Option.Naval.val Class
<pre>
The AI.Option.Naval.val class does not inherit
</pre>
<h4> Attributes </h4>

* #AI.Option.Naval.val.ROE ROE


## AI.Option.Naval.val.ROE Class
<pre>
The AI.Option.Naval.val.ROE class does not inherit
</pre>
<h4> Attributes </h4>

* OPEN_FIRE self
* RETURN_FIRE self
* WEAPON_HOLD self


## Desc Class
<pre>
The Desc class does not inherit
</pre>
<h4> Attributes </h4>

* #TypeName typeName : type name
* <u>String</u> displayName : localized display name
* <u>List[]</u> attributes : object type attributes


## Distance Class
<pre>
Inheritance : The Distance Class inherits from the following parents :
ERROR !
	`-- Distance
</pre>


