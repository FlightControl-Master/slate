# Functional.AirbasePolice Module
This module contains the AIRBASEPOLICE classes.



##### 1) [AIRBASEPOLICE_BASE](#airbasepolice_base-class-) class, extends [BASE](#base-class-)

The [AIRBASEPOLICE_BASE](#airbasepolice_base-class-) class provides the main methods to monitor CLIENT behaviour at airbases.
CLIENTS should not be allowed to:

* Don't taxi faster than 40 km/h.
* Don't take-off on taxiways.
* Avoid to hit other planes on the airbase.
* Obey ground control orders.

##### 2) [AIRBASEPOLICE_CAUCASUS](#airbasepolice_caucasus-class-) class, extends [AIRBASEPOLICE_BASE](#airbasepolice_base-class-)

All the airbases on the caucasus map can be monitored using this class.
If you want to monitor specific airbases, you need to use the [AIRBASEPOLICE_BASE:Monitor()](#airbasepolice_base-monitor-airbasenames) method, which takes a table or airbase names.
The following names can be given:
* AnapaVityazevo
* Batumi
* Beslan
* Gelendzhik
* Gudauta
* Kobuleti
* KrasnodarCenter
* KrasnodarPashkovsky
* Krymsk
* Kutaisi
* MaykopKhanskaya
* MineralnyeVody
* Mozdok
* Nalchik
* Novorossiysk
* SenakiKolkhi
* SochiAdler
* Soganlug
* SukhumiBabushara
* TbilisiLochini
* Vaziani

##### 3) [AIRBASEPOLICE_NEVADA](#airbasepolice_nevada-class-) class, extends [AIRBASEPOLICE_BASE](#airbasepolice_base-class-)

All the airbases on the NEVADA map can be monitored using this class.
If you want to monitor specific airbases, you need to use the [AIRBASEPOLICE_BASE:Monitor()](#airbasepolice_base-monitor-airbasenames) method, which takes a table or airbase names.
The following names can be given:
* Nellis
* McCarran
* Creech
* Groom Lake

#####  Contributions: Dutch Baron - Concept & Testing
#####  Author: FlightControl - Framework Design &  Programming

## AIRBASEPOLICE_BASE Class
<pre>
Inheritance : The AIRBASEPOLICE_BASE Class inherits from the following parents :
BASE
	`-- AIRBASEPOLICE_BASE
</pre>
<h4> Attributes </h4>

* [SET_CLIENT](#set_client-class-) SetClient


### AIRBASEPOLICE_BASE:New(A, A)

<h4> Parameters </h4>
* [AIRBASEPOLICE_BASE](#airbasepolice_base-class-)
self
* SetClient A : SET_CLIENT object that will contain the CLIENT objects to be monitored if they follow the rules of the airbase.
* Airbases A : table of Airbase Names.

<h4> Returns </h4>
* [AIRBASEPOLICE_BASE](#airbasepolice_base-class-)



### AIRBASEPOLICE_BASE:Monitor(AirbaseNames)

<h4> Parameters </h4>
* [AIRBASEPOLICE_BASE](#airbasepolice_base-class-)
self
* [AirbaseNames](#airbasepolice_base-airbasenames-class-)AirbaseNames : A list of AirbaseNames to monitor. If this parameters is nil, then all airbases will be monitored.

<h4> Returns </h4>
* [AIRBASEPOLICE_BASE](#airbasepolice_base-class-)



## AIRBASEPOLICE_BASE.AirbaseNames Class
<pre>
The AIRBASEPOLICE_BASE.AirbaseNames class does not inherit
</pre>

## AIRBASEPOLICE_CAUCASUS Class
<pre>
Inheritance : The AIRBASEPOLICE_CAUCASUS Class inherits from the following parents :
BASE
	`-- AIRBASEPOLICE_BASE
		`-- AIRBASEPOLICE_CAUCASUS
</pre>
<h4> Attributes </h4>

* [SET_CLIENT](#set_client-class-) SetClient


### AIRBASEPOLICE_CAUCASUS:New(A)

<h4> Parameters </h4>
* [AIRBASEPOLICE_CAUCASUS](#airbasepolice_caucasus-class-)
self
* SetClient A : SET_CLIENT object that will contain the CLIENT objects to be monitored if they follow the rules of the airbase.

<h4> Returns </h4>
* [AIRBASEPOLICE_CAUCASUS](#airbasepolice_caucasus-class-)



## AIRBASEPOLICE_NEVADA Class
<pre>
Inheritance : The AIRBASEPOLICE_NEVADA Class inherits from the following parents :
BASE
	`-- AIRBASEPOLICE_BASE
		`-- AIRBASEPOLICE_NEVADA
</pre>

### AIRBASEPOLICE_NEVADA:New(A)

<h4> Parameters </h4>
* [AIRBASEPOLICE_NEVADA](#airbasepolice_nevada-class-)
self
* SetClient A : SET_CLIENT object that will contain the CLIENT objects to be monitored if they follow the rules of the airbase.

<h4> Returns </h4>
* [AIRBASEPOLICE_NEVADA](#airbasepolice_nevada-class-)



