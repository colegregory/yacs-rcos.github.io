---

layout: post
title: YACS Admin Progress - New Design
date: 2017-11-14 18:10:47
type: post
author: Kathleen
---

I last blogged on here exactly a month ago and there has been significant progress on the YACS Admin refactor, plus some design changes.

I made some preliminary wireframes (these aren't quite complete yet) outlining the new design:

[![wireframes](https://i.imgur.com/GgDkqjG.png)](https://i.imgur.com/GgDkqjG.png)

*Click the above image to view the wireframes in full detail.*

The whole gist of this redesign is to reduce the number of pages an administrator would have to sort through to quickly make changes to an object. In addition, Angular components make a single-page layout very intuitive and simple for a developer to implement.

The admin panel is now partially complete, and currently we are working on importing all objects to make the wireframed design work with mock data. The revised timeline for the semester is as follows:

- Complete bare minimum frontend design with mock data - ideally near Thanksgiving
  - Complete frontend for schools, departments, courses, and sections.
  - Add periods to sections (this may be pushed to the next milestone)
  - Tooltips at the top of the page and custom dialogs are "extras". 

- Complete CRUD functionality - end of November/early December
  - Allow for creation, deletion, and updating of objects.

- Integrate with YacsService - end of semester
  - Testing this might take a while especially since we would have to mock the service.