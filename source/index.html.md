---
title: Moose API Reference

toc_footers:
  - <a href='http://flightcontrol-master.github.io/MOOSE/'>Moose Main Website</a>
  - <a href='https://github.com/FlightControl-Master/MOOSE/releases'>Download Latest Release</a>
  - <a href='https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases'>Download Test Missions</a>
  - <a href='https://www.youtube.com/channel/UCjrA9j5LQoWsG4SpS8i79Qg'>Moose on Youtube</a>
  - <a href='https://flightcontrol.slack.com/'>Moose on Slack.com</a>
  - <a href='https://github.com/FlightControl-Master/MOOSE'>Moose on GitHub</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - Actions.Account
  - Actions.Assign
  - Actions.Process_JTAC
  - Actions.Process_Pickup
  - Actions.Route
  - Actions.Smoke
  - AI.AI_Balancer
  - AI.AI_Cap
  - AI.AI_Cas
  - AI.AI_Patrol
  - Core.Base
  - Core.Cargo
  - Core.Database
  - Core.Event
  - Core.Fsm
  - Core.Menu
  - Core.Message
  - Core.Point
  - Core.Radio
  - Core.ScheduleDispatcher
  - Core.Scheduler
  - Core.Set
  - Core.SpawnStatic
  - Core.Spot
  - Core.Zone
  - Dcs.DCSAirbase
  - Dcs.DCScoalition
  - Dcs.DCSCoalitionObject
  - Dcs.DCSCommand
  - Dcs.DCSController
  - Dcs.DCScountry
  - Dcs.DCSGroup
  - Dcs.DCSObject
  - Dcs.DCSStaticObject
  - Dcs.DCSTask
  - Dcs.DCSTime
  - Dcs.DCStimer
  - Dcs.DCStrigger
  - Dcs.DCSTypes
  - Dcs.DCSUnit
  - Dcs.DCSVec3
  - Dcs.DCSWorld
  - Dcs.DCSZone
  - Dcs.env
  - Dcs.land
  - Dcs.StaticObject
  - Functional.AirbasePolice
  - Functional.CleanUp
  - Functional.Designate
  - Functional.Detection
  - Functional.Escort
  - Functional.MissileTrainer
  - Functional.Movement
  - Functional.Scoring
  - Functional.Sead
  - Functional.Spawn
  - Tasking.CommandCenter
  - Tasking.DetectionManager
  - Tasking.Mission
  - Tasking.Task
  - Tasking.Task_A2G
  - Tasking.Task_A2G_Dispatcher
  - Tasking.Task_Cargo
  - Tasking.Task_PICKUP
  - Utilities.routines
  - Utilities.Utils
  - Wrapper.Airbase
  - Wrapper.Client
  - Wrapper.Controllable
  - Wrapper.Group
  - Wrapper.Identifiable
  - Wrapper.Object
  - Wrapper.Positionable
  - Wrapper.Scenery
  - Wrapper.Static
  - Wrapper.Unit

search: true
---

# MOOSE framework


MOOSE is a **M**ission **O**bject **O**riented **S**cripting **E**nvironment, and is meant for mission designers and mission hosters.
It allows to quickly setup complex missions using pre-scripted scenarios using the available classes within the MOOSE Framework.
MOOSE works with DCS world 1.5. and 2.0.

#### MOOSE Framework Goal

The goal of MOOSE is to allow mission designers to enhance their scripting with mission orchestration objects, which can be instantiated from defined classes within the framework. This will allow to write mission scripts with minimal code embedded. Of course, the richness of the framework will determine the richness of the misson scenarios. 
The MOOSE is a service that is produced while being consumed ... , it will evolve further as more classes are developed for the framework, and as more users are using it.
MOOSE is not a one-man show, it is a collaborative effort and meant to evolve within a growing community around the framework.
Within the community, key users will start supporting, documenting, explaining and even creating new classes for the framework.
It is the ambition to grow this framework as a de-facto standard for mission designers to use.

#### MOOSE Main Site

[Click on this link to browse to the MOOSE main web page.](http://flightcontrol-master.github.io/MOOSE)
Documentation on the MOOSE class hierarchy, usage guides and background information can be found here for normal users, beta testers and contributors.

#### MOOSE Missions

MOOSE comes with [demonstration missions](https://github.com/FlightControl-Master/MOOSE_MISSIONS) that you can use to understand the mechanisms how to use the classes within MOOSE.

#### MOOSE Youtube Channel

MOOSE has a [broadcast and training channel on YouTube](https://www.youtube.com/channel/UCjrA9j5LQoWsG4SpS8i79Qg) with various channels that you can watch.

#### MOOSE on [Slack.Com](https://flightcontrol.slack.com)

MOOSE has a living (chat and video) community of users, beta testers and contributors. The gathering point is a service provided by slack.com.
If you want to join this community, send an email to flightcontrol_moose@outlook.com. You'll receive the invitation from slack, follow the process
and you'll be on board in no time.
