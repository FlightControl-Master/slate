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

<h4> Parameters </h4>
* <u>String</u> name : Name of static object to find.

<h4> Returns </h4>
* #StaticObject self


### StaticObject:getID()
returns identifier of the static object.

<h4> Parameters </h4>
* #StaticObject self

<h4> Returns </h4>
* #StaticObject.ID self


### StaticObject:getDesc()
Returns descriptor of the StaticObject.

<h4> Parameters </h4>
* #StaticObject self

<h4> Returns </h4>
* #StaticObject.Desc self


## StaticObject.Desc Class
<pre>
Inheritance : The StaticObject.Desc Class inherits from the following parents :
Desc
	`-- Object.Desc
		`-- Unit.Desc
			`-- StaticObject.Desc
</pre>


