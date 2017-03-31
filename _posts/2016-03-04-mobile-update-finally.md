---
layout: post
title: MOBILE UPDATE FINALLY
date: 2016-03-04 20:56:59.000000000 -05:00
type: post
author: James
---

Aesthetically, everything seems to be coming in order. The only things I might add are icons or symbols for the tab bar buttons at the bottom. I have the API working with a network session manager, the only things i have left are the remaining get and post functions. Which are getCoursesForDepartments = (GET /api/v5/courses.json?department_id=<x>), getSectionsForCourses = (GET /api/v5/sections.json?course_id=x). With those two functions, the application will (from the picture below) transition from a view of departments to a view of courses for those departments with their sections shown beneath each course. For the Grid/Calendar portion of the application, I'm going to implement something from scratch similar to https://github.com/muhku/calendar-ui  , but without all the extra features.

![departments screenshot](assets/screen-shot-2016-03-04-at-3-42-15-pm.png){: width="300"}

