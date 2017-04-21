# Dcs.DCSController Module


## Controller Class
<pre>
The Controller class does not inherit
</pre>

This class has 2 types of functions:

* Tasks
* Commands: Commands are instant actions those required zero time to perform. Commands may be used both for control unit/group behavior and control game mechanics.

<h4> Attributes </h4>

* #Controller.Detection Detection : Enum contains identifiers of surface types.


### Controller:setOnOff(value)
Enables and disables the controller.
Note: Now it works only for ground / naval groups!
@function [parent=#Controller] setOnOff

<h4> Parameters </h4>
* self self
* <u>Boolean</u> value : Enable / Disable.

<h4> Returns </h4>

### Controller:setTask(task)
Resets current task and then sets the task to the controller. Task is a table that contains task identifier and task parameters.
@function [parent=#Controller] setTask

<h4> Parameters </h4>
* self self
* #Task task

<h4> Returns </h4>

### Controller:resetTask()
Resets current task of the controller.
@function [parent=#Controller] resetTask

<h4> Parameters </h4>
* self self

<h4> Returns </h4>

### Controller:pushTask(task)
Pushes the task to the front of the queue and makes the task active. Further call of function Controller.setTask() function will stop current task, clear the queue and set the new task active. If the task queue is empty the function will work like function Controller.setTask() function.
@function [parent=#Controller] pushTask

<h4> Parameters </h4>
* self self
* #Task task

<h4> Returns </h4>

### Controller:popTask()
Pops current (front) task from the queue and makes active next task in the queue (if exists). If no more tasks in the queue the function works like function Controller.resetTask() function. Does nothing if the queue is empty.
@function [parent=#Controller] popTask

<h4> Parameters </h4>
* self self

<h4> Returns </h4>

### Controller:hasTask()
Returns true if the controller has a task.
@function [parent=#Controller] hasTask

<h4> Parameters </h4>
* self self

<h4> Returns </h4>
* <u>Boolean</u> 


### Controller:setCommand(command)
Sets the command to perform by controller.
@function [parent=#Controller] setCommand

<h4> Parameters </h4>
* self self
* #Command command : Table that contains command identifier and command parameters.

<h4> Returns </h4>

### Controller:setOption(optionId, optionValue)
Sets the option to the controller.
Option is a pair of identifier and value. Behavior options are global parameters those affect controller behavior in all tasks it performs.
Option identifiers and values are stored in table AI.Option in subtables Air, Ground and Naval.

OptionId = @{#AI.Option.Air.id} or @{#AI.Option.Ground.id} or @{#AI.Option.Naval.id}
OptionValue = AI.Option.Air.val[optionName] or AI.Option.Ground.val[optionName] or AI.Option.Naval.val[optionName]

@function [parent=#Controller] setOption

<h4> Parameters </h4>
* self self
* #OptionId optionId : Option identifier.
* #OptionValue optionValue : Value of the option.

<h4> Returns </h4>

### Controller:isTargetDetected(target, detection)
Checks if the target is detected or not. If one or more detection method is specified the function will return true if the target is detected by at least one of these methods. If no detection methods are specified the function will return true if the target is detected by any method.
@function [parent=#Controller] isTargetDetected

<h4> Parameters </h4>
* self self
* [Object](#object-class-) target : Target to check
* #Controller.Detection detection : Controller.Detection detection1, Controller.Detection detection2, ... Controller.Detection detectionN

<h4> Returns </h4>
* <u>Boolean</u>  detected True if the target is detected.
* <u>Boolean</u>  visible Has effect only if detected is true. True if the target is visible now.
* #ModelTime  lastTime Has effect only if visible is false. Last time when target was seen.
* <u>Boolean</u>  type Has effect only if detected is true. True if the target type is known.
* <u>Boolean</u>  distance Has effect only if detected is true. True if the distance to the target is known.
* #Vec3  lastPos Has effect only if visible is false. Last position of the target when it was seen.
* #Vec3  lastVel Has effect only if visible is false. Last velocity of the target when it was seen.


### Controller:getDetectedTargets(detection)
Returns list of detected targets. If one or more detection method is specified the function will return targets which were detected by at least one of these methods. If no detection methods are specified the function will return targets which were detected by any method.
@function [parent=#Controller] getDetectedTargets

<h4> Parameters </h4>
* self self
* #Controller.Detection detection : Controller.Detection detection1, Controller.Detection detection2, ... Controller.Detection detectionN

<h4> Returns </h4>
* #list<#DetectedTarget>  array of DetectedTarget


### Controller:knowTarget(object, type, distance)
Know a target.
@function [parent=#Controller] knowTarget

<h4> Parameters </h4>
* self self
* [Object](#object-class-) object : The target.
* <u>Boolean</u> type : Target type is known.
* <u>Boolean</u> distance : Distance to target is known.

<h4> Returns </h4>

## Controller.Detection Class
<pre>
The Controller.Detection class does not inherit
</pre>

<h4> Attributes </h4>

* VISUAL self
* OPTIC self
* RADAR self
* IRST self
* RWR self
* DLINK self


## DetectedTarget Class
<pre>
The DetectedTarget class does not inherit
</pre>

<h4> Attributes </h4>

* [Object](#object-class-) object : The target
* <u>Boolean</u> visible : The target is visible
* <u>Boolean</u> type : The target type is known
* <u>Boolean</u> distance : Distance to the target is known


