# Core.Fsm Module
**Core** - The **FSM** (**F**inite **S**tate **M**achine) class and derived **FSM\_** classes
are design patterns allowing efficient (long-lasting) processes and workflows.

![Banner Image](/includes/Pictures/FSM/Dia1.JPG)



A Finite State Machine (FSM) models a process flow that transitions between various **States** through triggered **Events**.

A FSM can only be in one of a finite number of states.
The machine is in only one state at a time; the state it is in at any given time is called the **current state**.
It can change from one state to another when initiated by an **__internal__ or __external__ triggering event**, which is called a **transition**.
An **FSM implementation** is defined by **a list of its states**, **its initial state**, and **the triggering events** for **each possible transition**.
An FSM implementation is composed out of **two parts**, a set of **state transition rules**, and an implementation set of **state transition handlers**, implementing those transitions.

The FSM class supports a **hierarchical implementation of a Finite State Machine**,
that is, it allows to **embed existing FSM implementations in a master FSM**.
FSM hierarchies allow for efficient FSM re-use, **not having to re-invent the wheel every time again** when designing complex processes.

![Workflow Example](/includes/Pictures/FSM/Dia2.JPG)

The above diagram shows a graphical representation of a FSM implementation for a **Task**, which guides a Human towards a Zone,
orders him to destroy x targets and account the results.
Other examples of ready made FSM could be:

* route a plane to a zone flown by a human
* detect targets by an AI and report to humans
* account for destroyed targets by human players
* handle AI infantry to deploy from or embark to a helicopter or airplane or vehicle
* let an AI patrol a zone

The **MOOSE framework** uses extensively the FSM class and derived FSM\_ classes,
because **the goal of MOOSE is to simplify mission design complexity for mission building**.
By efficiently utilizing the FSM class and derived classes, MOOSE allows mission designers to quickly build processes.
**Ready made FSM-based implementations classes** exist within the MOOSE framework that **can easily be re-used,
and tailored** by mission designers through **the implementation of Transition Handlers**.
Each of these FSM implementation classes start either with:

