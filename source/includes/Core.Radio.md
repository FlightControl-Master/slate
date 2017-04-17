# Core.Radio Module
**Core** - The RADIO class is responsible for **transmitting radio communications**.

![Banner Image](/includes/Pictures/RADIO/Dia1.JPG)



What are radio communications in DCS ?

* Radio transmissions consist of **sound files** that are broadcasted on a specific **frequency** (e.g. 115MHz) and **modulation** (e.g. AM),
* They can be **subtitled** for a specific **duration**, the **power** in Watts of the transmiter's antenna can be set, and the transmission can be **looped**.

How to supply DCS my own Sound Files ?

* Your sound files need to be encoded in **.ogg** or .wav,
* Your sound files should be **as tiny as possible**. It is suggested you encode in .ogg with low bitrate and sampling settings,
* They need to be added in .\l10n\DEFAULT\ in you .miz file (wich can be decompressed like a .zip file),
* For simplicty sake, you can **let DCS' Mission Editor add the file** itself, by creating a new Trigger with the action "Sound to Country", and choosing your sound file and a country you don't use in your mission.

Due to weird DCS quirks, **radio communications behave differently** if sent by a [UNIT](#unit-class) or a [GROUP](#group-class) or by any other [POSITIONABLE](#positionable-class)

* If the transmitter is a [UNIT](#unit-class) or a [GROUP](#group-class), DCS will set the power of the transmission  automatically,
* If the transmitter is any other [POSITIONABLE](#positionable-class), the transmisison can't be subtitled or looped.

Note that obviously, the **frequency** and the **modulation** of the transmission are important only if the players are piloting an **Advanced System Modelling** enabled aircraft,
like the A10C or the Mirage 2000C. They will **hear the transmission** if they are tuned on the **right frequency and modulation** (and if they are close enough - more on that below).
If a FC3 airacraft is used, it will **hear every communication, whatever the frequency and the modulation** is set to.



#####  Author: Hugues "Grey_Echo" Bousquet

## RADIO Class
<pre>
Inheritance : The RADIO Class inherits from the following parents :
BASE
	`-- RADIO
</pre>

#####  1.1) RADIO usage

There are 3 steps to a successful radio transmission.

* First, you need to **"add a [RADIO](#radio-class) object** to your [POSITIONABLE](#positionable-class). This is done using the [POSITIONABLE:GetRadio()](#positionable-getradio) function,
* Then, you will **set the relevant parameters** to the transmission (see below),
* When done, you can actually **broadcast the transmission** (i.e. play the sound) with the [Broadcast](#broadcast-module)() function.

Methods to set relevant parameters for both a [UNIT](#unit-class) or a [GROUP](#group-class) or any other [POSITIONABLE](#positionable-class)

* [RADIO:SetFileName()](#radio-setfilename-filename) : Sets the file name of your sound file (e.g. "Noise.ogg"),
* [RADIO:SetFrequency()](#radio-setfrequency-frequency) : Sets the frequency of your transmission,
* [RADIO:SetModulation()](#radio-setmodulation-modulation) : Sets the modulation of your transmission.

Additional Methods to set relevant parameters if the transmiter is a [UNIT](#unit-class) or a [GROUP](#group-class)

* [RADIO:SetLoop()](#radio-setloop-loop) : Choose if you want the transmission to be looped,
* [RADIO:SetSubtitle()](#radio-setsubtitle-subtitle-subtitleduration) : Set both the subtitle and its duration,
* [RADIO:NewUnitTransmission()](#radio-newunittransmission-filename-subtitle-subtitleduration-frequency-modulation-loop) : Shortcut to set all the relevant parameters in one method call

Additional Methods to set relevant parameters if the transmiter is any other [POSITIONABLE](#positionable-class)

* [RADIO:SetPower()](#radio-setpower-power) : Sets the power of the antenna in Watts
* [RADIO:NewGenericTransmission()](#radio-newgenerictransmission-filename-frequency-modulation-power) : Shortcut to set all the relevant parameters in one method call

What is this power thing ?

* If your transmission is sent by a [POSITIONABLE](#positionable-class) other than a [UNIT](#unit-class) or a [GROUP](#group-class), you can set the power of the antenna,
* Otherwise, DCS sets it automatically, depending on what's available on your Unit,
* If the player gets **too far** from the transmiter, or if the antenna is **too weak**, the transmission will **fade** and **become noisyer**,
* This an automated DCS calculation you have no say on,
* For reference, a standard VOR station has a 100W antenna, a standard AA TACAN has a 120W antenna, and civilian ATC's antenna usually range between 300 and 500W,
* Note that if the transmission has a subtitle, it will be readable, regardless of the quality of the transmission.


<h4> Attributes </h4>

* [POSITIONABLE](#positionable-class) Positionable : The transmiter
* <u>String</u> FileName : Name of the sound file
* <u>Number</u> Frequency : Frequency of the transmission in Hz
* <u>Number</u> Modulation : Modulation of the transmission (either radio.modulation.AM or radio.modulation.FM)
* <u>String</u> Subtitle : Subtitle of the transmission
* <u>Number</u> SubtitleDuration : Duration of the Subtitle in seconds
* <u>Number</u> Power : Power of the antenna is Watts
* <u>Boolean</u> Loop


### RADIO:New(Positionable)
``` lua
-- If you want to create a RADIO, you probably should use [POSITIONABLE:GetRadio()](#positionable-getradio) instead
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* [POSITIONABLE](#positionable-class) Positionable : The [Positionable](#positionable-module) that will receive radio capabilities.

<h4> Returns </h4>
* [RADIO](#radio-class)
Radio
* <u>Nil</u> If : Positionable is invalid


### RADIO:SetFileName(FileName)

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>String</u> FileName : File name of the sound file (i.e. "Noise.ogg")

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:SetFrequency(Frequency)

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>Number</u> Frequency : in MHz (Ranges allowed for radio transmissions in DCS : 30-88 / 108-152 / 225-400MHz)

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:SetModulation(Modulation)

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:SetPower(Power)

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>Number</u> Power : in W

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:SetLoop(Loop)
``` lua
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>Boolean</u> Loop

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:SetSubtitle(Subtitle, SubtitleDuration)
``` lua
-- Both parameters are mandatory, since it wouldn't make much sense to change the Subtitle and not its duration
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>String</u> Subtitle
* <u>Number</u> SubtitleDuration : in s

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:NewGenericTransmission(FileName, Frequency, Modulation, Power)
``` lua
-- In this function the data is especially relevant if the broadcaster is anything but a UNIT or a GROUP,
but it will work with a UNIT or a GROUP anyway
-- Only the RADIO and the Filename are mandatory
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>String</u> FileName
* <u>Number</u> Frequency : in MHz
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM
* <u>Number</u> Power : in W

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:NewUnitTransmission(FileName, Subtitle, SubtitleDuration, Frequency, Modulation, Loop)
``` lua
-- In this function the data is especially relevant if the broadcaster is a UNIT or a GROUP,
but it will work for any POSITIONABLE
-- Only the RADIO and the Filename are mandatory
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self
* <u>String</u> FileName
* <u>String</u> Subtitle
* <u>Number</u> SubtitleDuration : in s
* <u>Number</u> Frequency : in MHz
* <u>Number</u> Modulation : either radio.modulation.AM or radio.modulation.FM
* <u>Boolean</u> Loop

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:Broadcast()
``` lua
-- The Radio has to be populated with the new transmission before broadcasting.
-- Please use RADIO setters or either [RADIO:NewGenericTransmission()](#radio-newgenerictransmission-filename-frequency-modulation-power) or [RADIO:NewUnitTransmission()](#radio-newunittransmission-filename-subtitle-subtitleduration-frequency-modulation-loop)
-- This class is in fact pretty smart, it determines the right DCS function to use depending on the type of POSITIONABLE
-- If the POSITIONABLE is not a UNIT or a GROUP, we use the generic (but limited) trigger.action.radioTransmission()
-- If the POSITIONABLE is a UNIT or a GROUP, we use the "TransmitMessage" Command
-- If your POSITIONABLE is a UNIT or a GROUP, the Power is ignored.
-- If your POSITIONABLE is not a UNIT or a GROUP, the Subtitle, SubtitleDuration and Loop are ignored
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self

<h4> Returns </h4>
* [RADIO](#radio-class)
self


### RADIO:StopBroadcast()
``` lua
-- Especially usefull to stop the broadcast of looped transmissions
-- Only works with broadcasts from UNIT or GROUP
```

<h4> Parameters </h4>
* [RADIO](#radio-class)
self

<h4> Returns </h4>
* [RADIO](#radio-class)
self


