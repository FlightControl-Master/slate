# Core.Menu Module
**Core** -- MENU_ classes model the definition of **hierarchical menu structures** and **commands for players** within a mission.



DCS Menus can be managed using the MENU classes.
The advantage of using MENU classes is that it hides the complexity of dealing with menu management in more advanced scanerios where you need to
set menus and later remove them, and later set them again. You'll find while using use normal DCS scripting functions, that setting and removing
menus is not a easy feat if you have complex menu hierarchies defined.
Using the MOOSE menu classes, the removal and refreshing of menus are nicely being handled within these classes, and becomes much more easy.
On top, MOOSE implements **variable parameter** passing for command menus.

There are basically two different MENU class types that you need to use:

#####  To manage **main menus**, the classes begin with **MENU_**:

* [MENU_MISSION](#menu_mission-class): Manages main menus for whole mission file.
* [MENU_COALITION](#menu_coalition-class): Manages main menus for whole coalition.
* [MENU_GROUP](#menu_group-class): Manages main menus for GROUPs.
* [MENU_CLIENT](#menu_client-class): Manages main menus for CLIENTs. This manages menus for units with the skill level "Client".

#####  To manage **command menus**, which are menus that allow the player to issue **functions**, the classes begin with **MENU_COMMAND_**:

* [MENU_MISSION_COMMAND](#menu_mission_command-class): Manages command menus for whole mission file.
* [MENU_COALITION_COMMAND](#menu_coalition_command-class): Manages command menus for whole coalition.
* [MENU_GROUP_COMMAND](#menu_group_command-class): Manages command menus for GROUPs.
* [MENU_CLIENT_COMMAND](#menu_client_command-class): Manages command menus for CLIENTs. This manages menus for units with the skill level "Client".



The above menus classes **are derived** from 2 main **abstract** classes defined within the MOOSE framework (so don't use these):

##### 1) MENU_ BASE abstract base classes (don't use them)

The underlying base menu classes are **NOT** to be used within your missions.
These are simply abstract base classes defining a couple of fields that are used by the
derived MENU_ classes to manage menus.

##### 1.1) [MENU_BASE](#menu_base-class) class, extends [BASE](#base-class)

The [MENU_BASE](#menu_base-class) class defines the main MENU class where other MENU classes are derived from.

##### 1.2) [MENU_COMMAND_BASE](#menu_command_base-class) class, extends [BASE](#base-class)

The [MENU_COMMAND_BASE](#menu_command_base-class) class defines the main MENU class where other MENU COMMAND_ classes are derived from, in order to set commands.



**The next menus define the MENU classes that you can use within your missions.**

##### 2) MENU MISSION classes

The underlying classes manage the menus for a complete mission file.

##### 2.1) [MENU_MISSION](#menu_mission-class) class, extends [MENU_BASE](#menu_base-class)

The [MENU_MISSION](#menu_mission-class) class manages the main menus for a complete mission.
You can add menus with the [MENU_MISSION:New()](#menu_mission-new-menutext-parentmenu) method, which constructs a MENU_MISSION object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_MISSION:RemoveSubMenus()](#menu_mission-removesubmenus).

##### 2.2) [MENU_MISSION_COMMAND](#menu_mission_command-class) class, extends [MENU_COMMAND_BASE](#menu_command_base-class)

The [MENU_MISSION_COMMAND](#menu_mission_command-class) class manages the command menus for a complete mission, which allow players to execute functions during mission execution.
You can add menus with the [MENU_MISSION_COMMAND:New()](#menu_mission_command-new-menutext-parentmenu-a-an) method, which constructs a MENU_MISSION_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_MISSION_COMMAND:Remove()](#menu_mission_command-remove).



##### 3) MENU COALITION classes

The underlying classes manage the menus for whole coalitions.

##### 3.1) [MENU_COALITION](#menu_coalition-class) class, extends [MENU_BASE](#menu_base-class)

The [MENU_COALITION](#menu_coalition-class) class manages the main menus for coalitions.
You can add menus with the [MENU_COALITION:New()](#menu_coalition-new-coalition-menutext-parentmenu) method, which constructs a MENU_COALITION object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_COALITION:RemoveSubMenus()](#menu_coalition-removesubmenus).

##### 3.2) [MENU_COALITION_COMMAND](#menu_coalition_command-class) class, extends [MENU_COMMAND_BASE](#menu_command_base-class)

The [MENU_COALITION_COMMAND](#menu_coalition_command-class) class manages the command menus for coalitions, which allow players to execute functions during mission execution.
You can add menus with the [MENU_COALITION_COMMAND:New()](#menu_coalition_command-new-coalition-menutext-parentmenu-a-an) method, which constructs a MENU_COALITION_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_COALITION_COMMAND:Remove()](#menu_coalition_command-remove).



##### 4) MENU GROUP classes

The underlying classes manage the menus for groups. Note that groups can be inactive, alive or can be destroyed.

##### 4.1) [MENU_GROUP](#menu_group-class) class, extends [MENU_BASE](#menu_base-class)

The [MENU_GROUP](#menu_group-class) class manages the main menus for coalitions.
You can add menus with the [MENU_GROUP:New()](#menu_group-new-menugroup-menutext-parentmenu) method, which constructs a MENU_GROUP object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_GROUP:RemoveSubMenus()](#menu_group-removesubmenus-self).

##### 4.2) [MENU_GROUP_COMMAND](#menu_group_command-class) class, extends [MENU_COMMAND_BASE](#menu_command_base-class)

The [MENU_GROUP_COMMAND](#menu_group_command-class) class manages the command menus for coalitions, which allow players to execute functions during mission execution.
You can add menus with the [MENU_GROUP_COMMAND:New()](#menu_group_command-new-menugroup-the-the-a-an) method, which constructs a MENU_GROUP_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_GROUP_COMMAND:Remove()](#menu_group_command-remove-self).



##### 5) MENU CLIENT classes

The underlying classes manage the menus for units with skill level client or player.

##### 5.1) [MENU_CLIENT](#menu_client-class) class, extends [MENU_BASE](#menu_base-class)

The [MENU_CLIENT](#menu_client-class) class manages the main menus for coalitions.
You can add menus with the [MENU_CLIENT:New()](#menu_client-new-client-menutext-parentmenu) method, which constructs a MENU_CLIENT object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_CLIENT:RemoveSubMenus()](#menu_client-removesubmenus).

##### 5.2) [MENU_CLIENT_COMMAND](#menu_client_command-class) class, extends [MENU_COMMAND_BASE](#menu_command_base-class)

The [MENU_CLIENT_COMMAND](#menu_client_command-class) class manages the command menus for coalitions, which allow players to execute functions during mission execution.
You can add menus with the [MENU_CLIENT_COMMAND:New()](#menu_client_command-new-client-menutext-parentmenu-a) method, which constructs a MENU_CLIENT_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_CLIENT_COMMAND:Remove()](#menu_client_command-remove).



#####  Contributions: -
#####  Authors: FlightControl : Design & Programming

## MENU_BASE Class
<pre>
Inheritance : The MENU_BASE Class inherits from the following parents :
BASE
	`-- MENU_BASE
</pre>


### MENU_BASE:New()

<h4> Parameters </h4>
* [MENU_BASE](#menu_base-class)
self

<h4> Returns </h4>
* [MENU_BASE](#menu_base-class)
self


### MENU_BASE:GetMenu(MenuText)

<h4> Parameters </h4>
* [MENU_BASE](#menu_base-class)
self
* <u>String</u> MenuText : The text of the child menu.

<h4> Returns </h4>
* [MENU_BASE](#menu_base-class)
self


### MENU_BASE:SetRemoveParent(RemoveParent)

<h4> Parameters </h4>
* [MENU_BASE](#menu_base-class)
self
* <u>Boolean</u> RemoveParent : If true, the parent menu is automatically removed when this menu is the last child menu of that parent [Menu](#menu-module).

<h4> Returns </h4>
* [MENU_BASE](#menu_base-class)
self


### MENU_BASE:SetTime(self)

<h4> Parameters </h4>
* [MENU_BASE](#menu_base-class)
self
* MenuTime self

<h4> Returns </h4>
* [MENU_BASE](#menu_base-class)
self


## MENU_COMMAND_BASE Class
<pre>
Inheritance : The MENU_COMMAND_BASE Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_COMMAND_BASE
</pre>

<h4> Attributes </h4>

* <u>Function()</u> MenuCallHandler


### MENU_COMMAND_BASE:New()

<h4> Parameters </h4>
* [MENU_COMMAND_BASE](#menu_command_base-class)
self

<h4> Returns </h4>
* [MENU_COMMAND_BASE](#menu_command_base-class)
self


## MENU_MISSION Class
<pre>
Inheritance : The MENU_MISSION Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_MISSION
</pre>


### MENU_MISSION:New(MenuText, ParentMenu)

<h4> Parameters </h4>
* [MENU_MISSION](#menu_mission-class)
self
* <u>String</u> MenuText : The text for the menu.
* <u>List[]</u> ParentMenu : The parent menu. This parameter can be ignored if you want the menu to be located at the perent menu of DCS world (under F10 other).

<h4> Returns </h4>
* [MENU_MISSION](#menu_mission-class)
self


### MENU_MISSION:RemoveSubMenus()

<h4> Parameters </h4>
* [MENU_MISSION](#menu_mission-class)
self

<h4> Returns </h4>
* [MENU_MISSION](#menu_mission-class)
self


### MENU_MISSION:Remove()

<h4> Parameters </h4>
* [MENU_MISSION](#menu_mission-class)
self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_MISSION_COMMAND Class
<pre>
Inheritance : The MENU_MISSION_COMMAND Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_COMMAND_BASE
			`-- MENU_MISSION_COMMAND
</pre>


### MENU_MISSION_COMMAND:New(MenuText, ParentMenu, A, An)

<h4> Parameters </h4>
* [MENU_MISSION_COMMAND](#menu_mission_command-class)
self
* <u>String</u> MenuText : The text for the menu.
* [MENU_MISSION](#menu_mission-class) ParentMenu : The parent menu.
* CommandMenuFunction A : function that is called when the menu key is pressed.
* CommandMenuArgument An : argument for the function. There can only be ONE argument given. So multiple arguments must be wrapped into a table. See the below example how to do this.

<h4> Returns </h4>
* [MENU_MISSION_COMMAND](#menu_mission_command-class)
self


### MENU_MISSION_COMMAND:Remove()

<h4> Parameters </h4>
* [MENU_MISSION_COMMAND](#menu_mission_command-class)
self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_COALITION Class
<pre>
Inheritance : The MENU_COALITION Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_COALITION
</pre>


### MENU_COALITION:New(Coalition, MenuText, ParentMenu)

<h4> Parameters </h4>
* [MENU_COALITION](#menu_coalition-class)
self
* [coalition.side](#coalition.side-class) Coalition : The coalition owning the menu.
* <u>String</u> MenuText : The text for the menu.
* <u>List[]</u> ParentMenu : The parent menu. This parameter can be ignored if you want the menu to be located at the perent menu of DCS world (under F10 other).

<h4> Returns </h4>
* [MENU_COALITION](#menu_coalition-class)
self


### MENU_COALITION:RemoveSubMenus()

<h4> Parameters </h4>
* [MENU_COALITION](#menu_coalition-class)
self

<h4> Returns </h4>
* [MENU_COALITION](#menu_coalition-class)
self


### MENU_COALITION:Remove()

<h4> Parameters </h4>
* [MENU_COALITION](#menu_coalition-class)
self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_COALITION_COMMAND Class
<pre>
Inheritance : The MENU_COALITION_COMMAND Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_COMMAND_BASE
			`-- MENU_COALITION_COMMAND
</pre>


### MENU_COALITION_COMMAND:New(Coalition, MenuText, ParentMenu, A, An)

<h4> Parameters </h4>
* [MENU_COALITION_COMMAND](#menu_coalition_command-class)
self
* [coalition.side](#coalition.side-class) Coalition : The coalition owning the menu.
* <u>String</u> MenuText : The text for the menu.
* [MENU_COALITION](#menu_coalition-class) ParentMenu : The parent menu.
* CommandMenuFunction A : function that is called when the menu key is pressed.
* CommandMenuArgument An : argument for the function. There can only be ONE argument given. So multiple arguments must be wrapped into a table. See the below example how to do this.

<h4> Returns </h4>
* [MENU_COALITION_COMMAND](#menu_coalition_command-class)
self


### MENU_COALITION_COMMAND:Remove()

<h4> Parameters </h4>
* [MENU_COALITION_COMMAND](#menu_coalition_command-class)
self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_CLIENT Class
<pre>
Inheritance : The MENU_CLIENT Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_CLIENT
</pre>


### MENU_CLIENT:New(Client, MenuText, ParentMenu)

<h4> Parameters </h4>
* [MENU_CLIENT](#menu_client-class)
self
* [CLIENT](#client-class) Client : The Client owning the menu.
* <u>String</u> MenuText : The text for the menu.
* <u>List[]</u> ParentMenu : The parent menu.

<h4> Returns </h4>
* [MENU_CLIENT](#menu_client-class)
self


### MENU_CLIENT:RemoveSubMenus()

<h4> Parameters </h4>
* [MENU_CLIENT](#menu_client-class)
self

<h4> Returns </h4>
* [MENU_CLIENT](#menu_client-class)
self


### MENU_CLIENT:Remove()

<h4> Parameters </h4>
* [MENU_CLIENT](#menu_client-class)
self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_CLIENT_COMMAND Class
<pre>
Inheritance : The MENU_CLIENT_COMMAND Class inherits from the following parents :
ERROR !
	`-- MENU_CLIENT_COMMAND
</pre>


### MENU_CLIENT_COMMAND:New(Client, MenuText, ParentMenu, A)

<h4> Parameters </h4>
* [MENU_CLIENT_COMMAND](#menu_client_command-class)
self
* [CLIENT](#client-class) Client : The Client owning the menu.
* <u>String</u> MenuText : The text for the menu.
* [MENU_BASE](#menu_base-class)
ParentMenu : The parent menu.
* CommandMenuFunction A : function that is called when the menu key is pressed.

<h4> Returns </h4>
* [MENU_CLIENT_COMMAND](#menu_client_command-class) self


### MENU_CLIENT_COMMAND:Remove()

<h4> Parameters </h4>
* [MENU_CLIENT_COMMAND](#menu_client_command-class)
self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_GROUP Class
<pre>
Inheritance : The MENU_GROUP Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_GROUP
</pre>


### MENU_GROUP:New(MenuGroup, MenuText, ParentMenu)

<h4> Parameters </h4>
* [MENU_GROUP](#menu_group-class)
self
* [GROUP](#group-class) MenuGroup : The Group owning the menu.
* <u>String</u> MenuText : The text for the menu.
* <u>List[]</u> ParentMenu : The parent menu.

<h4> Returns </h4>
* [MENU_GROUP](#menu_group-class)
self


### MENU_GROUP:RemoveSubMenus(self)

<h4> Parameters </h4>
* [MENU_GROUP](#menu_group-class)
self
* MenuTime self

<h4> Returns </h4>
* [MENU_GROUP](#menu_group-class)
self


### MENU_GROUP:Remove(self)

<h4> Parameters </h4>
* [MENU_GROUP](#menu_group-class)
self
* MenuTime self

<h4> Returns </h4>
* <u>Nil</u> self


## MENU_GROUP_COMMAND Class
<pre>
Inheritance : The MENU_GROUP_COMMAND Class inherits from the following parents :
BASE
	`-- MENU_BASE
		`-- MENU_GROUP_COMMAND
</pre>


### MENU_GROUP_COMMAND:New(MenuGroup, The, The, A, An)

<h4> Parameters </h4>
* [MENU_GROUP_COMMAND](#menu_group_command-class)
self
* [GROUP](#group-class) MenuGroup : The Group owning the menu.
* MenuText The : text for the menu.
* ParentMenu The : parent menu.
* CommandMenuFunction A : function that is called when the menu key is pressed.
* CommandMenuArgument An : argument for the function.

<h4> Returns </h4>
* [MENU_GROUP_COMMAND](#menu_group_command-class)
self


### MENU_GROUP_COMMAND:Remove(self)

<h4> Parameters </h4>
* [MENU_GROUP_COMMAND](#menu_group_command-class)
self
* MenuTime self

<h4> Returns </h4>
* <u>Nil</u> self


