---
layout: post
title: A Look Back at the Semester
date: 2016-12-07 20:03:25.000000000 -05:00
type: post
author: Ryan
---
### what did I plan to do?

When I originally asked to join YACS at the start of this semester, I honestly wasn't sure what I would do. I was still fairly new to web development, with most of my prior web experience being with html, javascript, and python. From discussing the project with my future mentor, I got the sense that I would spend a good amount of time learning and working with ruby, as my responsibilities on the team would be back-end related and ruby is the language in which most of the YACS backend is written.

### what did I end up doing?

Apache Solr! I definitely could not have predicted that the bulk of my development time would be spent transitioning the project's search functionality over to solr from SQL, and then working on the various ways that solr could be used to address previously impossible issues. Because searching is a core part of YACS' functionality, I found myself with an opportunity to become familiarized with the workings of nearly every part of the site, from the front end html, to the various site controllers, to the ruby scripts that do the heavy lifting on the backend. I frequently found that I needed to learn another technology that we were using, as it would impact searching or the project structure in some way. The biggest example of this by far is docker, which caused me a tremendous amount of headache between compatibility issues with my operating system, and usage which required me to make several changes to the way I deploy the solr server.

### what did I learn?

Perhaps the most prominent, reoccurring theme for me over the course of the semester is that development on windows is never easy. Right from the beginning I could not deploy YACS locally on my machine due to windows requiring a timezone gem for rails that Unix-based operating systems naturally possess. Throughout the semester, I always found myself jumping through extra hoops due to quirks and lack of functionality in windows. In the future, I will definitely consider developing for web on a different operating system, as in the fast changing, technology rich world of web development, the last thing anybody needs is even more headache and debugging.

Finally, I really came to appreciate the value of being able to meet with and ask questions of my mentor for guidance. Having a close mentor who was willing to take the time to help when I was stuck was an invaluable resource for me, especially due to how inexperienced I was in the realm of web development. In the future, I will continue to strive to be self-sufficient, but also willing to ask for some help when I know I really need it.
