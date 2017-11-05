---
layout: post
title: Front End Testing Update
date: 2017-11-05 18:45:23
type: post
author: "Alex Z"
---
So far I have gotten (mostly) accustom to Jasmine's testing framework and I feel that I am on the way to complete my goal and complete the testing by the end of the semester. So far I've almost completed testing one component and gotten started on more of the components. Now, this doesn't sound like much, but I've ran into a lot of issues that have greatly slowed my progress.

The first of my issues was in importing the 'correct' jasmine as whatever module I initially had was not jasmine. To resolve, I needed to install jasmine using a different install command as well as saving that install so it doesn't overwrite. What was a bit confusing was that jasmine was already included in the package.json so even now I'm not sure what exactly went wrong.

Another blocker occurred when trying to mock objects. This was the major error so far that took a long time to fix. This problem was regarding the incorrect syntax that I was using when trying to mock a method of the YacsService. What I was doing was trying to use spy's which are a component of jasmine. What I needed to use was TestBeds which are elements of the angular testing core which allows me to completely mock a component.

I ran into other issues as well, but was able to resolve most of them without issues. However I still am running into other issues, so the experience should continue to be enjoyable yet challenging.

My goal is to be done with these tests by early December and hopefully focus on coverage and revising the tests then!
