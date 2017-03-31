---
layout: post
title: Alpha version released!
date: 2016-02-11 18:09:38.000000000 -05:00
type: post
author: Cameron
---

After a short sprint last week, we've finally celebrated the first release of YACS! We consider this to be an alpha release, or a minimum viable product. In other words, you can now use YACS to schedule courses, even if it doesn't have all its features in place just yet.

This past week focused on resolving our last open issues, including three big ones: schedule rendering, the search, and automatic database updates. Apart from that, we took care of small details that took less work but were still required for this release. (Such as displaying the periods associated with a section on the course list.)

The schedule view was the last crucial component of the UI, and it was posing more of a challenge than expected. We wanted to make it simple, powerful, and flexible enough to handle most types of schedules, not just well-ordered class periods. I rejected the idea of overlaying period `1` elements on a grid early on. Although the old YACS does this, the method forces you to use ugly Javascript and CSS to position everything well. Plus, it removes semantic meaning from the courses. My next attempt was with HTML tables, like I had used to make mockup schedules, but that attempt fell flat. This was because we were trying to display schedules with a 10-minute resolution time, and there was no good way to solve that by using the horizontally dominant tables. What ended up working was a series of lists representing the days in the schedule, rendered by CSS into the familiar grid form. This gave us a resolution of 5 minutes and preserved the HTML structure of the schedule. The only tradeoff this caused was that we had to define a font size for this page to set element heights correctly. Richie will be posting later this week about his work last week, especially the search.

We have two more milestones laid out right now - an RPI Release and a General Release. The former is tentatively our beta release and represents the point at which YACS is ready to be released to the general RPI student body. By that point, we should have implemented all of its major features and performance and scalability enhancements should be well underway. Backend examples include cleaning up and caching the API; frontend examples include a way to deselect courses quickly and adding a concept of page history. We're hoping to make this release before the end of the month.

The General Release is planned for the end of the semester, and that'll be the point when YACS is really ready to release to the general public. By that point, we hope to have fixed nearly all bugs and we should be working on portability, scalability, documentation, code quality, and configuration.

Now that we've released our alpha, we're looking to open YACS to testing from RCOS students so we can identify problems that didn't come up during our development. I'm anticipating that many problems and complaints will come out of this to keep us busy for the time being, so keep an eye out for more updates here.

![departments screenshot](assets/images/screen-shot-2016-02-11-at-09-13-231.png)
![courses screenshot](assets/images/screen-shot-2016-02-11-at-09-14-39.png)
![schedule screenshot](assets/images/screen-shot-2016-02-11-at-09-15-47.png)

(Note that these screenshots show Spring 2016 courses. The registrar hasn't released next semester's data yet.)

