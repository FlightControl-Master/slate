# Core.Cargo Module
**Core** -- Management of CARGO logistics, that can be transported from and to transportation carriers.

![Banner Image](/includes/Pictures/CARGO/Dia1.JPG)



Cargo can be of various forms, always are composed out of ONE object ( one unit or one static or one slingload crate ):

* CARGO_UNIT, represented by a [Unit](#unit-module) in a singleton [Group](#group-module): Cargo can be represented by a Unit in a Group. a CARGO_UNIT is representable...
* CARGO_GROUP, represented by a [Group](#group-module). A CARGO_GROUP is reportable...



#####  Demo Missions

#####  [CARGO Demo Missions source code]()

#####  [CARGO Demo Missions, only for beta testers]()

#####  [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)



#####  YouTube Channel

#####  [SPAWNSTATIC YouTube Channel]()



This module is still under construction, but is described above works already, and will keep working ...

## CARGO Class
<pre>
Inheritance : The CARGO Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- CARGO
</pre>

The CARGO class defines the core functions that defines a cargo object within MOOSE.
A cargo is a logical object defined that is available for transport, and has a life status within a simulation.

The CARGO is a state machine: it manages the different events and states of the cargo.
All derived classes from CARGO follow the same state machine, expose the same cargo event functions, and provide the same cargo states.

#####  CARGO Events:

* [CARGO:Board()](#cargo-board-tocarrier-nearradius) ToCarrier ):  Boards the cargo to a carrier.
* [CARGO:Load()](#cargo-load-tocarrier) ToCarrier ): Loads the cargo into a carrier, regardless of its position.
* [CARGO:UnBoard()](#cargo-unboard-topointvec2) ToPointVec2 ): UnBoard the cargo from a carrier. This will trigger a movement of the cargo to the option ToPointVec2.
* [CARGO:UnLoad()](#cargo-unload-topointvec2) ToPointVec2 ): UnLoads the cargo from a carrier.
* CARGO-Dead Controllable ): The cargo is dead. The cargo process will be ended.

#####  CARGO States:

* **UnLoaded**: The cargo is unloaded from a carrier.
* **Boarding**: The cargo is currently boarding (= running) into a carrier.
* **Loaded**: The cargo is loaded into a carrier.
* **UnBoarding**: The cargo is currently unboarding (=running) from a carrier.
* **Dead**: The cargo is dead ...
* **End**: The process has come to an end.

#####  CARGO state transition methods:

State transition functions can be set **by the mission designer** customizing or improving the behaviour of the state.
There are 2 moments when state transition methods will be called by the state machine:

* **Leaving** the state.
The state transition method needs to start with the name **OnLeave + the name of the state**.
If the state transition method returns false, then the processing of the state transition will not be done!
If you want to change the behaviour of the AIControllable at this event, return false,
but then you'll need to specify your own logic using the AIControllable!

* **Entering** the state.
The state transition method needs to start with the name **OnEnter + the name of the state**.
These state transition methods need to provide a return value, which is specified at the function description.




<h4> Attributes </h4>

* <u>String</u> Type : A string defining the type of the cargo. eg. Engineers, Equipment, Screwdrivers.
* <u>String</u> Name : A string defining the name of the cargo. The name is the unique identifier of the cargo.
* <u>Number</u> Weight : A number defining the weight of the cargo. The weight is expressed in kg.
* <u>Number</u> NearRadius : (optional) A number defining the radius in meters when the cargo is near to a Carrier, so that it can be loaded.
* [CONTROLLABLE](#controllable-class) CargoObject : The alive DCS object representing the cargo. This value can be nil, meaning, that the cargo is not represented anywhere...
* [CONTROLLABLE](#controllable-class) CargoCarrier : The alive DCS object carrying the cargo. This value can be nil, meaning, that the cargo is not contained anywhere...
* <u>Boolean</u> Slingloadable : This flag defines if the cargo can be slingloaded.
* <u>Boolean</u> Moveable : This flag defines if the cargo is moveable.
* <u>Boolean</u> Representable : This flag defines if the cargo can be represented by a DCS Unit.
* <u>Boolean</u> Containable : This flag defines if the cargo can be contained within a DCS Unit.


### CARGO:Board(ToCarrier, NearRadius)
Boards the cargo to a Carrier. The event will create a movement (= running or driving) of the cargo to the Carrier.
The cargo must be in the **UnLoaded** state.

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) ToCarrier : The Carrier that will hold the cargo.
* <u>Number</u> NearRadius : The radius when the cargo will board the Carrier (to avoid collision).

<h4> Returns </h4>

### CARGO:UnBoard(ToPointVec2)
UnBoards the cargo to a Carrier. The event will create a movement (= running or driving) of the cargo from the Carrier.
The cargo must be in the **Loaded** state.

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2 : (optional) @{Point#POINT_VEC2) to where the cargo should run after onboarding. If not provided, the cargo will run to 60 meters behind the Carrier location.

<h4> Returns </h4>

### CARGO:Load(ToCarrier)
Loads the cargo to a Carrier. The event will load the cargo into the Carrier regardless of its position. There will be no movement simulated of the cargo loading.
The cargo must be in the **UnLoaded** state.

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) ToCarrier : The Carrier that will hold the cargo.

<h4> Returns </h4>

### CARGO:UnLoad(ToPointVec2)
UnLoads the cargo to a Carrier. The event will unload the cargo from the Carrier. There will be no movement simulated of the cargo loading.
The cargo must be in the **Loaded** state.

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2 : (optional) @{Point#POINT_VEC2) to where the cargo will be placed after unloading. If not provided, the cargo will be placed 60 meters behind the Carrier location.

<h4> Returns </h4>

### CARGO:OnLeaveUnLoaded(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO:OnEnterUnLoaded(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### CARGO:OnLeaveLoaded(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO:OnEnterLoaded(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### CARGO:OnLeaveBoarding(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO:OnEnterBoarding(Controllable, NearRadius)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable
* <u>Number</u> NearRadius : The radius when the cargo will board the Carrier (to avoid collision).

<h4> Returns </h4>

### CARGO:OnLeaveUnBoarding(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO:OnEnterUnBoarding(Controllable)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### CARGO:New(Type, Name, Weight, NearRadius)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [CARGO](#cargo-class)
self


### CARGO:GetName()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* <u>String</u> The : name of the Cargo.


### CARGO:GetType()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* <u>String</u> The : type of the Cargo.


### CARGO:IsLoaded()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if loaded


### CARGO:IsUnLoaded()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* <u>Boolean</u> true : if unloaded


### CARGO:Spawn()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* [CARGO](#cargo-class)
self


### CARGO:IsInZone(Zone)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [ZONE_BASE](#zone_base-class) Zone

<h4> Returns </h4>
* <u>Boolean</u> **true** : if cargo is in the Zone, **false** if cargo is not in the Zone.


### CARGO:IsNear(PointVec2, NearRadius)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* [POINT_VEC2](#point_vec2-class) PointVec2
* <u>Number</u> NearRadius : The radius when the cargo will board the Carrier (to avoid collision).

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO:GetPointVec2()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) self


### CARGO:SetWeight(Weight)

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self
* <u>Number</u> Weight : The weight in kg.

<h4> Returns </h4>
* [CARGO](#cargo-class)
self


## CARGO.CargoObjects Class
<pre>
The CARGO.CargoObjects class does not inherit
</pre>

## CARGO_REPRESENTABLE Class
<pre>
Inheritance : The CARGO_REPRESENTABLE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- CARGO
					`-- CARGO_REPRESENTABLE
</pre>
<h4> Attributes </h4>

* test self


### CARGO_REPRESENTABLE:New(Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [CARGO_REPRESENTABLE](#cargo_representable-class)
self
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [CARGO_REPRESENTABLE](#cargo_representable-class)
self


### CARGO_REPRESENTABLE:RouteTo(ToPointVec2, Speed)

<h4> Parameters </h4>
* [CARGO_REPRESENTABLE](#cargo_representable-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>Number</u> Speed

<h4> Returns </h4>
* [CARGO_REPRESENTABLE](#cargo_representable-class)
self


## CARGO_REPORTABLE Class
<pre>
Inheritance : The CARGO_REPORTABLE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- CARGO
					`-- CARGO_REPORTABLE
</pre>

### CARGO_REPORTABLE:New(CargoObject, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [CARGO_REPORTABLE](#cargo_reportable-class)
self
* [Controllable](#controllable-class) CargoObject
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [CARGO_REPORTABLE](#cargo_reportable-class)
self


### CARGO_REPORTABLE:IsInRadius(PointVec2)

<h4> Parameters </h4>
* [CARGO_REPORTABLE](#cargo_reportable-class)
self
* [POINT_VEC2](#point_vec2-class) PointVec2

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO_REPORTABLE:MessageToGroup(Message, TaskGroup, Name)

<h4> Parameters </h4>
* [COMMANDCENTER](#commandcenter-class)
self
* <u>String</u> Message
* [GROUP](#group-class) TaskGroup
* #sring Name : (optional) The name of the Group used as a prefix for the message to the Group. If not provided, there will be nothing shown.

<h4> Returns </h4>

### CARGO_REPORTABLE:GetBoardingRange()

<h4> Parameters </h4>
* [CARGO](#cargo-class)
self

<h4> Returns </h4>
* <u>Number</u> The : range till cargo will board.


## CARGO_UNIT Class
<pre>
Inheritance : The CARGO_UNIT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- CARGO
					`-- CARGO_REPRESENTABLE
						`-- CARGO_UNIT
</pre>


### CARGO_UNIT:New(CargoUnit, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* [UNIT](#unit-class) CargoUnit
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [CARGO_UNIT](#cargo_unit-class)
self


### CARGO_UNIT:Destroy()

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self

<h4> Returns </h4>
* [CARGO_UNIT](#cargo_unit-class)
self


### CARGO_UNIT:onenterUnBoarding(Event, From, To, ToPointVec2)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) ToPointVec2

<h4> Returns </h4>

### CARGO_UNIT:onleaveUnBoarding(Event, From, To, ToPointVec2)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) ToPointVec2

<h4> Returns </h4>

### CARGO_UNIT:onafterUnBoarding(Event, From, To, ToPointVec2)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) ToPointVec2

<h4> Returns </h4>

### CARGO_UNIT:onenterUnLoaded(Event, From, To, self)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) self

<h4> Returns </h4>

### CARGO_UNIT:onenterBoarding(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### CARGO_UNIT:onleaveBoarding(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### CARGO_UNIT:onenterLoaded(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### CARGO_UNIT:onafterBoard(Event, From, To)

<h4> Parameters </h4>
* [CARGO_UNIT](#cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## CARGO_PACKAGE Class
<pre>
Inheritance : The CARGO_PACKAGE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- CARGO
					`-- CARGO_REPRESENTABLE
						`-- CARGO_PACKAGE
</pre>

### CARGO_PACKAGE:New(CargoCarrier, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* [UNIT](#unit-class) CargoCarrier : The UNIT carrying the package.
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self


### CARGO_PACKAGE:onafterOnBoard(Event, From, To, CargoCarrier, Speed, BoardDistance, Angle)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier
* <u>Number</u> Speed
* <u>Number</u> BoardDistance
* <u>Number</u> Angle

<h4> Returns </h4>

### CARGO_PACKAGE:IsNear(CargoCarrier)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>
* <u>Boolean</u> self


### CARGO_PACKAGE:onafterOnBoarded(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### CARGO_PACKAGE:onafterUnBoard(Event, From, To, Speed, UnLoadDistance, UnBoardDistance, Radius, Angle)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* <u>Number</u> Speed
* <u>Number</u> UnLoadDistance
* <u>Number</u> UnBoardDistance
* <u>Number</u> Radius
* <u>Number</u> Angle

<h4> Returns </h4>

### CARGO_PACKAGE:onafterUnBoarded(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### CARGO_PACKAGE:onafterLoad(Event, From, To, CargoCarrier, Speed, LoadDistance, Angle)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier
* <u>Number</u> Speed
* <u>Number</u> LoadDistance
* <u>Number</u> Angle

<h4> Returns </h4>

### CARGO_PACKAGE:onafterUnLoad(Event, From, To, Distance, Angle)

<h4> Parameters </h4>
* [CARGO_PACKAGE](#cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* <u>Number</u> Distance
* <u>Number</u> Angle

<h4> Returns </h4>

## CARGO_GROUP Class
<pre>
Inheritance : The CARGO_GROUP Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- CARGO
					`-- CARGO_REPORTABLE
						`-- CARGO_GROUP
</pre>

### CARGO_GROUP:New(CargoGroup, Type, Name, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [GROUP](#group-class) CargoGroup
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [CARGO_GROUP](#cargo_group-class)
self


### CARGO_GROUP:onenterBoarding(CargoCarrier, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [UNIT](#unit-class) CargoCarrier
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### CARGO_GROUP:onenterLoaded(CargoCarrier, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [UNIT](#unit-class) CargoCarrier
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### CARGO_GROUP:onleaveBoarding(CargoCarrier, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [UNIT](#unit-class) CargoCarrier
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### CARGO_GROUP:onenterUnBoarding(ToPointVec2, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### CARGO_GROUP:onleaveUnBoarding(ToPointVec2, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### CARGO_GROUP:onafterUnBoarding(ToPointVec2, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### CARGO_GROUP:onenterUnLoaded(self, Event, From, To)

<h4> Parameters </h4>
* [CARGO_GROUP](#cargo_group-class)
self
* [POINT_VEC2](#point_vec2-class) self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

