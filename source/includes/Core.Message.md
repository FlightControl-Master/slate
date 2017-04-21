# Core.Message Module
**Core** - MESSAGE class takes are of the **real-time notifications** and **messages to players** during a simulation.

![Banner Image](/includes/Pictures/MESSAGE/Dia1.JPG)



## MESSAGE Class
<pre>
Inheritance : The MESSAGE Class inherits from the following parents :
BASE
	`-- MESSAGE
</pre>

Message System to display Messages to Clients, Coalitions or All.
Messages are shown on the display panel for an amount of seconds, and will then disappear.
Messages can contain a category which is indicating the category of the message.

#####  MESSAGE construction

Messages are created with [MESSAGE:New()](#message-new-messagetext-messageduration-messagecategory). Note that when the MESSAGE object is created, no message is sent yet.
To send messages, you need to use the To functions.

#####  Send messages to an audience

Messages are sent:

* To a [Client](#client-module-) using [MESSAGE:ToClient()](#message-toclient-client).
* To a [Group](#group-module-) using [MESSAGE:ToGroup()](#message-togroup-group)
* To a coalition using [MESSAGE:ToCoalition()](#message-tocoalition-needs).
* To the red coalition using MESSAGE-ToRed-.
* To the blue coalition using MESSAGE-ToBlue-.
* To all Players using MESSAGE-ToAll-.

#####  Send conditionally to an audience

Messages can be sent conditionally to an audience (when a condition is true):

* To all players using MESSAGE-ToAllIf-.
* To a coalition using [MESSAGE:ToCoalitionIf()](#message-tocoalitionif-needs).


The MESSAGE class


### MESSAGE:New(MessageText, MessageDuration, MessageCategory)
``` lua
-- Create a series of new Messages.
-- MessageAll is meant to be sent to all players, for 25 seconds, and is classified as "Score".
-- MessageRED is meant to be sent to the RED players only, for 10 seconds, and is classified as "End of Mission", with ID "Win".
-- MessageClient1 is meant to be sent to a Client, for 25 seconds, and is classified as "Score", with ID "Score".
-- MessageClient1 is meant to be sent to a Client, for 25 seconds, and is classified as "Score", with ID "Score".
MessageAll = MESSAGE:New( "To all Players: BLUE has won! Each player of BLUE wins 50 points!",  25, "End of Mission" )
MessageRED = MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", 25, "Penalty" )
MessageClient1 = MESSAGE:New( "Congratulations, you've just hit a target",  25, "Score" )
MessageClient2 = MESSAGE:New( "Congratulations, you've just killed a target", 25, "Score")
```
Creates a new MESSAGE object. Note that these MESSAGE objects are not yet displayed on the display panel. You must use the functions [ToClient](#toclient-module-) or [ToCoalition](#tocoalition-module-) or [ToAll](#toall-module-) to send these Messages to the respective recipients.

<h4> Parameters </h4>
* self self
* <u>String</u> MessageText : is the text of the Message.
* <u>Number</u> MessageDuration : is a number in seconds of how long the MESSAGE should be shown on the display panel.
* <u>String</u> MessageCategory : (optional) is a string expressing the "category" of the Message. The category will be shown as the first text in the message followed by a ": ".

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToClient(Client)
``` lua
-- Send the 2 messages created with the [New](#new-module-) method to the Client Group.
-- Note that the Message of MessageClient2 is overwriting the Message of MessageClient1.
ClientGroup = Group.getByName( "ClientGroup" )

MessageClient1 = MESSAGE:New( "Congratulations, you've just hit a target", "Score", 25, "Score" ):ToClient( ClientGroup )
MessageClient2 = MESSAGE:New( "Congratulations, you've just killed a target", "Score", 25, "Score" ):ToClient( ClientGroup )
or
MESSAGE:New( "Congratulations, you've just hit a target", "Score", 25, "Score" ):ToClient( ClientGroup )
MESSAGE:New( "Congratulations, you've just killed a target", "Score", 25, "Score" ):ToClient( ClientGroup )
or
MessageClient1 = MESSAGE:New( "Congratulations, you've just hit a target", "Score", 25, "Score" )
MessageClient2 = MESSAGE:New( "Congratulations, you've just killed a target", "Score", 25, "Score" )
MessageClient1:ToClient( ClientGroup )
MessageClient2:ToClient( ClientGroup )
```
Sends a MESSAGE to a Client Group. Note that the Group needs to be defined within the ME with the skillset "Client" or "Player".

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self
* [CLIENT](#client-class-) Client : is the Group of the Client.

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToGroup(Group)
Sends a MESSAGE to a Group.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self
* [GROUP](#group-class-) Group : is the Group.

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToBlue()
``` lua
-- Send a message created with the [New](#new-module-) method to the BLUE coalition.
MessageBLUE = MESSAGE:New( "To the BLUE Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" ):ToBlue()
or
MESSAGE:New( "To the BLUE Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" ):ToBlue()
or
MessageBLUE = MESSAGE:New( "To the BLUE Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" )
MessageBLUE:ToBlue()
```
Sends a MESSAGE to the Blue coalition.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToRed()
``` lua
-- Send a message created with the [New](#new-module-) method to the RED coalition.
MessageRED = MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" ):ToRed()
or
MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" ):ToRed()
or
MessageRED = MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" )
MessageRED:ToRed()
```
Sends a MESSAGE to the Red Coalition.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToCoalition(needs)
``` lua
-- Send a message created with the [New](#new-module-) method to the RED coalition.
MessageRED = MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" ):ToCoalition( coalition.side.RED )
or
MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" ):ToCoalition( coalition.side.RED )
or
MessageRED = MESSAGE:New( "To the RED Players: You receive a penalty because you've killed one of your own units", "Penalty", 25, "Score" )
MessageRED:ToCoalition( coalition.side.RED )
```
Sends a MESSAGE to a Coalition.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self
* CoalitionSide needs : to be filled out by the defined structure of the standard scripting engine @{coalition.side}.

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToCoalitionIf(needs)
Sends a MESSAGE to a Coalition if the given Condition is true.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self
* CoalitionSide needs : to be filled out by the defined structure of the standard scripting engine @{coalition.side}.

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToAll()
``` lua
-- Send a message created to all players.
MessageAll = MESSAGE:New( "To all Players: BLUE has won! Each player of BLUE wins 50 points!", "End of Mission", 25, "Win" ):ToAll()
or
MESSAGE:New( "To all Players: BLUE has won! Each player of BLUE wins 50 points!", "End of Mission", 25, "Win" ):ToAll()
or
MessageAll = MESSAGE:New( "To all Players: BLUE has won! Each player of BLUE wins 50 points!", "End of Mission", 25, "Win" )
MessageAll:ToAll()
```
Sends a MESSAGE to all players.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self

<h4> Returns </h4>
* [MESSAGE](#message-class-)



### MESSAGE:ToAllIf()
Sends a MESSAGE to all players if the given Condition is true.

<h4> Parameters </h4>
* [MESSAGE](#message-class-)
self

<h4> Returns </h4>
* [MESSAGE](#message-class-)



