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



#####  **AUTHORS and CONTRIBUTIONS**

#####  Contributions:

#####  Authors:

* **FlightControl**: Design & Programming

## MENU_BASE Class
<pre>
Inheritance : The MENU_BASE Class inherits from the following parents :
BASE
	`-- MENU_BASE
</pre>
The MENU_BASE class defines the main MENU class where other MENU classes are derived from.
This is an abstract class, so don't use it.



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

The MENU_COMMAND_BASE class defines the main MENU class where other MENU COMMAND_
classes are derived from, in order to set commands.


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

The MENU_MISSION class manages the main menus for a complete mission.
You can add menus with the [MENU_MISSION:New()](#menu_mission-new-menutext-parentmenu) method, which constructs a MENU_MISSION object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_MISSION:RemoveSubMenus()](#menu_mission-removesubmenus).



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

The MENU_MISSION_COMMAND class manages the command menus for a complete mission, which allow players to execute functions during mission execution.
You can add menus with the [MENU_MISSION_COMMAND:New()](#menu_mission_command-new-menutext-parentmenu-a-an) method, which constructs a MENU_MISSION_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_MISSION_COMMAND:Remove()](#menu_mission_command-remove).




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

The [MENU_COALITION](#menu_coalition-class) class manages the main menus for coalitions.
You can add menus with the [MENU_COALITION:New()](#menu_coalition-new-coalition-menutext-parentmenu) method, which constructs a MENU_COALITION object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_COALITION:RemoveSubMenus()](#menu_coalition-removesubmenus).


@usage
-- This demo creates a menu structure for the planes within the red coalition.
-- To test, join the planes, then look at the other radio menus (Option F10).
-- Then switch planes and check if the menu is still there.

local Plane1 = CLIENT:FindByName( "Plane 1" )
local Plane2 = CLIENT:FindByName( "Plane 2" )


-- This would create a menu for the red coalition under the main DCS "Others" menu.
local MenuCoalitionRed = MENU_COALITION:New( coalition.side.RED, "Manage Menus" )


local function ShowStatus( StatusText, Coalition )

MESSAGE:New( Coalition, 15 ):ToRed()
Plane1:Message( StatusText, 15 )
Plane2:Message( StatusText, 15 )
end

local MenuStatus -- Menu#MENU_COALITION
local MenuStatusShow -- Menu#MENU_COALITION_COMMAND

local function RemoveStatusMenu()
MenuStatus:Remove()
end

local function AddStatusMenu()

-- This would create a menu for the red coalition under the MenuCoalitionRed menu object.
MenuStatus = MENU_COALITION:New( coalition.side.RED, "Status for Planes" )
MenuStatusShow = MENU_COALITION_COMMAND:New( coalition.side.RED, "Show Status", MenuStatus, ShowStatus, "Status of planes is ok!", "Message to Red Coalition" )
end

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Add Status Menu", MenuCoalitionRed, AddStatusMenu )
local MenuRemove = MENU_COALITION_COMMAND:New( coalition.side.RED, "Remove Status Menu", MenuCoalitionRed, RemoveStatusMenu )




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

The MENU_COALITION_COMMAND class manages the command menus for coalitions, which allow players to execute functions during mission execution.
You can add menus with the [MENU_COALITION_COMMAND:New()](#menu_coalition_command-new-coalition-menutext-parentmenu-a-an) method, which constructs a MENU_COALITION_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_COALITION_COMMAND:Remove()](#menu_coalition_command-remove).




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

The MENU_CLIENT class manages the main menus for coalitions.
You can add menus with the [MENU_CLIENT:New()](#menu_client-new-client-menutext-parentmenu) method, which constructs a MENU_CLIENT object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_CLIENT:RemoveSubMenus()](#menu_client-removesubmenus).

@usage
-- This demo creates a menu structure for the two clients of planes.
-- Each client will receive a different menu structure.
-- To test, join the planes, then look at the other radio menus (Option F10).
-- Then switch planes and check if the menu is still there.
-- And play with the Add and Remove menu options.

-- Note that in multi player, this will only work after the DCS clients bug is solved.

local function ShowStatus( PlaneClient, StatusText, Coalition )

MESSAGE:New( Coalition, 15 ):ToRed()
PlaneClient:Message( StatusText, 15 )
end

local MenuStatus = {}

local function RemoveStatusMenu( MenuClient )
local MenuClientName = MenuClient:GetName()
MenuStatus[MenuClientName]:Remove()
end

 @param [CLIENT](#client-class) MenuClient
local function AddStatusMenu( MenuClient )
local MenuClientName = MenuClient:GetName()
-- This would create a menu for the red coalition under the MenuCoalitionRed menu object.
MenuStatus[MenuClientName] = MENU_CLIENT:New( MenuClient, "Status for Planes" )
MENU_CLIENT_COMMAND:New( MenuClient, "Show Status", MenuStatus[MenuClientName], ShowStatus, MenuClient, "Status of planes is ok!", "Message to Red Coalition" )
end

SCHEDULER:New( nil,
function()
local PlaneClient = CLIENT:FindByName( "Plane 1" )
if PlaneClient and PlaneClient:IsAlive() then
local MenuManage = MENU_CLIENT:New( PlaneClient, "Manage Menus" )
MENU_CLIENT_COMMAND:New( PlaneClient, "Add Status Menu Plane 1", MenuManage, AddStatusMenu, PlaneClient )
MENU_CLIENT_COMMAND:New( PlaneClient, "Remove Status Menu Plane 1", MenuManage, RemoveStatusMenu, PlaneClient )
end
end, {}, 10, 10 )

SCHEDULER:New( nil,
function()
local PlaneClient = CLIENT:FindByName( "Plane 2" )
if PlaneClient and PlaneClient:IsAlive() then
local MenuManage = MENU_CLIENT:New( PlaneClient, "Manage Menus" )
MENU_CLIENT_COMMAND:New( PlaneClient, "Add Status Menu Plane 2", MenuManage, AddStatusMenu, PlaneClient )
MENU_CLIENT_COMMAND:New( PlaneClient, "Remove Status Menu Plane 2", MenuManage, RemoveStatusMenu, PlaneClient )
end
end, {}, 10, 10 )


MENU_COALITION constructor. Creates a new radio command item for a coalition, which can invoke a function with parameters.


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

The MENU_CLIENT_COMMAND class manages the command menus for coalitions, which allow players to execute functions during mission execution.
You can add menus with the [MENU_CLIENT_COMMAND:New()](#menu_client_command-new-client-menutext-parentmenu-a) method, which constructs a MENU_CLIENT_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_CLIENT_COMMAND:Remove()](#menu_client_command-remove).




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

The MENU_GROUP class manages the main menus for coalitions.
You can add menus with the [MENU_GROUP:New()](#menu_group-new-menugroup-menutext-parentmenu) method, which constructs a MENU_GROUP object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_GROUP:RemoveSubMenus()](#menu_group-removesubmenus-self).

@usage
-- This demo creates a menu structure for the two groups of planes.
-- Each group will receive a different menu structure.
-- To test, join the planes, then look at the other radio menus (Option F10).
-- Then switch planes and check if the menu is still there.
-- And play with the Add and Remove menu options.

-- Note that in multi player, this will only work after the DCS groups bug is solved.

local function ShowStatus( PlaneGroup, StatusText, Coalition )

MESSAGE:New( Coalition, 15 ):ToRed()
PlaneGroup:Message( StatusText, 15 )
end

local MenuStatus = {}

local function RemoveStatusMenu( MenuGroup )
local MenuGroupName = MenuGroup:GetName()
MenuStatus[MenuGroupName]:Remove()
end

 @param [GROUP](#group-class) MenuGroup
local function AddStatusMenu( MenuGroup )
local MenuGroupName = MenuGroup:GetName()
-- This would create a menu for the red coalition under the MenuCoalitionRed menu object.
MenuStatus[MenuGroupName] = MENU_GROUP:New( MenuGroup, "Status for Planes" )
MENU_GROUP_COMMAND:New( MenuGroup, "Show Status", MenuStatus[MenuGroupName], ShowStatus, MenuGroup, "Status of planes is ok!", "Message to Red Coalition" )
end

SCHEDULER:New( nil,
function()
local PlaneGroup = GROUP:FindByName( "Plane 1" )
if PlaneGroup and PlaneGroup:IsAlive() then
local MenuManage = MENU_GROUP:New( PlaneGroup, "Manage Menus" )
MENU_GROUP_COMMAND:New( PlaneGroup, "Add Status Menu Plane 1", MenuManage, AddStatusMenu, PlaneGroup )
MENU_GROUP_COMMAND:New( PlaneGroup, "Remove Status Menu Plane 1", MenuManage, RemoveStatusMenu, PlaneGroup )
end
end, {}, 10, 10 )

SCHEDULER:New( nil,
function()
local PlaneGroup = GROUP:FindByName( "Plane 2" )
if PlaneGroup and PlaneGroup:IsAlive() then
local MenuManage = MENU_GROUP:New( PlaneGroup, "Manage Menus" )
MENU_GROUP_COMMAND:New( PlaneGroup, "Add Status Menu Plane 2", MenuManage, AddStatusMenu, PlaneGroup )
MENU_GROUP_COMMAND:New( PlaneGroup, "Remove Status Menu Plane 2", MenuManage, RemoveStatusMenu, PlaneGroup )
end
end, {}, 10, 10 )




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

The [MENU_GROUP_COMMAND](#menu_group_command-class) class manages the command menus for coalitions, which allow players to execute functions during mission execution.
You can add menus with the [MENU_GROUP_COMMAND:New()](#menu_group_command-new-menugroup-the-the-a-an) method, which constructs a MENU_GROUP_COMMAND object and returns you the object reference.
Using this object reference, you can then remove ALL the menus and submenus underlying automatically with [MENU_GROUP_COMMAND:Remove()](#menu_group_command-remove-self).




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


