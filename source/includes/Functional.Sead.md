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

<h4> Parameters </h4>
* table{string,...}|string SEADGroupPrefixes : which is a table of Prefixes of the SA Groups in the DCSRTE on which evasive actions need to be taken.

<h4> Returns </h4>
* SEAD self


### SEAD:OnEventShot(EventData)

<h4> Parameters </h4>
* [SEAD](#sead-class)
self
* [EVENTDATA](#eventdata-class) EventData

<h4> Returns </h4>

