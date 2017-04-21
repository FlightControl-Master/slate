# Dcs.StaticObject Module


## StaticObject Class
<pre>
Inheritance : The StaticObject Class inherits from the following parents :
ERROR !
	`-- StaticObject
</pre>

<h4> Attributes </h4>

* #StaticObject.ID ID : Identifier of a StaticObject. It assigned to an StaticObject by the Mission Editor automatically.
* #StaticObject.Desc Desc : Descriptor of StaticObject and Unit are equal. StaticObject is just a passive variant of Unit.


### getByName()
Returns static object by its name. If no static object found nil will be returned.
@function [parent=#StaticObject] getByName

<h4> Parameters </h4>
* <u>String</u> name : Name of static object to find.

<h4> Returns </h4>
* #StaticObject 


### StaticObject:getID()
returns identifier of the static object.
@function [parent=#StaticObject] getID

<h4> Parameters </h4>
* #StaticObject self

<h4> Returns </h4>
* #StaticObject.ID 


### StaticObject:getDesc()
Returns descriptor of the StaticObject.
@function [parent=#StaticObject] getDesc

<h4> Parameters </h4>
* #StaticObject self

<h4> Returns </h4>
* #StaticObject.Desc 


## StaticObject.Desc Class
<pre>
Inheritance : The StaticObject.Desc Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- StaticObject.Desc
</pre>


