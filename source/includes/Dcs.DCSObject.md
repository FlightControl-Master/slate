# Dcs.DCSObject Module


## Object Class
<pre>
Inheritance : The Object Class inherits from the following parents :
ERROR !
	`-- Object
</pre>
<h4> Attributes </h4>

* #Object.Category Category
* #Object.Desc Desc


### Object:isExist()
@function [parent=#Object] isExist

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* <u>Boolean</u> 


### Object:destroy()
@function [parent=#Object] destroy

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>

### Object:getCategory()
@function [parent=#Object] getCategory

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* #Object.Category 


### Object:getTypeName()
Returns type name of the Object.
@function [parent=#Object] getTypeName

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* <u>String</u> 


### Object:getDesc()
Returns object descriptor.
@function [parent=#Object] getDesc

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* #Object.Desc 


### Object:hasAttribute(attributeName)
Returns true if the object belongs to the category.
@function [parent=#Object] hasAttribute

<h4> Parameters </h4>
* #Object self
* #AttributeName attributeName : Attribute name to check.

<h4> Returns </h4>
* <u>Boolean</u> 


### Object:getName()
Returns name of the object. This is the name that is assigned to the object in the Mission Editor.
@function [parent=#Object] getName

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* <u>String</u> 


### Object:getPoint()
Returns object coordinates for current time.
@function [parent=#Object] getPoint

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* #Vec3 


### Object:getPosition()
Returns object position for current time.
@function [parent=#Object] getPosition

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* #Position3 


### Object:getVelocity()
Returns the unit's velocity vector.
@function [parent=#Object] getVelocity

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* #Vec3 


### Object:inAir()
Returns true if the unit is in air.
@function [parent=#Object] inAir

<h4> Parameters </h4>
* #Object self

<h4> Returns </h4>
* <u>Boolean</u> 


## Object.Category Class
<pre>
The Object.Category class does not inherit
</pre>
<h4> Attributes </h4>

* UNIT self
* WEAPON self
* STATIC self
* SCENERY self
* BASE self


## Object.Desc Class
<pre>
Inheritance : The Object.Desc Class inherits from the following parents :
Desc
	`-- Object.Desc
</pre>
<h4> Attributes </h4>

* <u>Number</u> life : initial life level
* #Box3 box : bounding box of collision geometry


