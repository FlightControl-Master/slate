# Core.Radio Module
**Core** - The RADIO Module is responsible for everything that is related to radio transmission and you can hear in DCS, be it TACAN beacons, Radio transmissions...

![Banner Image](/includes/Pictures/RADIO/Dia1.JPG)



The Radio contains 2 classes : RADIO and BEACON

What are radio communications in DCS ?

* Radio transmissions consist of **sound files** that are broadcasted on a specific **frequency** (e.g. 115MHz) and **modulation** (e.g. AM),
* They can be **subtitled** for a specific **duration**, the **power** in Watts of the transmiter's antenna can be set, and the transmission can be **looped**.

How to supply DCS my own Sound Files ?

* Your sound files need to be encoded in **.ogg** or .wav,
* Your sound files should be **as tiny as possible**. It is suggested you encode in .ogg with low bitrate and sampling settings,
* They need to be added in .\l10n\DEFAULT\ in you .miz file (wich can be decompressed like a .zip file),
* For simplicty sake, you can **let DCS' Mission Editor add the file** itself, by creating a new Trigger with the action "Sound to Country", and choosing your sound file and a country you don't use in your mission.

Due to weird DCS quirks, **radio communications behave differently** if sent by a [UNIT](#unit-class-) or a [GROUP](#group-class-) or by any other [POSITIONABLE](#positionable-class-)

* If the transmitter is a [UNIT](#unit-class-) or a [GROUP](#group-class-), DCS will set the power of the transmission  automatically,
* If the transmitter is any other [POSITIONABLE](#positionable-class-), the transmisison can't be subtitled or looped.

Note that obviously, the **frequency** and the **modulation** of the transmission are important only if the players are piloting an **Advanced System Modelling** enabled aircraft,
like the A10C or the Mirage 2000C. They will **hear the transmission** if they are tuned on the **right frequency and modulation** (and if they are close enough - more on that below).
If a FC3 airacraft is used, it will **hear every communication, whatever the frequency and the modulation** is set to. The same is true for TACAN beacons. If your aircaft isn't compatible,
you won't hear/be able to use the TACAN beacon informations.



#####  Author: Hugues "Grey_Echo" Bousquet

## RADIO Class
<pre>
Inheritance : The RADIO Class inherits from the following parents :
BASE
	`-- RADIO
</pre>

#####  RADIO usage

There are 3 steps to a successful radio transmission.

* First, you need to **"add a [RADIO](#radio-class-) object** to your [POSITIONABLE](#positionable-class-). This is done using the POSITIONABLE-GetRadio- function,
* Then, you will **set the relevant parameters** to the transmission (see below),
* When done, you can actually **broadcast the transmission** (i.e. play the sound) with the [Broadcast](#broadcast-module-)() function.

Methods to set relevant parameters for both a [UNIT](#unit-class-) or a [GROUP](#group-class-) or any other [POSITIONABLE](#positionable-class-)

* [RADIO:SetFileName()](#radio-setfilename-filename) : Sets the file name of your sound file (e.g. "Noise.ogg"),
* [RADIO:SetFrequency()](#radio-setfrequency-frequency) : Sets the frequency of your transmission.
* [RADIO:SetModulation()](#radio-setmodulation-modulation) : Sets the modulation of your transmission.
* [RADIO:SetLoop()](#radio-setloop-loop) : Choose if you want the transmission to be looped. If you need your transmission to be looped, you might need a [BEACON](#beacon-class-) instead...

Additional Methods to set relevant parameters if the transmiter is a [UNIT](#unit-class-) or a [GROUP](#group-class-)

* [RADIO:SetSubtitle()](#radio-setsubtitle-subtitle-subtitleduration) : Set both the subtitle and its duration,
* [RADIO:NewUnitTransmission()](#radio-newunittransmission-filename-subtitle-subtitleduration-frequency-modulation-loop) : Shortcut to set all the relevant parameters in one method call

Additional Methods to set relevant parameters if the transmiter is any other [POSITIONABLE](#positionable-class-)

* [RADIO:SetPower()](#radio-setpower-power) : Sets the power of the antenna in Watts
* [RADIO:NewGenericTransmission()](#radio-newgenerictransmission-filename-frequency-modulation-power) : Shortcut to set all the relevant parameters in one method call

What is this power thing ?

* If your transmission is sent by a [POSITIONABLE](#positionable-class-) other than a [UNIT](#unit-class-) or a [GROUP](#group-class-), you can set the power of the antenna,
* Otherwise, DCS sets it automatically, depending on what's available on your Unit,
* If the player gets **too far** from the transmiter, or if the antenna is **too weak**, the transmission will **fade** and **become noisyer**,
* This an automated DCS calculation you have no say on,
* For reference, a standard VOR station has a 100W antenna, a standard AA TACAN has a 120W antenna, and civilian ATC's antenna usually range between 300 and 500W,
* Note that if the transmission has a subtitle, it will be readable, regardless of the quality of the transmission.


<h4> Attributes </h4>

* [POSITIONABLE](#positionable-class-) Positionable : The transmiter
* <u>String</u> FileName : Name of the sound file
* <u>Number</u> Frequency : Frequency of the transmission in Hz
* <u>Number</u> Modulation : Modulation of the transmission (either radio.modulation.AM or radio.modulation.FM)
* <u>String</u> Subtitle : Subtitle of the transmission
* <u>Number</u> SubtitleDuration : Duration of the Subtitle in seconds
* <u>Number</u> Power : Power of the antenna is Watts
* <u>Boolean</u> Loop


### RADIO:New(Positionable)
Create a new RADIO Object. This doesn't broadcast a transmission, though, use RADIO-Broadcast- to actually broadcast
If you want to create a RADIO, you probably should use POSITIONABLE-GetRadio- instead

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* [POSITIONABLE](#positionable-class-) Positionable : The [Positionable](#positionable-module-) that will receive radio capabilities.

<h4> Returns </h4>
* [RADIO](#radio-class-)

* <u>Nil</u>  If Positionable is invalid


### RADIO:SetFileName(FileName)
Check validity of the filename passed and sets RADIO.FileName

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>String</u> FileName : File name of the sound file (i.e. "Noise.ogg")

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetFrequency(Frequency)
Check validity of the frequency passed and sets RADIO.Frequency

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Number</u> Frequency : in MHz (Ranges allowed for radio transmissions in DCS : 30-88 / 108-152 / 225-400MHz)

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetModulation(Modulation)
Check validity of the frequency passed and sets RADIO.Modulation

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetPower(Power)
Check validity of the power passed and sets RADIO.Power

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Number</u> Power : in W

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetLoop(Loop)
``` lua
```
Check validity of the loop passed and sets RADIO.Loop

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Boolean</u> Loop

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetSubtitle(Subtitle, SubtitleDuration)
``` lua
-- create the broadcaster and attaches it a RADIO
local MyUnit = UNIT:FindByName("MyUnit")
local MyUnitRadio = MyUnit:GetRadio()

-- add a subtitle for the next transmission, which will be up for 10s
MyUnitRadio:SetSubtitle("My Subtitle, 10)
```
Check validity of the subtitle and the subtitleDuration  passed and sets RADIO.subtitle and RADIO.subtitleDuration
Both parameters are mandatory, since it wouldn't make much sense to change the Subtitle and not its duration

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>String</u> Subtitle
* <u>Number</u> SubtitleDuration : in s

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:NewGenericTransmission(FileName, Frequency, Modulation, Power)
Create a new transmission, that is to say, populate the RADIO with relevant data
In this function the data is especially relevant if the broadcaster is anything but a UNIT or a GROUP,
but it will work with a UNIT or a GROUP anyway.
Only the [RADIO](#radio-class-)
and the Filename are mandatory

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>String</u> FileName
* <u>Number</u> Frequency : in MHz
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM
* <u>Number</u> Power : in W

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:NewUnitTransmission(FileName, Subtitle, SubtitleDuration, Frequency, Modulation, Loop)
Create a new transmission, that is to say, populate the RADIO with relevant data
In this function the data is especially relevant if the broadcaster is a UNIT or a GROUP,
but it will work for any [POSITIONABLE](#positionable-class-).
Only the RADIO and the Filename are mandatory.

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>String</u> FileName
* <u>String</u> Subtitle
* <u>Number</u> SubtitleDuration : in s
* <u>Number</u> Frequency : in MHz
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM
* <u>Boolean</u> Loop

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:Broadcast()
Actually Broadcast the transmission
* The Radio has to be populated with the new transmission before broadcasting.
* Please use RADIO setters or either [RADIO:NewGenericTransmission()](#radio-newgenerictransmission-filename-frequency-modulation-power) or [RADIO:NewUnitTransmission()](#radio-newunittransmission-filename-subtitle-subtitleduration-frequency-modulation-loop)
* This class is in fact pretty smart, it determines the right DCS function to use depending on the type of POSITIONABLE
* If the POSITIONABLE is not a UNIT or a GROUP, we use the generic (but limited) trigger.action.radioTransmission()
* If the POSITIONABLE is a UNIT or a GROUP, we use the "TransmitMessage" Command
* If your POSITIONABLE is a UNIT or a GROUP, the Power is ignored.
* If your POSITIONABLE is not a UNIT or a GROUP, the Subtitle, SubtitleDuration are ignored

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:StopBroadcast()
Stops a transmission
This function is especially usefull to stop the broadcast of looped transmissions

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self

<h4> Returns </h4>
* [RADIO](#radio-class-)



## BEACON Class
<pre>
Inheritance : The BEACON Class inherits from the following parents :
BASE
	`-- BEACON
</pre>

After attaching a [BEACON](#beacon-class-) to your [POSITIONABLE](#positionable-class-), you need to select the right function to activate the kind of beacon you want.
There are two types of BEACONs available : the AA TACAN Beacon and the general purpose Radio Beacon.
Note that in both case, you can set an optional parameter : the `BeaconDuration`. This can be very usefull to simulate the battery time if your BEACON is
attach to a cargo crate, for exemple.

#####  AA TACAN Beacon usage

This beacon only works with airborne [UNIT](#unit-class-) or a [GROUP](#group-class-). Use [BEACON:AATACAN()](#beacon-aatacan-tacanchannel-message-bearing-beaconduration) to set the beacon parameters and start the beacon.
Use @#BEACON:StopAATACAN}() to stop it.

#####  General Purpose Radio Beacon usage

This beacon will work with any [POSITIONABLE](#positionable-class-), but **it won't follow the [POSITIONABLE](#positionable-class-)** ! This means that you should only use it with
[POSITIONABLE](#positionable-class-) that don't move, or move very slowly. Use [BEACON:RadioBeacon()](#beacon-radiobeacon-filename-frequency-modulation-power-beaconduration) to set the beacon parameters and start the beacon.
Use BEACON-StopRadioBeacon- to stop it.



### BEACON:New(Positionable)
Create a new BEACON Object. This doesn't activate the beacon, though, use [BEACON:AATACAN()](#beacon-aatacan-tacanchannel-message-bearing-beaconduration) or BEACON-Generic-
If you want to create a BEACON, you probably should use POSITIONABLE-GetBeacon- instead.

<h4> Parameters </h4>
* [BEACON](#beacon-class-)
self
* [POSITIONABLE](#positionable-class-) Positionable : The [Positionable](#positionable-module-) that will receive radio capabilities.

<h4> Returns </h4>
* [BEACON](#beacon-class-)

* <u>Nil</u>  If Positionable is invalid


### BEACON:AATACAN(TACANChannel, Message, Bearing, BeaconDuration)
``` lua
-- Let's create a TACAN Beacon for a tanker
local myUnit = UNIT:FindByName("MyUnit")
local myBeacon = myUnit:GetBeacon() -- Creates the beacon

myBeacon:AATACAN(20, "TEXACO", true) -- Activate the beacon
```
Activates a TACAN BEACON on an Aircraft.

<h4> Parameters </h4>
* [BEACON](#beacon-class-)
self
* <u>Number</u> TACANChannel : (the "10" part in "10Y"). Note that AA TACAN are only available on Y Channels
* <u>String</u> Message : The Message that is going to be coded in Morse and broadcasted by the beacon
* <u>Boolean</u> Bearing : Can the BEACON be homed on ?
* <u>Number</u> BeaconDuration : How long will the beacon last in seconds. Omit for forever.

<h4> Returns </h4>
* [BEACON](#beacon-class-)



### BEACON:StopAATACAN()
Stops the AA TACAN BEACON

<h4> Parameters </h4>
* [BEACON](#beacon-class-)
self

<h4> Returns </h4>
* [BEACON](#beacon-class-)



### BEACON:RadioBeacon(FileName, Frequency, Modulation, Power, BeaconDuration)
``` lua
-- Let's create a beacon for a unit in distress.
-- Frequency will be 40MHz FM (home-able by a Huey's AN/ARC-131)
-- The beacon they use is battery-powered, and only lasts for 5 min
local UnitInDistress = UNIT:FindByName("Unit1")
local UnitBeacon = UnitInDistress:GetBeacon()

-- Set the beacon and start it
UnitBeacon:RadioBeacon("MySoundFileSOS.ogg", 40, radio.modulation.FM, 20, 5*60)
```
Activates a general pupose Radio Beacon
This uses the very generic singleton function "trigger.action.radioTransmission()" provided by DCS to broadcast a sound file on a specific frequency.
Although any frequency could be used, only 2 DCS Modules can home on radio beacons at the time of writing : the Huey and the Mi-8.
They can home in on these specific frequencies :

* **Mi8**
* R-828 -> 20-60MHz
* ARKUD -> 100-150MHz (canal 1 : 114166, canal 2 : 114333, canal 3 : 114583, canal 4 : 121500, canal 5 : 123100, canal 6 : 124100) AM
* ARK9 -> 150-1300KHz
* **Huey**
* AN/ARC-131 -> 30-76 Mhz FM


<h4> Parameters </h4>
* [BEACON](#beacon-class-)
self
* <u>String</u> FileName : The name of the audio file
* <u>Number</u> Frequency : in MHz
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM
* <u>Number</u> Power : in W
* <u>Number</u> BeaconDuration : How long will the beacon last in seconds. Omit for forever.

<h4> Returns </h4>
* [BEACON](#beacon-class-)



### BEACON:StopRadioBeacon()
Stops the AA TACAN BEACON

<h4> Parameters </h4>
* [BEACON](#beacon-class-)
self

<h4> Returns </h4>
* [BEACON](#beacon-class-)



