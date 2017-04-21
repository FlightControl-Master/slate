# Functional.Sead Module
Provides defensive behaviour to a set of SAM sites within a running Mission.

## SEAD Class
<pre>
Inheritance : The SEAD Class inherits from the following parents :
BASE
	`-- SEAD
</pre>


### New()
``` lua
-- CCCP SEAD Defenses
-- Defends the Russian SA installations from SEAD attacks.
SEAD_RU_SAM_Defenses = SEAD:New( { 'RU SA-6 Kub', 'RU SA-6 Defenses', 'RU MI-26 Troops', 'RU Attack Gori' } )
```
Creates the main object which is handling defensive actions for SA sites or moving SA vehicles.
When an anti radiation missile is fired (KH-58, KH-31P, KH-31A, KH-25MPU, HARM missiles), the SA will shut down their radars and will take evasive actions...
Chances are big that the missile will miss.

<h4> Parameters </h4>
* table{string,...}|string SEADGroupPrefixes : which is a table of Prefixes of the SA Groups in the DCSRTE on which evasive actions need to be taken.

<h4> Returns </h4>
* SEAD 


### SEAD:OnEventShot(EventData)
Detects if an SA site was shot with an anti radiation missile. In this case, take evasive actions based on the skill level set within the ME.
@see SEAD

<h4> Parameters </h4>
* [SEAD](#sead-class-)
self
* [EVENTDATA](#eventdata-class-) EventData

<h4> Returns </h4>

