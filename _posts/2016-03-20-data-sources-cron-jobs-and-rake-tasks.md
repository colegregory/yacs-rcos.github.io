---
layout: post
title: Data Interface, Cron jobs and Rake Tasks
date: 2016-03-20 20:44:12.000000000 -04:00
type: post
author: Richie
---

I'd like to dedicate a post to the state of the various maintenance tasks we've created thus far. We have created a small suite of tasks for keeping our database up to date. Before I dive into that, I must first outline an interface we have created.

In an effort to make YACS easily portable to other institutions, we have abstracted the details of loading data from RPI's registrar to an interface called `1`. This interface contains several methods for populating and updating the database. We then implement this interface in a class `Catalog::RpiAdapter`. An instance of this class is created in a config file, and stored within the Rails configuration interface.

I've also created a suite of rake tasks within the namespace catalog for calling methods of this instance from the command line. Formal documentation of these tasks can be expected (eventually). I've also created "cron jobs" to call some of these methods, namely updating the seat counts of each section, at regular intervals. For this we use [crono](https://github.com/plashchynski/crono), a pure-ruby cron-like job scheduling utility. This is to avoid having a system-level dependency on cron.

In addition to simply being good object-oriented design, this is in alignment with one of our primary design goals, to make YACS a useful tool not just for RPI, but for any school that wishes to implement it. Ideally, all a motivated party at another school would have to do is create a new implementation of this one interface, and replace this instance of Catalog::RpiAdapter within the config file with an instance of their own adapter, and everything should 'just work.'

We have attempted to design our schema to be generic enough to work with most schools, but only time will tell if design changes will be necessary to realize this. I hope to work directly with another school to implement YACS within their ecosystem at some point. This would likely bring in new contributors, and I believe it is the next step towards making YACS a very successful long-term open source project.

Unfortunately I did not have a chance to post this at the appropriate time, so this post will be significantly backdated for the sake of the continuity and readability of this blog.

