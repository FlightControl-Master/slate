# Tasking.DetectionManager Module
This module contains the DETECTION_MANAGER class and derived classes.



##### 1) [DETECTION_MANAGER](#detection_manager-class-) class, extends [FSM](#fsm-class-)

The [DETECTION_MANAGER](#detection_manager-class-) class defines the core functions to report detected objects to groups.
Reportings can be done in several manners, and it is up to the derived classes if DETECTION_MANAGER to model the reporting behaviour.

##### 1.1) DETECTION_MANAGER constructor:

* [DETECTION_MANAGER:New()](#detection_manager-new-setgroup-detection): Create a new DETECTION_MANAGER instance.

##### 1.2) DETECTION_MANAGER reporting:

Derived DETECTION_MANAGER classes will reports detected units using the method DETECTION_MANAGER-ReportDetected-. This method implements polymorphic behaviour.

The time interval in seconds of the reporting can be changed using the methods [DETECTION_MANAGER:SetReportInterval()](#detection_manager-setreportinterval-reportinterval).
To control how long a reporting message is displayed, use [DETECTION_MANAGER:SetReportDisplayTime()](#detection_manager-setreportdisplaytime-reportdisplaytime).
Derived classes need to implement the method DETECTION_MANAGER-GetReportDisplayTime- to use the correct display time for displayed messages during a report.

Reporting can be started and stopped using the methods DETECTION_MANAGER-StartReporting- and [DETECTION_REPORTING:New()](#detection_reporting-new-setgroup-detection) respectively.
If an ad-hoc report is requested, use the method @{DetectionManager#DETECTION_MANAGER#ReportNow}().

The default reporting interval is every 60 seconds. The reporting messages are displayed 15 seconds.



##### 2) [DETECTION_REPORTING](#detection_reporting-class-) class, extends [DETECTION_MANAGER](#detection_manager-class-)

The [DETECTION_REPORTING](#detection_reporting-class-) class implements detected units reporting. Reporting can be controlled using the reporting methods available in the [DETECTION_MANAGER](#detection_manager-class-) class.

##### 2.1) DETECTION_REPORTING constructor:

The @{DetectionManager#DETECTION_REPORTING.New}() method creates a new DETECTION_REPORTING instance.




#####  Contributions: Mechanist, Prof_Hilactic, FlightControl - Concept & Testing
#####  Author: FlightControl - Framework Design &  Programming

## DETECTION_MANAGER Class
<pre>
Inheritance : The DETECTION_MANAGER Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_MANAGER
</pre>

<h4> Attributes </h4>

* [SET_GROUP](#set_group-class-) SetGroup : The groups to which the FAC will report to.
* [DETECTION_BASE](#detection_base-class-) Detection : The DETECTION_BASE object that is used to report the detected objects.


### DETECTION_MANAGER:New(SetGroup, Detection)
FAC constructor.

<h4> Parameters </h4>
* [DETECTION_MANAGER](#detection_manager-class-)
self
* [SET_GROUP](#set_group-class-) SetGroup
* [DETECTION_BASE](#detection_base-class-) Detection

<h4> Returns </h4>
* [DETECTION_MANAGER](#detection_manager-class-)



### DETECTION_MANAGER:SetReportInterval(ReportInterval)
Set the reporting time interval.

<h4> Parameters </h4>
* [DETECTION_MANAGER](#detection_manager-class-)
self
* <u>Number</u> ReportInterval : The interval in seconds when a report needs to be done.

<h4> Returns </h4>
* [DETECTION_MANAGER](#detection_manager-class-)



### DETECTION_MANAGER:SetReportDisplayTime(ReportDisplayTime)
Set the reporting message display time.

<h4> Parameters </h4>
* [DETECTION_MANAGER](#detection_manager-class-)
self
* <u>Number</u> ReportDisplayTime : The display time in seconds when a report needs to be done.

<h4> Returns </h4>
* [DETECTION_MANAGER](#detection_manager-class-)



### DETECTION_MANAGER:GetReportDisplayTime()
Get the reporting message display time.

<h4> Parameters </h4>
* [DETECTION_MANAGER](#detection_manager-class-)
self

<h4> Returns </h4>
* <u>Number</u>  ReportDisplayTime The display time in seconds when a report needs to be done.


### DETECTION_MANAGER:ProcessDetected(Detection)
Reports the detected items to the [SET_GROUP](#set_group-class-).

<h4> Parameters </h4>
* [DETECTION_MANAGER](#detection_manager-class-)
self
* [DETECTION_BASE](#detection_base-class-) Detection

<h4> Returns </h4>
* [DETECTION_MANAGER](#detection_manager-class-)



## DETECTION_REPORTING Class
<pre>
Inheritance : The DETECTION_REPORTING Class inherits from the following parents :
BASE
	`-- FSM
		`-- DETECTION_MANAGER
			`-- DETECTION_REPORTING
</pre>

<h4> Attributes </h4>

* [SET_GROUP](#set_group-class-) SetGroup : The groups to which the FAC will report to.
* [DETECTION_BASE](#detection_base-class-) Detection : The DETECTION_BASE object that is used to report the detected objects.


### DETECTION_REPORTING:New(SetGroup, Detection)
DETECTION_REPORTING constructor.

<h4> Parameters </h4>
* [DETECTION_REPORTING](#detection_reporting-class-)
self
* [SET_GROUP](#set_group-class-) SetGroup
* [DETECTION_AREAS](#detection_areas-class-) Detection

<h4> Returns </h4>
* [DETECTION_REPORTING](#detection_reporting-class-)



### DETECTION_REPORTING:GetDetectedItemsText(DetectedSet)
Creates a string of the detected items in a [Detection](#detection-module-).

<h4> Parameters </h4>
* [DETECTION_MANAGER](#detection_manager-class-)
self
* [SET_UNIT](#set_unit-class-) DetectedSet : The detected Set created by the [DETECTION_BASE](#detection_base-class-) object.

<h4> Returns </h4>
* [DETECTION_MANAGER](#detection_manager-class-)



### DETECTION_REPORTING:ProcessDetected(Group, Detection)
Reports the detected items to the [SET_GROUP](#set_group-class-).

<h4> Parameters </h4>
* [DETECTION_REPORTING](#detection_reporting-class-)
self
* [GROUP](#group-class-) Group : The [Group](#group-module-) object to where the report needs to go.
* [DETECTION_AREAS](#detection_areas-class-) Detection : The detection created by the [DETECTION_BASE](#detection_base-class-) object.

<h4> Returns </h4>
* <u>Boolean</u>  Return true if you want the reporting to continue... false will cancel the reporting loop.


