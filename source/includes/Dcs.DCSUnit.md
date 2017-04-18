# Dcs.DCSUnit Module


## Unit Class
<pre>
Inheritance : The Unit Class inherits from the following parents :
ERROR !
	`-- Unit
</pre>
<h4> Attributes </h4>

* ID Identifier : of an unit. It assigned to an unit by the Mission Editor automatically.
* #Unit.Category Category
* #Unit.RefuelingSystem RefuelingSystem
* #Unit.SensorType SensorType
* #Unit.OpticType OpticType
* #Unit.RadarType RadarType
* #Unit.Desc Desc
* #Unit.DescAircraft DescAircraft
* #Unit.DescAirplane DescAirplane
* #Unit.DescHelicopter DescHelicopter
* #Unit.DescVehicle DescVehicle
* #Unit.DescShip DescShip
* #Unit.AmmoItem AmmoItem
* #list<#Unit.AmmoItem> Ammo
* #Unit.Sensor Sensor
* #Unit.Optic Optic
* #Unit.Radar Radar
* #Unit.IRST IRST


### getByName()
Returns unit object by the name assigned to the unit in Mission Editor. If there is unit with such name or the unit is destroyed the function will return nil. The function provides access to non-activated units too.

<h4> Parameters </h4>
* <u>String</u> name

<h4> Returns </h4>
* #Unit 


### Unit:isActive()
Returns if the unit is activated.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>Boolean</u> 


### Unit:getPlayerName()
Returns name of the player that control the unit or nil if the unit is controlled by A.I.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>String</u> 


### Unit:getID()
returns the unit's unique identifier.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* #Unit.ID 


### Unit:getNumber()
Returns the unit's number in the group. The number is the same number the unit has in ME. It may not be changed during the mission. If any unit in the group is destroyed, the numbers of another units will not be changed.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>Number</u> 


### Unit:getController()
Returns controller of the unit if it exist and nil otherwise

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* #Controller 


### Unit:getGroup()
Returns the unit's group if it exist and nil otherwise

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* Dcs.DCSWrapper.Group#Group 


### Unit:getCallsign()
Returns the unit's callsign - the localized string.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>String</u> 


### Unit:getLife()
Returns the unit's health. Dead units has health <= 1.0

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>Number</u> 


### Unit:getLife0()
returns the unit's initial health.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>Number</u> 


### Unit:getFuel()
Returns relative amount of fuel (from 0.0 to 1.0) the unit has in its internal tanks. If there are additional fuel tanks the value may be greater than 1.0.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>Number</u> 


### Unit:getAmmo()
Returns the unit ammunition.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* #Unit.Ammo 


### Unit:getSensors()
Returns the unit sensors.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* #Unit.Sensors 


### Unit:hasSensors(sensorType, Additional)
``` lua
If sensorType is Unit.SensorType.OPTIC, additional parameters are optic sensor types. Following example checks if the unit has LLTV or IR optics:
unit:hasSensors(Unit.SensorType.OPTIC, Unit.OpticType.LLTV, Unit.OpticType.IR)
If sensorType is Unit.SensorType.RADAR, additional parameters are radar types. Following example checks if the unit has air search radars:
unit:hasSensors(Unit.SensorType.RADAR, Unit.RadarType.AS)
If no additional parameters are specified the function returns true if the unit has at least one sensor of specified type.
If sensor type is not specified the function returns true if the unit has at least one sensor of any type.

```
Returns true if the unit has specified types of sensors. This function is more preferable than Unit.getSensors() if you don't want to get information about all the unit's sensors, and just want to check if the unit has specified types of sensors.

<h4> Parameters </h4>
* #Unit self
* #Unit.SensorType sensorType : (= nil) Sensor type.
* ... Additional : parameters.

<h4> Returns </h4>
* <u>Boolean</u> 


### Unit:getRadar()
returns two values:
First value indicates if at least one of the unit's radar(s) is on.
Second value is the object of the radar's interest. Not nil only if at least one radar of the unit is tracking a target.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* <u>Boolean</u>, 


### Unit:getDesc()
Returns unit descriptor. Descriptor type depends on unit category.

<h4> Parameters </h4>
* #Unit self

<h4> Returns </h4>
* #Unit.Desc 


## Unit.Category Class
<pre>
The Unit.Category class does not inherit
</pre>

<h4> Attributes </h4>

* AIRPLANE self
* HELICOPTER self
* GROUND_UNIT self
* SHIP self
* STRUCTURE self


## Unit.RefuelingSystem Class
<pre>
The Unit.RefuelingSystem class does not inherit
</pre>

<h4> Attributes </h4>

* BOOM_AND_RECEPTACLE self
* PROBE_AND_DROGUE self


## Unit.SensorType Class
<pre>
The Unit.SensorType class does not inherit
</pre>

<h4> Attributes </h4>

* OPTIC self
* RADAR self
* IRST self
* RWR self


## Unit.OpticType Class
<pre>
The Unit.OpticType class does not inherit
</pre>

<h4> Attributes </h4>

* TV TV-sensor
* LLTV Low-level : TV-sensor
* IR Infra-Red : optic sensor


## Unit.RadarType Class
<pre>
The Unit.RadarType class does not inherit
</pre>

<h4> Attributes </h4>

* AS air : search radar
* SS surface/land : search radar


## Unit.Desc Class
<pre>
Inheritance : The Unit.Desc Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
</pre>

<h4> Attributes </h4>

* #Unit.Category category : Unit Category
* #Mass massEmpty : mass of empty unit
* <u>Number</u> speedMax : istance / Time, --maximal velocity


## Unit.DescAircraft Class
<pre>
Inheritance : The Unit.DescAircraft Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- Unit.DescAircraft
</pre>

<h4> Attributes </h4>

* #Mass fuelMassMax : maximal inner fuel mass
* #Distance range : Operational range
* #Distance Hmax : Ceiling
* <u>Number</u> VyMax :  #Distance / #Time, --maximal climb rate
* <u>Number</u> NyMin : minimal safe acceleration
* <u>Number</u> NyMax : maximal safe acceleration
* #Unit.RefuelingSystem tankerType : refueling system type


## Unit.DescAirplane Class
<pre>
Inheritance : The Unit.DescAirplane Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- Unit.DescAircraft
				`-- Unit.DescAirplane
