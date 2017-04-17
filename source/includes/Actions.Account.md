# Actions.Account Module
**Actions** - ACT_ACCOUNT_ classes **account for** (detect, count & report) various DCS events occuring on [Unit](#unit-module)s.

![Banner Image](/includes/Pictures/ACT_ACCOUNT/Dia1.JPG)



## ACT_ACCOUNT Class
<pre>
Inheritance : The ACT_ACCOUNT Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ACCOUNT
</pre>

#####  ACT_ACCOUNT state machine:

This class is a state machine: it manages a process that is triggered by events causing state transitions to occur.
All derived classes from this class will start with the class name, followed by a \_. See the relevant derived class descriptions below.
Each derived class follows exactly the same process, using the same events and following the same state transitions,
but will have **different implementation behaviour** upon each event or state transition.

#####  ACT_ACCOUNT States

* **Asigned**: The player is assigned.
* **Waiting**: Waiting for an event.
* **Report**: Reporting.
* **Account**: Account for an event.
* **Accounted**: All events have been accounted for, end of the process.
* **Failed**: Failed the process.

#####  ACT_ACCOUNT Events

* **Start**: Start the process.
* **Wait**: Wait for an event.
* **Report**: Report the status of the accounting.
* **Event**: An event happened, process the event.
* **More**: More targets.
* **NoMore (*)**: No more targets.
* **Fail (*)**: The action process has failed.

(*) End states of the process.

#####  ACT_ACCOUNT state transition methods:

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


<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) TargetSetUnit


### ACT_ACCOUNT:New()

<h4> Parameters </h4>
* [ACT_ACCOUNT](#act_account-class)
self

<h4> Returns </h4>
* [ACT_ACCOUNT](#act_account-class)
self


### ACT_ACCOUNT:onafterStart(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ACCOUNT](#act_account-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ACCOUNT:onenterWaiting(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ACCOUNT](#act_account-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ACCOUNT:onafterEvent(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ACCOUNT](#act_account-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

## ACT_ACCOUNT_DEADS Class
<pre>
Inheritance : The ACT_ACCOUNT_DEADS Class inherits from the following parents :
BASE
	`-- FSM
		`-- FSM_CONTROLLABLE
			`-- FSM_PROCESS
				`-- ACT_ACCOUNT
					`-- ACT_ACCOUNT_DEADS
</pre>

The ACT_ACCOUNT_DEADS class accounts (detects, counts and reports) successful kills of DCS units.
The process is given a [Set](#set-module) of units that will be tracked upon successful destruction.
The process will end after each target has been successfully destroyed.
Each successful dead will trigger an Account state transition that can be scored, modified or administered.


#####  ACT_ACCOUNT_DEADS constructor:

* [ACT_ACCOUNT_DEADS:New()](#act_account_deads-new-targetsetunit-taskname): Creates a new ACT_ACCOUNT_DEADS object.


<h4> Attributes </h4>

* [SET_UNIT](#set_unit-class) TargetSetUnit


### ACT_ACCOUNT_DEADS:New(TargetSetUnit, TaskName)

<h4> Parameters </h4>
* [ACT_ACCOUNT_DEADS](#act_account_deads-class)
self
* [SET_UNIT](#set_unit-class) TargetSetUnit
* <u>String</u> TaskName

<h4> Returns </h4>

### ACT_ACCOUNT_DEADS:onenterReport(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ACCOUNT_DEADS](#act_account_deads-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ACCOUNT_DEADS:onenterAccount(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ACCOUNT_DEADS](#act_account_deads-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ACCOUNT_DEADS:onafterEvent(ProcessUnit, Event, From, To)

<h4> Parameters </h4>
* [ACT_ACCOUNT_DEADS](#act_account_deads-class)
self
* [CONTROLLABLE](#controllable-class) ProcessUnit
* <u>String</u> Event
* <u>String</u> From
* <u>String</u> To

<h4> Returns </h4>

### ACT_ACCOUNT_DEADS:onfuncEventDead(EventData)

<h4> Parameters </h4>
* [ACT_ACCOUNT_DEADS](#act_account_deads-class)
self
* [EVENTDATA](#eventdata-class) EventData

<h4> Returns </h4>