* an acronym **AI\_**, which indicates an FSM implementation directing **AI controlled** [GROUP](#group-module-) and/or [UNIT](#unit-module-). These AI\_ classes derive the [FSM_CONTROLLABLE](#fsm_controllable-class-) class.
* an acronym **TASK\_**, which indicates an FSM implementation executing a [TASK](#task-module-) executed by Groups of players. These TASK\_ classes derive the [FSM_TASK](#fsm_task-class-) class.
* an acronym **ACT\_**, which indicates an Sub-FSM implementation, directing **Humans actions** that need to be done in a [TASK](#task-module-), seated in a [CLIENT](#client-module-) (slot) or a [UNIT](#unit-module-) (CA join). These ACT\_ classes derive the [FSM_PROCESS](#fsm_process-class-) class.

Detailed explanations and API specifics are further below clarified and FSM derived class specifics are described in those class documentation sections.

##### __Dislaimer:__
The FSM class development is based on a finite state machine implementation made by Conroy Kyle.
The state machine can be found on [github](https://github.com/kyleconroy/lua-state-machine)
I've reworked this development (taken the concept), and created a **hierarchical state machine** out of it, embedded within the DCS simulator.
Additionally, I've added extendability and created an API that allows seamless FSM implementation.

The following derived classes are available in the MOOSE framework, that implement a specialised form of a FSM:

* [FSM_TASK](#fsm_task-class-): Models Finite State Machines for [Task](#task-module-)s.
* [FSM_PROCESS](#fsm_process-class-): Models Finite State Machines for [Task](#task-module-) actions, which control [Client](#client-module-)s.
* [FSM_CONTROLLABLE](#fsm_controllable-class-): Models Finite State Machines for [Controllable](#controllable-module-)s, which are [Group](#group-module-)s, [Unit](#unit-module-)s, [Client](#client-module-)s.
* [FSM_SET](#fsm_set-class-): Models Finite State Machines for [Set](#set-module-)s. Note that these FSMs control multiple objects!!! So State concerns here
for multiple objects or the position of the state machine in the process.



#####  **API CHANGE HISTORY**

The underlying change log documents the API changes. Please read this carefully. The following notation is used:

* **Added** parts are expressed in bold type face.
* _Removed_ parts are expressed in italic type face.

YYYY-MM-DD: CLASS:**NewFunction**( Params ) replaces CLASS:_OldFunction_( Params )
YYYY-MM-DD: CLASS:**NewFunction( Params )** added

Hereby the change log:

* 2016-12-18: Released.



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

* [**Pikey**](https://forums.eagle.ru/member.php?u=62835): Review of documentation & advice for improvements.

#####  Authors:

* [**FlightControl**](https://forums.eagle.ru/member.php?u=89536): Design & Programming & documentation.

## FSM Class
<pre>
Inheritance : The FSM Class inherits from the following parents :
BASE
	`-- FSM
</pre>

A Finite State Machine (FSM) models a process flow that transitions between various **States** through triggered **Events**.

A FSM can only be in one of a finite number of states.
The machine is in only one state at a time; the state it is in at any given time is called the **current state**.
It can change from one state to another when initiated by an **__internal__ or __external__ triggering event**, which is called a **transition**.
An **FSM implementation** is defined by **a list of its states**, **its initial state**, and **the triggering events** for **each possible transition**.
An FSM implementation is composed out of **two parts**, a set of **state transition rules**, and an implementation set of **state transition handlers**, implementing those transitions.

The FSM class supports a **hierarchical implementation of a Finite State Machine**,
that is, it allows to **embed existing FSM implementations in a master FSM**.
FSM hierarchies allow for efficient FSM re-use, **not having to re-invent the wheel every time again** when designing complex processes.

![Workflow Example](/includes/Pictures/FSM/Dia2.JPG)

The above diagram shows a graphical representation of a FSM implementation for a **Task**, which guides a Human towards a Zone,
orders him to destroy x targets and account the results.
Other examples of ready made FSM could be:

* route a plane to a zone flown by a human
* detect targets by an AI and report to humans
* account for destroyed targets by human players
* handle AI infantry to deploy from or embark to a helicopter or airplane or vehicle
* let an AI patrol a zone

The **MOOSE framework** uses extensively the FSM class and derived FSM\_ classes,
because **the goal of MOOSE is to simplify mission design complexity for mission building**.
By efficiently utilizing the FSM class and derived classes, MOOSE allows mission designers to quickly build processes.
**Ready made FSM-based implementations classes** exist within the MOOSE framework that **can easily be re-used,
and tailored** by mission designers through **the implementation of Transition Handlers**.
Each of these FSM implementation classes start either with:

* an acronym **AI\_**, which indicates an FSM implementation directing **AI controlled** [GROUP](#group-module-) and/or [UNIT](#unit-module-). These AI\_ classes derive the [FSM_CONTROLLABLE](#fsm_controllable-class-) class.
* an acronym **TASK\_**, which indicates an FSM implementation executing a [TASK](#task-module-) executed by Groups of players. These TASK\_ classes derive the [FSM_TASK](#fsm_task-class-) class.
* an acronym **ACT\_**, which indicates an Sub-FSM implementation, directing **Humans actions** that need to be done in a [TASK](#task-module-), seated in a [CLIENT](#client-module-) (slot) or a [UNIT](#unit-module-) (CA join). These ACT\_ classes derive the [FSM_PROCESS](#fsm_process-class-) class.

![Transition Rules and Transition Handlers and Event Triggers](/includes/Pictures/FSM/Dia3.JPG)

The FSM class is the base class of all FSM\_ derived classes. It implements the main functionality to define and execute Finite State Machines.
The derived FSM\_ classes extend the Finite State Machine functionality to run a workflow process for a specific purpose or component.

Finite State Machines have **Transition Rules**, **Transition Handlers** and **Event Triggers**.

The **Transition Rules** define the "Process Flow Boundaries", that is,
the path that can be followed hopping from state to state upon triggered events.
If an event is triggered, and there is no valid path found for that event,
an error will be raised and the FSM will stop functioning.

The **Transition Handlers** are special methods that can be defined by the mission designer, following a defined syntax.
If the FSM object finds a method of such a handler, then the method will be called by the FSM, passing specific parameters.
The method can then define its own custom logic to implement the FSM workflow, and to conduct other actions.

The **Event Triggers** are methods that are defined by the FSM, which the mission designer can use to implement the workflow.
Most of the time, these Event Triggers are used within the Transition Handler methods, so that a workflow is created running through the state machine.

As explained above, a FSM supports **Linear State Transitions** and **Hierarchical State Transitions**, and both can be mixed to make a comprehensive FSM implementation.
The below documentation has a seperate chapter explaining both transition modes, taking into account the **Transition Rules**, **Transition Handlers** and **Event Triggers**.

#####  FSM Linear Transitions

Linear Transitions are Transition Rules allowing an FSM to transition from one or multiple possible **From** state(s) towards a **To** state upon a Triggered **Event**.
The Lineair transition rule evaluation will always be done from the **current state** of the FSM.
If no valid Transition Rule can be found in the FSM, the FSM will log an error and stop.

#####  FSM Transition Rules

The FSM has transition rules that it follows and validates, as it walks the process.
These rules define when an FSM can transition from a specific state towards an other specific state upon a triggered event.

The method [FSM:AddTransition()](#fsm-addtransition-from-event-to) specifies a new possible Transition Rule for the FSM.

The initial state can be defined using the method [FSM:SetStartState()](#fsm-setstartstate-state). The default start state of an FSM is "None".

Find below an example of a Linear Transition Rule definition for an FSM.

local Fsm3Switch = FSM:New() -- #FsmDemo
FsmSwitch:SetStartState( "Off" )
FsmSwitch:AddTransition( "Off", "SwitchOn", "On" )
FsmSwitch:AddTransition( "Off", "SwitchMiddle", "Middle" )
FsmSwitch:AddTransition( "On", "SwitchOff", "Off" )
FsmSwitch:AddTransition( "Middle", "SwitchOff", "Off" )

The above code snippet models a 3-way switch Linear Transition:

* It can be switched **On** by triggering event **SwitchOn**.
* It can be switched to the **Middle** position, by triggering event **SwitchMiddle**.
* It can be switched **Off** by triggering event **SwitchOff**.
* Note that once the Switch is **On** or **Middle**, it can only be switched **Off**.

#####  Some additional comments:

Note that Linear Transition Rules **can be declared in a few variations**:

* The From states can be **a table of strings**, indicating that the transition rule will be valid **if the current state** of the FSM will be **one of the given From states**.
* The From state can be a **"*"**, indicating that **the transition rule will always be valid**, regardless of the current state of the FSM.

The below code snippet shows how the two last lines can be rewritten and consensed.

FsmSwitch:AddTransition( { "On",  "Middle" }, "SwitchOff", "Off" )

#####  Transition Handling

![Transition Handlers](/includes/Pictures/FSM/Dia4.JPG)

An FSM transitions in **4 moments** when an Event is being triggered and processed.
The mission designer can define for each moment specific logic within methods implementations following a defined API syntax.
These methods define the flow of the FSM process; because in those methods the FSM Internal Events will be triggered.

* To handle **State** transition moments, create methods starting with OnLeave or OnEnter concatenated with the State name.
* To handle **Event** transition moments, create methods starting with OnBefore or OnAfter concatenated with the Event name.

**The OnLeave and OnBefore transition methods may return false, which will cancel the transition!**

Transition Handler methods need to follow the above specified naming convention, but are also passed parameters from the FSM.
These parameters are on the correct order: From, Event, To:

* From = A string containing the From state.
* Event = A string containing the Event name that was triggered.
* To = A string containing the To state.

On top, each of these methods can have a variable amount of parameters passed. See the example in section [1.1.3](#1.1.3\)-event-triggers).

#####  Event Triggers

![Event Triggers](/includes/Pictures/FSM/Dia5.JPG)

The FSM creates for each Event two **Event Trigger methods**.
There are two modes how Events can be triggered, which is **synchronous** and **asynchronous**:

* The method **FSM:Event()** triggers an Event that will be processed **synchronously** or **immediately**.
* The method **FSM:__Event( __seconds__ )** triggers an Event that will be processed **asynchronously** over time, waiting __x seconds__.

The destinction between these 2 Event Trigger methods are important to understand. An asynchronous call will "log" the Event Trigger to be executed at a later time.
Processing will just continue. Synchronous Event Trigger methods are useful to change states of the FSM immediately, but may have a larger processing impact.

The following example provides a little demonstration on the difference between synchronous and asynchronous Event Triggering.

function FSM:OnAfterEvent( From, Event, To, Amount )
self:T( { Amount = Amount } )
end

local Amount = 1
FSM:__Event( 5, Amount )

Amount = Amount + 1
FSM:Event( Text, Amount )

In this example, the **:OnAfterEvent**() Transition Handler implementation will get called when **Event** is being triggered.
Before we go into more detail, let's look at the last 4 lines of the example.
The last line triggers synchronously the **Event**, and passes Amount as a parameter.
The 3rd last line of the example triggers asynchronously **Event**.
Event will be processed after 5 seconds, and Amount is given as a parameter.

The output of this little code fragment will be:

* Amount = 2
* Amount = 2

Because ... When Event was asynchronously processed after 5 seconds, Amount was set to 2. So be careful when processing and passing values and objects in asynchronous processing!

#####  Linear Transition Example

This example is fully implemented in the MOOSE test mission on GITHUB: [FSM-100 - Transition Explanation](https://github.com/FlightControl-Master/MOOSE/blob/master/Moose%20Test%20Missions/FSM%20-%20Finite%20State%20Machine/FSM-100%20-%20Transition%20Explanation/FSM-100%20-%20Transition%20Explanation.lua)

It models a unit standing still near Batumi, and flaring every 5 seconds while switching between a Green flare and a Red flare.
The purpose of this example is not to show how exciting flaring is, but it demonstrates how a Linear Transition FSM can be build.
Have a look at the source code. The source code is also further explained below in this section.

The example creates a new FsmDemo object from class FSM.
It will set the start state of FsmDemo to state **Green**.
Two Linear Transition Rules are created, where upon the event **Switch**,
the FsmDemo will transition from state **Green** to **Red** and from **Red** back to **Green**.

![Transition Example](/includes/Pictures/FSM/Dia6.JPG)

local FsmDemo = FSM:New() -- #FsmDemo
FsmDemo:SetStartState( "Green" )
FsmDemo:AddTransition( "Green", "Switch", "Red" )
FsmDemo:AddTransition( "Red", "Switch", "Green" )

In the above example, the FsmDemo could flare every 5 seconds a Green or a Red flare into the air.
The next code implements this through the event handling method **OnAfterSwitch**.

![Transition Flow](/includes/Pictures/FSM/Dia7.JPG)

function FsmDemo:OnAfterSwitch( From, Event, To, FsmUnit )
self:T( { From, Event, To, FsmUnit } )

if From == "Green" then
FsmUnit:Flare(FLARECOLOR.Green)
else
if From == "Red" then
FsmUnit:Flare(FLARECOLOR.Red)
end
end
self:__Switch( 5, FsmUnit ) -- Trigger the next Switch event to happen in 5 seconds.
end

FsmDemo:__Switch( 5, FsmUnit ) -- Trigger the first Switch event to happen in 5 seconds.

The OnAfterSwitch implements a loop. The last line of the code fragment triggers the Switch Event within 5 seconds.
Upon the event execution (after 5 seconds), the OnAfterSwitch method is called of FsmDemo (cfr. the double point notation!!! ":").
The OnAfterSwitch method receives from the FSM the 3 transition parameter details ( From, Event, To ),
and one additional parameter that was given when the event was triggered, which is in this case the Unit that is used within OnSwitchAfter.

function FsmDemo:OnAfterSwitch( From, Event, To, FsmUnit )

For debugging reasons the received parameters are traced within the DCS.log.

self:T( { From, Event, To, FsmUnit } )

The method will check if the From state received is either "Green" or "Red" and will flare the respective color from the FsmUnit.

if From == "Green" then
FsmUnit:Flare(FLARECOLOR.Green)
else
if From == "Red" then
FsmUnit:Flare(FLARECOLOR.Red)
end
end

It is important that the Switch event is again triggered, otherwise, the FsmDemo would stop working after having the first Event being handled.

FsmDemo:__Switch( 5, FsmUnit ) -- Trigger the next Switch event to happen in 5 seconds.

The below code fragment extends the FsmDemo, demonstrating multiple **From states declared as a table**, adding a **Linear Transition Rule**.
The new event **Stop** will cancel the Switching process.
The transition for event Stop can be executed if the current state of the FSM is either "Red" or "Green".

local FsmDemo = FSM:New() -- #FsmDemo
FsmDemo:SetStartState( "Green" )
FsmDemo:AddTransition( "Green", "Switch", "Red" )
FsmDemo:AddTransition( "Red", "Switch", "Green" )
FsmDemo:AddTransition( { "Red", "Green" }, "Stop", "Stopped" )

The transition for event Stop can also be simplified, as any current state of the FSM is valid.

FsmDemo:AddTransition( "*", "Stop", "Stopped" )

So... When FsmDemo:Stop() is being triggered, the state of FsmDemo will transition from Red or Green to Stopped.
And there is no transition handling method defined for that transition, thus, no new event is being triggered causing the FsmDemo process flow to halt.

#####  FSM Hierarchical Transitions

Hierarchical Transitions allow to re-use readily available and implemented FSMs.
This becomes in very useful for mission building, where mission designers build complex processes and workflows,
combining smaller FSMs to one single FSM.

The FSM can embed **Sub-FSMs** that will execute and return **multiple possible Return (End) States**.
Depending upon **which state is returned**, the main FSM can continue the flow **triggering specific events**.

The method [FSM:AddProcess()](#fsm-addprocess-from-event-process-returnevents) adds a new Sub-FSM to the FSM.







### FSM:New()

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self

<h4> Returns </h4>
* [FSM](#fsm-class-)



### FSM:SetStartState(State)

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self
* <u>String</u> State : A string defining the start state.

<h4> Returns </h4>

### FSM:GetStartState()

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self

<h4> Returns </h4>
* <u>String</u>  A string containing the start state.


### FSM:AddTransition(From, Event, To)

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self
* <u>List[]</u> From : Can contain a string indicating the From state or a table of strings containing multiple From states.
* <u>String</u> Event : The Event name.
* <u>String</u> To : The To state.

<h4> Returns </h4>

### FSM.GetTransitions(()

<h4> Parameters </h4>
<h4> Returns </h4>
* <u>List[]</u> 


### FSM:AddProcess(From, Event, Process, ReturnEvents)

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self
* <u>List[]</u> From : Can contain a string indicating the From state or a table of strings containing multiple From states.
* <u>String</u> Event : The Event name.
* [FSM_PROCESS](#fsm_process-class-) Process : An sub-process FSM.
* <u>List[]</u> ReturnEvents : A table indicating for which returned events of the SubFSM which Event must be triggered in the FSM.

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-)  The SubFSM.


### FSM.GetProcesses(()

<h4> Parameters </h4>
<h4> Returns </h4>
* <u>List[]</u> 


### FSM.AddEndState(()

<h4> Parameters </h4>
<h4> Returns </h4>

### FSM.GetEndStates(()

<h4> Parameters </h4>
<h4> Returns </h4>

### FSM:AddScore(State, ScoreText, Score)

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self
* <u>String</u> State : is the state of the process when the score needs to be given. (See the relevant state descriptions of the process).
* <u>String</u> ScoreText : is a text describing the score that is given according the status.
* <u>Number</u> Score : is a number providing the score of the status.

<h4> Returns </h4>
* [FSM](#fsm-class-)



### FSM:AddScoreProcess(From, Event, State, ScoreText, Score)

<h4> Parameters </h4>
* [FSM](#fsm-class-)
self
* <u>String</u> From : is the From State of the main process.
* <u>String</u> Event : is the Event of the main process.
* <u>String</u> State : is the state of the process when the score needs to be given. (See the relevant state descriptions of the process).
* <u>String</u> ScoreText : is a text describing the score that is given according the status.
* <u>Number</u> Score : is a number providing the score of the status.

<h4> Returns </h4>
* [FSM](#fsm-class-)



### FSM.GetScores(()

<h4> Parameters </h4>
<h4> Returns </h4>

### FSM.GetSubs(()

<h4> Parameters </h4>
<h4> Returns </h4>

## FSM_CONTROLLABLE Class
<pre>
Inheritance : The FSM_CONTROLLABLE Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
</pre>

FSM_CONTROLLABLE class models Finite State Machines for [Controllable](#controllable-module-)s, which are [Group](#group-module-)s, [Unit](#unit-module-)s, [Client](#client-module-)s.






<h4> Attributes </h4>

* [CONTROLLABLE](#controllable-class-) Controllable


### FSM_CONTROLLABLE:New(FSMT, Controllable)

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* <u>List[]</u> FSMT : Finite State Machine Table
* [CONTROLLABLE](#controllable-class-) Controllable : (optional) The CONTROLLABLE object that the FSM_CONTROLLABLE governs.

<h4> Returns </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)



### FSM_CONTROLLABLE:OnBeforeStop(Controllable, From, Event, To)
OnBefore Transition Handler for Event Stop.

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### FSM_CONTROLLABLE:OnAfterStop(Controllable, From, Event, To)
OnAfter Transition Handler for Event Stop.

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### FSM_CONTROLLABLE:Stop()
Synchronous Event Trigger for Event Stop.

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self

<h4> Returns </h4>

### FSM_CONTROLLABLE:OnLeaveStopped(Controllable, From, Event, To)
OnLeave Transition Handler for State Stopped.

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>
* <u>Boolean</u>  Return false to cancel Transition.


### FSM_CONTROLLABLE:OnEnterStopped(Controllable, From, Event, To)
OnEnter Transition Handler for State Stopped.

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### FSM_CONTROLLABLE:OnAfterStop(Controllable, From, Event, To)
OnAfter Transition Handler for Event Stop.

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) Controllable : The Controllable Object managed by the FSM.
* <u>String</u> From : The From State string.
* <u>String</u> Event : The Event string.
* <u>String</u> To : The To State string.

<h4> Returns </h4>

### FSM_CONTROLLABLE:SetControllable(FSMControllable)

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self
* [CONTROLLABLE](#controllable-class-) FSMControllable

<h4> Returns </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)



### FSM_CONTROLLABLE:GetControllable()

<h4> Parameters </h4>
* [FSM_CONTROLLABLE](#fsm_controllable-class-)
self

<h4> Returns </h4>
* [CONTROLLABLE](#controllable-class-) 


## FSM_PROCESS Class
<pre>
Inheritance : The FSM_PROCESS Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
</pre>

FSM_PROCESS class models Finite State Machines for [Task](#task-module-) actions, which control [Client](#client-module-)s.






<h4> Attributes </h4>

* [TASK](#task-class-) Task


### FSM_PROCESS:New()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-)



### FSM_PROCESS:Copy()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-)



### FSM_PROCESS:Remove()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-)



### FSM_PROCESS:SetTask(Task)

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self
* [TASK](#task-class-) Task

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-)



### FSM_PROCESS:GetTask()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>
* [TASK](#task-class-) 


### FSM_PROCESS:GetMission()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>
* [MISSION](#mission-class-) 


### FSM_PROCESS:GetCommandCenter()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>
* [COMMANDCENTER](#commandcenter-class-) 


### FSM_PROCESS:Message()

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self

<h4> Returns </h4>

### FSM_PROCESS:Assign(Task, ProcessUnit)

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self
* [TASK](#task-class-) Task
* [UNIT](#unit-class-) ProcessUnit

<h4> Returns </h4>
* [FSM_PROCESS](#fsm_process-class-)



### FSM_PROCESS:onstatechange(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [FSM_PROCESS](#fsm_process-class-)
self
* [CONTROLLABLE](#controllable-class-) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## FSM_TASK Class
<pre>
Inheritance : The FSM_TASK Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_TASK
</pre>

FSM_TASK class models Finite State Machines for [Task](#task-module-)s.





FSM_TASK class

<h4> Attributes </h4>

* [TASK](#task-class-) Task


### FSM_TASK:New(FSMT, Task, TaskUnit)

<h4> Parameters </h4>
* [FSM_TASK](#fsm_task-class-)
self
* <u>List[]</u> FSMT
* [TASK](#task-class-) Task
* [UNIT](#unit-class-) TaskUnit

<h4> Returns </h4>
* [FSM_TASK](#fsm_task-class-)



## FSM_SET Class
<pre>
Inheritance : The FSM_SET Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_SET
</pre>

FSM_SET class models Finite State Machines for [Set](#set-module-)s. Note that these FSMs control multiple objects!!! So State concerns here
for multiple objects or the position of the state machine in the process.





FSM_SET class

<h4> Attributes </h4>

* [SET_BASE](#set_base-class-) Set


### FSM_SET:New(FSMT, FSMSet)

<h4> Parameters </h4>
* [FSM_SET](#fsm_set-class-)
self
* <u>List[]</u> FSMT : Finite State Machine Table
* Set_SET_BASE FSMSet : (optional) The Set object that the FSM_SET governs.

<h4> Returns </h4>
* [FSM_SET](#fsm_set-class-)



### FSM_SET:Set(FSMSet)

<h4> Parameters </h4>
* [FSM_SET](#fsm_set-class-)
self
* [SET_BASE](#set_base-class-) FSMSet

<h4> Returns </h4>
* [FSM_SET](#fsm_set-class-)



### FSM_SET:Get()

<h4> Parameters </h4>
* [FSM_SET](#fsm_set-class-)
self

<h4> Returns </h4>
* [SET_BASE](#set_base-class-) 


