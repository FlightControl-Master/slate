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

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* [POSITIONABLE](#positionable-class-) Positionable : The [Positionable](#positionable-module-) that will receive radio capabilities.

<h4> Returns </h4>
* [RADIO](#radio-class-)

* <u>Nil</u>  If Positionable is invalid


### RADIO:SetFileName(FileName)

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>String</u> FileName : File name of the sound file (i.e. "Noise.ogg")

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetFrequency(Frequency)

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Number</u> Frequency : in MHz (Ranges allowed for radio transmissions in DCS : 30-88 / 108-152 / 225-400MHz)

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetModulation(Modulation)

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetPower(Power)

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>Number</u> Power : in W

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:SetLoop(Loop)
``` lua
```

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

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self
* <u>String</u> Subtitle
* <u>Number</u> SubtitleDuration : in s

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:NewGenericTransmission(FileName, Frequency, Modulation, Power)

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

<h4> Parameters </h4>
* [RADIO](#radio-class-)
self

<h4> Returns </h4>
* [RADIO](#radio-class-)



### RADIO:StopBroadcast()

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

This beacon only works with airborne [UNIT](#unit-class-) or a [GROUP](#group-class-). Use @{#BEACON:AATACAN}() to set the beacon parameters and start the beacon.
Use @#BEACON:StopAATACAN}() to stop it.

#####  General Purpose Radio Beacon usage

This beacon will work with any [POSITIONABLE](#positionable-class-), but **it won't follow the [POSITIONABLE](#positionable-class-)** ! This means that you should only use it with
[POSITIONABLE](#positionable-class-) that don't move, or move very slowly. Use @{#BEACON:RadioBeacon}() to set the beacon parameters and start the beacon.
Use @{#BEACON:StopRadioBeacon}() to stop it.



### BEACON:New(Positionable)

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

<h4> Parameters </h4>
* [BEACON](#beacon-class-)
self

<h4> Returns </h4>
* [BEACON](#beacon-class-)



