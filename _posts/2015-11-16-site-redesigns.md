---
layout: post
title: Site redesigns
date: 2015-11-16 18:07:48.000000000 -05:00
type: post
author: Cameron
---

We're making some changes to the YACS user interface after hearing suggestions from students. YACS will now feature a fixed navigation bar with three elements: a link to the home page which lists all the departments, a search bar which will bring up courses matching the search terms, and a link to the schedule page which displays combinations of selected courses. Our goal for these redesigns is to keep the "feel" of old YACS while improving the user experience.

The motivation for this is that we want to emphasize the use of the search bar as the main course-finding feature. In the existing version of YACS, if you want to select a course that isn't currently in the list, most people click back to the list of departments, then back into the department you want to look at. That's very time-consuming and slow (since there's quite a lot of lag in loading a course list). We think it's better to have an easily accessible search to bring up new courses.

The home page will still list a clickable list of departments, but they will be organized into the schools they are a part of.

The course lists will use color highlighting to show selected courses instead of checkboxes, and the courses themselves will have a slightly tweaked design. It won't block you from selecting conflicting courses anymore; it will merely notify you of the conflict, and two schedules will be generated with one conflicting course absent in each.

The schedule will remain mostly the same, but it will use a pure HTML table to display the courses rather than divs floating on top of a table. This will make the page resize much better.

This is the sketch I drew up with our proposed UI:

![site mockup](assets/yacs_interface_proposed_final_sketch.png)

