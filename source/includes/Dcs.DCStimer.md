# Dcs.DCStimer Module


## timer Class
<pre>
The timer class does not inherit
</pre>

### timer.getTime()

<h4> Parameters </h4>
<h4> Returns </h4>
* #Time 


### timer.getAbsTime()

<h4> Parameters </h4>
<h4> Returns </h4>
* #Time 


### timer.getTime0()

<h4> Parameters </h4>
<h4> Returns </h4>
* #Time 


### scheduleFunction(Function, time)
Schedules function to call at desired model time.
Time function FunctionToCall(any argument, Time time)

...

return ...

end

Must return model time of next call or nil. Note that the DCS scheduler calls the function in protected mode and any Lua errors in the called function will be trapped and not reported. If the function triggers a Lua error then it will be terminated and not scheduled to run again.
@function [parent=#timer] scheduleFunction

<h4> Parameters </h4>
* <u>Function()</u>ToCall functionToCall : Lua-function to call. Must have prototype of FunctionToCall.
* functionArgument Function : argument of any type to pass to functionToCall.
* #Time time : Model time of the function call.

<h4> Returns </h4>
* functionId 


### setFunctionTime(time)
Re-schedules function to call at another model time.
@function [parent=#timer] setFunctionTime

<h4> Parameters </h4>
* functionId Lua-function : to call. Must have prototype of FunctionToCall.
* #Time time : Model time of the function call.

<h4> Returns </h4>

### removeFunction()
Removes the function from schedule.
@function [parent=#timer] removeFunction

<h4> Parameters </h4>
* functionId Function : identifier to remove from schedule

<h4> Returns </h4>

