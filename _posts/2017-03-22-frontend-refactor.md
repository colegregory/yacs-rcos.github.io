---
title: Frontend Refactor
date: 2017-03-22 15:23:44 -04:00
type: post
author: Ayushi
---

During a group meeting we were discussing new features we wanted to implement in the future, and also our hope of implementing design changes. 

We realized that some of the new features would be quite difficult and time consuming to implement and render properly on the frontend as it is now. There has been much talk of potentially refactoring the frontend and making it its own application, and we realized there would be no better time than now to streamline this process! 

The current implementation uses a hacked together framework created by one of our beloved developers, and as much of a valiant effort the creation, the homegrown framework turned out to be quite difficult to make changes to. In the interest of having future developers contribute to YACS and the new features we want to implement, we decided to move full force ahead in the refactor. 

Our ultimate goal is to make the frontend an independent application, that can be configured, built, and tested on its own. Because its independence will allow it to be decoupled from the backend, the application will will be separately deployable, and also allow for separation in updates. The goal is to allow the web application portion of YACS to be plug and play.

Because it will be decoupled and independent, the web app will have serious freedom. We can scrap the front end entirely with ease and at any time, without causing additional integration overhead. This might also prove to be very useful if and when YACS expands. External entities will easily be able to modify or entirely change the look and feel of the application, while still maintaining the backend and algorithmic functionality. 

We're excited to try various technologies in this refactor, and the team is currently debating the use of various popular frameworks. We'll provide an update on how these technologies suit us in the future. All in all, our ultimate hope is to streamline future updates, features, and new designs.

- Ayushi :)