</pre>

<h4> Attributes </h4>

* <u>Number</u> speedMax0 : Distance / Time maximal TAS at ground level
* <u>Number</u> speedMax10K : Distance / Time maximal TAS at altitude of 10 km


## Unit.DescHelicopter Class
<pre>
Inheritance : The Unit.DescHelicopter Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- Unit.DescAircraft
				`-- Unit.DescHelicopter
</pre>

<h4> Attributes </h4>

* #Distance HmaxStat : static ceiling


## Unit.DescVehicle Class
<pre>
Inheritance : The Unit.DescVehicle Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- Unit.DescVehicle
</pre>

<h4> Attributes </h4>

* #Angle maxSlopeAngle : maximal slope angle
* <u>Boolean</u> riverCrossing : can the vehicle cross a rivers


## Unit.DescShip Class
<pre>
Inheritance : The Unit.DescShip Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- Unit.DescShip
</pre>


## Unit.AmmoItem Class
<pre>
The Unit.AmmoItem class does not inherit
</pre>

<h4> Attributes </h4>

* #Weapon.Desc desc : ammunition descriptor
* <u>Number</u> count : ammunition count


## Unit.Sensor Class
<pre>
The Unit.Sensor class does not inherit
</pre>

<h4> Attributes </h4>

* #TypeName typeName
* #Unit.SensorType type


## Unit.Optic Class
<pre>
Inheritance : The Unit.Optic Class inherits from the following parents :
Unit.Sensor
	`-- Unit.Optic
</pre>

<h4> Attributes </h4>

* #Unit.OpticType opticType


##  Unit.Radar Class
<pre>
Inheritance : The  Unit.Radar Class inherits from the following parents :
Unit.Sensor
	`--  Unit.Radar
</pre>

<h4> Attributes </h4>

* #Distance detectionDistanceRBM : detection distance for RCS=1m^2 in real-beam mapping mode, nil if radar doesn't support surface/land search
* #Distance detectionDistanceHRM : detection distance for RCS=1m^2 in high-resolution mapping mode, nil if radar has no HRM
* #Unit.Radar.detectionDistanceAir detectionDistanceAir : detection distance for RCS=1m^2 airborne target, nil if radar doesn't support air search


## Unit.Radar.detectionDistanceAir Class
<pre>
The Unit.Radar.detectionDistanceAir class does not inherit
</pre>
<h4> Attributes </h4>

* #Unit.Radar.detectionDistanceAir.upperHemisphere upperHemisphere
* #Unit.Radar.detectionDistanceAir.lowerHemisphere lowerHemisphere


## Unit.Radar.detectionDistanceAir.upperHemisphere Class
<pre>
The Unit.Radar.detectionDistanceAir.upperHemisphere class does not inherit
</pre>
<h4> Attributes </h4>

* #Distance headOn
* #Distance tailOn


## Unit.Radar.detectionDistanceAir.lowerHemisphere Class
<pre>
The Unit.Radar.detectionDistanceAir.lowerHemisphere class does not inherit
</pre>
<h4> Attributes </h4>

* #Distance headOn
* #Distance tailOn


## [Unit.IRST](#unit.irst-class-) Class
<pre>
Inheritance : The [Unit.IRST](#unit.irst-class-) Class inherits from the following parents :
Unit.Sensor
	`-- Wrapper.Unit#Unit.IRST
</pre>

<h4> Attributes </h4>

* #Distance detectionDistanceIdle : detection of tail-on target with heat signature = 1 in upper hemisphere, engines are in idle
* #Distance detectionDistanceMaximal : ..., engines are in maximal mode
* #Distance detectionDistanceAfterburner : ..., engines are in afterburner mode


## Unit.RWR Class
<pre>
Inheritance : The Unit.RWR Class inherits from the following parents :
Unit.Sensor
	`-- Unit.RWR
</pre>


## Sensors Class
<pre>
The Sensors class does not inherit
</pre>
TODO 

