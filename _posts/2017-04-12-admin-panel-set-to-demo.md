---
layout:post
type: post
title: Admin Panel Set to Demo Next Week!
date: 2017-04-12 15:29:15 -0400
author: Kathleen
---

This past weekend, I attended Bitcamp at the University of Maryland. While Bitcamp was LOTS of fun minus the internet not working, this meant that I could not be with the rest of the team for the presentation on Friday. In order to make up for this, I am set to demo my admin panel on April 21 instead.

Testing has been going rather rocky lately, as I have always been running into this one bug that wants a Hash rather than ["id":num] or something like that. It seems to be called when I use the hacky workaround for retrieving an object through search parameters instead of finding the object by ID (since that was not supported by YACS api). I worked around that by just getting the object by ID, but this does not work on search tests.

I still have been unable to solve this bug, so I have been working on other issues in the meantime. Namely, I finally completed forms for each object, so I can have the "new" and "edit" views. This issue has been open for over a month now, and it finally has been completed. However, I still need to figure out adding periods to sections.

Below are a couple images of the new and edit forms in action:
![http://i.imgur.com/rsYYHqG.png]
![http://i.imgur.com/ji3LR4f.png]

Speaking of images, I need to put these images in the index page as well as some documentation describing how to use the "New" and "Edit" forms. Now that these forms are done, once I add "create", "update", and "delete" actions to the controllers, I should be able to write full CRUD tests for each object.

Getting all these full CRUD tests to pass, however, is going to become a growing pain given I can't even get the search test to pass. Other than that, I am making very good progress for the upcoming demo!