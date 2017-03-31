---
layout: post
title: Fall 2016 Closing Thoughts
date: 2016-12-09 14:19:56.000000000 -05:00
type: post
author: Ayushi
---

From joining the YACS team at the beginning of the semester and diving into my first open source project, to the conclusion of this term, I can definitely say I have learned a lot. I worked with a very talented group of people who brought diverse skill sets to the table. Additionally, I was quite lucky to have an amazing mentor for my first web development project around whom I felt comfortable asking plenty of questions. I was definitely intimidated by the amount of existing code and how to get involved, but was pleasantly surprised to see how easily I could make contributions and how much fun I had developing. This entire experience has sparked my interest!

My major focus this semester was on Design and Front-End, and User Experience Research. I worked on several iterations of wire frames and mock-ups for a new YACS course view design. I also sent out a User Research survey to hear what students who use YACS think about the site, and how they would like to see it improved!

There were quite a few responses from the survey, and the spreadsheet with all the feedback gathered so far is [here](https://drive.google.com/file/d/0B2sDOlcmkZDTbUhpbGlEVXhOZjA/view?usp=sharing). I will compile the feedback to combine similar requests, and make issues for the requests that are very popular and feasible.

While we were waiting on feedback, I worked on adding filler text to courses that do not have a description (which we also need as part of the future new design implementation). I sorted the periods of the sections chronologically. I attempted to do this in the front-end at first, but this greatly compromised performance. I removed those changes and instead implemented the change on the back-end, so sorting would be done just once and changes made right to the database. This was great in the end, because I had to learn Ruby and some Rails concepts, and even implemented some unit tests. I had the opportunity to work with a diverse technology stack! I am currently finishing up a WIP Pull Request to create a double column responsive view for course listings to allow for more content access to the user.

Lastly a major part of User Experience that I really wanted to focus on was Accessibility. When all our new designs are implemented, we want the page to be 508 compliant and accessible to all audiences. I did research on the standards we want to meet, and once major changes are implemented, we can use an Accessibility review tool (Wave) to see what we should make.

I intend on continuing the new designs implementations for the courses view, and working on mock-ups for the schedule view and conflict functionality, as they are highly in demand from the feedback we gathered. I look forward to completing the two column course view fully with correct styling and alignment, and then making the periods view more intuitive to match the mock-ups. After this I will implement the constant size course elements that can expand and collapse!

This semester has been a wonderful experience, and I am very eager to take part in RCOS next semester and to keep working on Design, Front-End Development, and User Research for YACS in the meantime!
