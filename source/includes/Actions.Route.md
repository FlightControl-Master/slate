# Actions.Route Module
(SP) (MP) (FSM) Route AI or players through waypoints or to zones.



#####  [ACT_ROUTE](#act_route-class) FSM class, extends [FSM_PROCESS](#fsm_process-class)

#####  ACT_ROUTE state machine:

This class is a state machine: it manages a process that is triggered by events causing state transitions to occur.
All derived classes from this class will start with the class name, followed by a \_. See the relevant derived class descriptions below.
Each derived class follows exactly the same process, using the same events and following the same state transitions,
but will have **different implementation behaviour** upon each event or state transition.

#####  ACT_ROUTE **Events**:

These are the events defined in this class:

* **Start**:  The process is started. The process will go into the Report state.
* **Report**: The process is reporting to the player the route to be followed.
* **Route**: The process is routing the controllable.
* **Pause**: The process is pausing the route of the controllable.
* **Arrive**: The controllable has arrived at a route point.
* **More**:  There are more route points that need to be followed. The process will go back into the Report state.
* **NoMore**:  There are no more route points that need to be followed. The process will go into the Success state.

#####  ACT_ROUTE **Event methods**:

Event methods are available (dynamically allocated by the state machine), that accomodate for state transitions occurring in the process.
There are two types of event methods, which you can use to influence the normal mechanisms in the state machine:

* **Immediate**: The event method has exactly the name of the event.
* **Delayed**: The event method starts with a __ + the name of the event. The first parameter of the event method is a number value, expressing the delay in seconds when the event will be executed.

#####  ACT_ROUTE **States**:

* **None**: The controllable did not receive route commands.
* **Arrived (*)**: The controllable has arrived at a route point.
* **Aborted (*)**: The controllable has aborted the route path.
* **Routing**: The controllable is understay to the route point.
* **Pausing**: The process is pausing the routing. AI air will go into hover, AI ground will stop moving. Players can fly around.
* **Success (*)**: All route points were reached.
* **Failed (*)**: The process has failed.

(*) End states of the process.

#####  ACT_ROUTE state transition methods:

State transition functions can be set **by the mission designer** customizing or improving the behaviour of the state.
There are 2 moments when state transition methods will be called by the state machine:

* **Before** the state transition.
The state transition method needs to start with the name **OnBefore + the name of the state**.
If the state transition method returns false, then the processing of the state transition will not be done!
If you want to change the behaviour of the AIControllable at this event, return false,
but then you'll need to specify your own logic using the AIControllable!

* **After** the state transition.
The state transition method needs to start with the name **OnAfter + the name of the state**.
These state transition methods need to provide a return value, which is specified at the function description.



#####  1) [ACT_ROUTE_ZONE](#act_route_zone-class) class, extends [ACT_ROUTE](#act_route-class)

The ACT_ROUTE_ZONE class implements the core functions to route an AIR [Controllable](#controllable-module) player [Unit](#unit-module) to a [Zone](#zone-module).
The player receives on perioding times messages with the coordinates of the route to follow.
Upon arrival at the zone, a confirmation of arrival is sent, and the process will be ended.

#####  1.1) ACT_ROUTE_ZONE constructor:

* [ACT_ROUTE_ZONE:New()](#act_route_zone-new-zone): Creates a new ACT_ROUTE_ZONE object.



## ACT_ROUTE Class
<pre>
Inheritance : The ACT_ROUTE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ROUTE
</pre>

<h4> Attributes </h4>

* [TASK](#task-class) TASK
* [UNIT](#unit-class) ProcessUnit
* [ZONE_BASE](#zone_base-class) Zone


### ACT_ROUTE:New()

<h4> Parameters </h4>
* [ACT_ROUTE](#act_route-class)
self

<h4> Returns </h4>
* [ACT_ROUTE](#act_route-class)
self


### ACT_ROUTE:onafterStart(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ROUTE](#act_route-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ROUTE:onfuncHasArrived(ProcessUnit)

<h4> Parameters </h4>
* [ACT_ROUTE](#act_route-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit

<h4> Returns </h4>
* <u>Boolean</u> self


### ACT_ROUTE:onbeforeRoute(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ROUTE](#act_route-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## ACT_ROUTE_POINT Class
<pre>
Inheritance : The ACT_ROUTE_POINT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ROUTE
					`-- ACT_ROUTE_POINT
</pre>

<h4> Attributes </h4>

* [TASK](#task-class) TASK


### ACT_ROUTE_POINT:New(The, Range, Zone)

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self
* [POINT_VEC2](#point_vec2-class) The : PointVec2 to Target.
* <u>Number</u> Range : The Distance to Target.
* [ZONE_BASE](#zone_base-class) Zone

<h4> Returns </h4>

### ACT_ROUTE_POINT:SetPointVec2(PointVec2)

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self
* [POINT_VEC2](#point_vec2-class) PointVec2 : The PointVec2 to route to.

<h4> Returns </h4>

### ACT_ROUTE_POINT:GetPointVec2()

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self

<h4> Returns </h4>
* [POINT_VEC2](#point_vec2-class) PointVec2 : The PointVec2 to route to.


### ACT_ROUTE_POINT:SetRange(Range)

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self
* <u>Number</u> Range : The Range to consider the arrival. Default is 10000 meters.

<h4> Returns </h4>

### ACT_ROUTE_POINT:GetRange()

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self

<h4> Returns </h4>
* <u>Number</u> The : Range to consider the arrival. Default is 10000 meters.


### ACT_ROUTE_POINT:onfuncHasArrived(ProcessUnit)

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit

<h4> Returns </h4>
* <u>Boolean</u> self


### ACT_ROUTE_POINT:onenterReporting(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ROUTE_POINT](#act_route_point-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## ACT_ROUTE_ZONE Class
<pre>
Inheritance : The ACT_ROUTE_ZONE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ROUTE
					`-- ACT_ROUTE_ZONE
</pre>

<h4> Attributes </h4>

* [TASK](#task-class) TASK
* [UNIT](#unit-class) ProcessUnit
* [ZONE_BASE](#zone_base-class) Zone


### ACT_ROUTE_ZONE:New(Zone)

<h4> Parameters </h4>
* [ACT_ROUTE_ZONE](#act_route_zone-class)
self
* [ZONE_BASE](#zone_base-class) Zone

<h4> Returns </h4>

### ACT_ROUTE_ZONE:SetZone(Zone)

<h4> Parameters </h4>
* [ACT_ROUTE_ZONE](#act_route_zone-class)
self
* [ZONE_BASE](#zone_base-class) Zone : The Zone object where to route to.

<h4> Returns </h4>

### ACT_ROUTE_ZONE:GetZone()

<h4> Parameters </h4>
* [ACT_ROUTE_ZONE](#act_route_zone-class)
self

<h4> Returns </h4>
* [ZONE_BASE](#zone_base-class) Zone : The Zone object where to route to.


### ACT_ROUTE_ZONE:onfuncHasArrived(ProcessUnit)

<h4> Parameters </h4>
* [ACT_ROUTE](#act_route-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit

<h4> Returns </h4>
* <u>Boolean</u> self


### ACT_ROUTE_ZONE:onenterReporting(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ROUTE_ZONE](#act_route_zone-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

