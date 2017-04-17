# Functional.CleanUp Module
The CLEANUP class keeps an area clean of crashing or colliding airplanes. It also prevents airplanes from firing within this area.

## CLEANUP Class
<pre>
Inheritance : The CLEANUP Class inherits from the following parents :
BASE
	`-- CLEANUP
</pre>


### CLEANUP:New(ZoneNames, TimeInterval)
``` lua
-- Clean these Zones.
CleanUpAirports = CLEANUP:New( { 'CLEAN Tbilisi', 'CLEAN Kutaisi' }, 150 )
or
CleanUpTbilisi = CLEANUP:New( 'CLEAN Tbilisi', 150 )
CleanUpKutaisi = CLEANUP:New( 'CLEAN Kutaisi', 600 )
```

<h4> Parameters </h4>
* [CLEANUP](#cleanup-class)
self
* <u>List[]</u> ZoneNames : Is a table of zone names where the debris should be cleaned. Also a single string can be passed with one zone name.
* <u>Number</u> TimeInterval : The interval in seconds when the clean activity takes place. The default is 300 seconds, thus every 5 minutes.

<h4> Returns </h4>
* [CLEANUP](#cleanup-class)
self


