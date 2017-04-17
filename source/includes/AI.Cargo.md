# AI.Cargo Module
Single-Player:**Yes** / Multi-Player:**Yes** / AI:**Yes** / Human:**No** / Types:**Ground** --
**Management of logical cargo objects, that can be transported from and to transportation carriers.**

![Banner Image](/includes/Pictures/AI_CARGO/CARGO.JPG)



Cargo can be of various forms, always are composed out of ONE object ( one unit or one static or one slingload crate ):

* AI_CARGO_UNIT, represented by a [Unit](#unit-module) in a [Group](#group-module): Cargo can be represented by a Unit in a Group. Destruction of the Unit will mean that the cargo is lost.
* CARGO_STATIC, represented by a [Static](#static-module): Cargo can be represented by a Static. Destruction of the Static will mean that the cargo is lost.
* AI_CARGO_PACKAGE, contained in a [Unit](#unit-module) of a [Group](#group-module): Cargo can be contained within a Unit of a Group. The cargo can be **delivered** by the [Unit](#unit-module). If the Unit is destroyed, the cargo will be destroyed also.
* AI_CARGO_PACKAGE, Contained in a [Static](#static-module): Cargo can be contained within a Static. The cargo can be **collected** from the @Static. If the [Static](#static-module) is destroyed, the cargo will be destroyed.
* CARGO_SLINGLOAD, represented by a [Cargo](#cargo-module) that is transportable: Cargo can be represented by a Cargo object that is transportable. Destruction of the Cargo will mean that the cargo is lost.

* AI_CARGO_GROUPED, represented by a Group of CARGO_UNITs.

#####  1) [AI_CARGO](#ai_cargo-class) class, extends [FSM_PROCESS](#fsm_process-class)

The [AI_CARGO](#ai_cargo-class) class defines the core functions that defines a cargo object within MOOSE.
A cargo is a logical object defined that is available for transport, and has a life status within a simulation.

The AI_CARGO is a state machine: it manages the different events and states of the cargo.
All derived classes from AI_CARGO follow the same state machine, expose the same cargo event functions, and provide the same cargo states.

#####  1.2.1) AI_CARGO Events:

* [AI_CARGO:Board()](#ai_cargo-board-tocarrier) ToCarrier ):  Boards the cargo to a carrier.
* [AI_CARGO:Load()](#ai_cargo-load-tocarrier) ToCarrier ): Loads the cargo into a carrier, regardless of its position.
* [AI_CARGO:UnBoard()](#ai_cargo-unboard-topointvec2) ToPointVec2 ): UnBoard the cargo from a carrier. This will trigger a movement of the cargo to the option ToPointVec2.
* [AI_CARGO:UnLoad()](#ai_cargo-unload-topointvec2) ToPointVec2 ): UnLoads the cargo from a carrier.
* AI_CARGO-Dead Controllable ): The cargo is dead. The cargo process will be ended.

#####  1.2.2) AI_CARGO States:

* **UnLoaded**: The cargo is unloaded from a carrier.
* **Boarding**: The cargo is currently boarding (= running) into a carrier.
* **Loaded**: The cargo is loaded into a carrier.
* **UnBoarding**: The cargo is currently unboarding (=running) from a carrier.
* **Dead**: The cargo is dead ...
* **End**: The process has come to an end.

#####  1.2.3) AI_CARGO state transition methods:

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

#####  2) [AI_CARGO_UNIT](#ai_cargo_unit-class)
class

The AI_CARGO_UNIT class defines a cargo that is represented by a UNIT object within the simulator, and can be transported by a carrier.
Use the event functions as described above to Load, UnLoad, Board, UnBoard the AI_CARGO_UNIT objects to and from carriers.

#####  5) [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
class

The AI_CARGO_GROUPED class defines a cargo that is represented by a group of UNIT objects within the simulator, and can be transported by a carrier.
Use the event functions as described above to Load, UnLoad, Board, UnBoard the AI_CARGO_UNIT objects to and from carriers.

This module is still under construction, but is described above works already, and will keep working ...

## AI_CARGO Class
<pre>
Inheritance : The AI_CARGO Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_CARGO
</pre>
<h4> Attributes </h4>

* <u>String</u> Type : A string defining the type of the cargo. eg. Engineers, Equipment, Screwdrivers.
* <u>String</u> Name : A string defining the name of the cargo. The name is the unique identifier of the cargo.
* <u>Number</u> Weight : A number defining the weight of the cargo. The weight is expressed in kg.
* <u>Number</u> ReportRadius : (optional) A number defining the radius in meters when the cargo is signalling or reporting to a Carrier.
* <u>Number</u> NearRadius : (optional) A number defining the radius in meters when the cargo is near to a Carrier, so that it can be loaded.
* [CONTROLLABLE](#controllable-class) CargoObject : The alive DCS object representing the cargo. This value can be nil, meaning, that the cargo is not represented anywhere...
* [CONTROLLABLE](#controllable-class) CargoCarrier : The alive DCS object carrying the cargo. This value can be nil, meaning, that the cargo is not contained anywhere...
* <u>Boolean</u> Slingloadable : This flag defines if the cargo can be slingloaded.
* <u>Boolean</u> Moveable : This flag defines if the cargo is moveable.
* <u>Boolean</u> Representable : This flag defines if the cargo can be represented by a DCS Unit.
* <u>Boolean</u> Containable : This flag defines if the cargo can be contained within a DCS Unit.


### AI_CARGO:Board(ToCarrier)
Boards the cargo to a Carrier. The event will create a movement (= running or driving) of the cargo to the Carrier.
The cargo must be in the **UnLoaded** state.

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) ToCarrier : The Carrier that will hold the cargo.

<h4> Returns </h4>

### AI_CARGO:UnBoard(ToPointVec2)
UnBoards the cargo to a Carrier. The event will create a movement (= running or driving) of the cargo from the Carrier.
The cargo must be in the **Loaded** state.

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2 : (optional) @{Point#POINT_VEC2) to where the cargo should run after onboarding. If not provided, the cargo will run to 60 meters behind the Carrier location.

<h4> Returns </h4>

### AI_CARGO:Load(ToCarrier)
Loads the cargo to a Carrier. The event will load the cargo into the Carrier regardless of its position. There will be no movement simulated of the cargo loading.
The cargo must be in the **UnLoaded** state.

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) ToCarrier : The Carrier that will hold the cargo.

<h4> Returns </h4>

### AI_CARGO:UnLoad(ToPointVec2)
UnLoads the cargo to a Carrier. The event will unload the cargo from the Carrier. There will be no movement simulated of the cargo loading.
The cargo must be in the **Loaded** state.

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2 : (optional) @{Point#POINT_VEC2) to where the cargo will be placed after unloading. If not provided, the cargo will be placed 60 meters behind the Carrier location.

<h4> Returns </h4>

### AI_CARGO:OnLeaveUnLoaded(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### AI_CARGO:OnEnterUnLoaded(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### AI_CARGO:OnLeaveLoaded(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### AI_CARGO:OnEnterLoaded(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### AI_CARGO:OnLeaveBoarding(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### AI_CARGO:OnEnterBoarding(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### AI_CARGO:OnLeaveUnBoarding(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>
* <u>Boolean</u> self


### AI_CARGO:OnEnterUnBoarding(Controllable)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [CONTROLLABLE](#controllable-class) Controllable

<h4> Returns </h4>

### AI_CARGO:New(Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [AI_CARGO](#ai_cargo-class)
self


### AI_CARGO:Spawn()

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self

<h4> Returns </h4>
* [AI_CARGO](#ai_cargo-class)
self


### AI_CARGO:IsNear(PointVec2)

<h4> Parameters </h4>
* [AI_CARGO](#ai_cargo-class)
self
* [POINT_VEC2](#point_vec2-class) PointVec2

<h4> Returns </h4>
* <u>Boolean</u> self


## AI_CARGO.CargoObjects Class
<pre>
**The AI_CARGO.CargoObjects class does not inherit**
</pre>

## AI_CARGO_REPRESENTABLE Class
<pre>
Inheritance : The AI_CARGO_REPRESENTABLE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_CARGO
					`-- AI_CARGO_REPRESENTABLE
</pre>

### AI_CARGO_REPRESENTABLE:New(CargoObject, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [AI_CARGO_REPRESENTABLE](#ai_cargo_representable-class)
self
* [Controllable](#controllable-class) CargoObject
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [AI_CARGO_REPRESENTABLE](#ai_cargo_representable-class)
self


### AI_CARGO_REPRESENTABLE:RouteTo(ToPointVec2, Speed)

<h4> Parameters </h4>
* [AI_CARGO_REPRESENTABLE](#ai_cargo_representable-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>Number</u> Speed

<h4> Returns </h4>
* [AI_CARGO_REPRESENTABLE](#ai_cargo_representable-class)
self


## AI_CARGO_UNIT Class
<pre>
Inheritance : The AI_CARGO_UNIT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_CARGO
					`-- AI_CARGO_REPRESENTABLE
						`-- AI_CARGO_UNIT
</pre>

### AI_CARGO_UNIT:New(CargoUnit, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* [UNIT](#unit-class) CargoUnit
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self


### AI_CARGO_UNIT:onenterUnBoarding(Event, From, To, ToPointVec2)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) ToPointVec2

<h4> Returns </h4>

### AI_CARGO_UNIT:onleaveUnBoarding(Event, From, To, ToPointVec2)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) ToPointVec2

<h4> Returns </h4>

### AI_CARGO_UNIT:onafterUnBoarding(Event, From, To, ToPointVec2)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) ToPointVec2

<h4> Returns </h4>

### AI_CARGO_UNIT:onenterUnLoaded(Event, From, To, self)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [POINT_VEC2](#point_vec2-class) self

<h4> Returns </h4>

### AI_CARGO_UNIT:onenterBoarding(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### AI_CARGO_UNIT:onleaveBoarding(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### AI_CARGO_UNIT:onenterLoaded(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### AI_CARGO_UNIT:onafterBoard(Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_UNIT](#ai_cargo_unit-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## AI_CARGO_PACKAGE Class
<pre>
Inheritance : The AI_CARGO_PACKAGE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_CARGO
					`-- AI_CARGO_REPRESENTABLE
						`-- AI_CARGO_PACKAGE
</pre>

### AI_CARGO_PACKAGE:New(CargoCarrier, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* [UNIT](#unit-class) CargoCarrier : The UNIT carrying the package.
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self


### AI_CARGO_PACKAGE:onafterOnBoard(Event, From, To, CargoCarrier, Speed, BoardDistance, Angle)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier
* <u>Number</u> Speed
* <u>Number</u> BoardDistance
* <u>Number</u> Angle

<h4> Returns </h4>

### AI_CARGO_PACKAGE:IsNear(CargoCarrier)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>
* <u>Boolean</u> self


### AI_CARGO_PACKAGE:onafterOnBoarded(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### AI_CARGO_PACKAGE:onafterUnBoard(Event, From, To, Speed, UnLoadDistance, UnBoardDistance, Radius, Angle)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
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

### AI_CARGO_PACKAGE:onafterUnBoarded(Event, From, To, CargoCarrier)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier

<h4> Returns </h4>

### AI_CARGO_PACKAGE:onafterLoad(Event, From, To, CargoCarrier, Speed, LoadDistance, Angle)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* [UNIT](#unit-class) CargoCarrier
* <u>Number</u> Speed
* <u>Number</u> LoadDistance
* <u>Number</u> Angle

<h4> Returns </h4>

### AI_CARGO_PACKAGE:onafterUnLoad(Event, From, To, Distance, Angle)

<h4> Parameters </h4>
* [AI_CARGO_PACKAGE](#ai_cargo_package-class)
self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To
* <u>Number</u> Distance
* <u>Number</u> Angle

<h4> Returns </h4>

## AI_CARGO_GROUP Class
<pre>
Inheritance : The AI_CARGO_GROUP Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_CARGO
					`-- AI_CARGO_GROUP
</pre>
<h4> Attributes </h4>

* [SET_BASE](#set_base-class) CargoSet : A set of cargo objects.
* <u>String</u> Name : A string defining the name of the cargo group. The name is the unique identifier of the cargo.


### AI_CARGO_GROUP:New(CargoSet, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [AI_CARGO_GROUP](#ai_cargo_group-class)
self
* [Set_BASE](#set_base-class) CargoSet
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [AI_CARGO_GROUP](#ai_cargo_group-class)
self


## AI_CARGO_GROUPED Class
<pre>
Inheritance : The AI_CARGO_GROUPED Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- AI_CARGO
					`-- AI_CARGO_GROUP
						`-- AI_CARGO_GROUPED
</pre>

### AI_CARGO_GROUPED:New(CargoSet, Type, Name, Weight, ReportRadius, NearRadius)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [Set_BASE](#set_base-class) CargoSet
* <u>String</u> Type
* <u>String</u> Name
* <u>Number</u> Weight
* <u>Number</u> ReportRadius : (optional)
* <u>Number</u> NearRadius : (optional)

<h4> Returns </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self


### AI_CARGO_GROUPED:onenterBoarding(CargoCarrier, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [UNIT](#unit-class) CargoCarrier
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### AI_CARGO_GROUPED:onenterLoaded(CargoCarrier, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [UNIT](#unit-class) CargoCarrier
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### AI_CARGO_GROUPED:onleaveBoarding(CargoCarrier, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [UNIT](#unit-class) CargoCarrier
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### AI_CARGO_GROUPED:onenterUnBoarding(ToPointVec2, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### AI_CARGO_GROUPED:onleaveUnBoarding(ToPointVec2, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### AI_CARGO_GROUPED:onafterUnBoarding(ToPointVec2, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [POINT_VEC2](#point_vec2-class) ToPointVec2
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### AI_CARGO_GROUPED:onenterUnLoaded(self, Event, From, To)

<h4> Parameters </h4>
* [AI_CARGO_GROUPED](#ai_cargo_grouped-class)
self
* [POINT_VEC2](#point_vec2-class) self
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

