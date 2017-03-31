---
layout: post
title: An algorithm for conflicts
date: 2016-11-09 19:55:57.000000000 -05:00
type: post
author: Cameron
---

I'm pleased to announce that YACS now has a very efficient algorithm for computing course conflicts on the front end. This will - finally - allow you to see conflicting sections in real time as you browse and select courses. It's the last major feature of the old version of YACS that we haven't completed, and it's by far our most requested. I think a lot of students have given up hope on ever having the feature in YACS again, so I hope they'll be pleasantly surprised when we roll out the implementation shortly.

For this algorithm, performance is paramount. Anything really would be an improvement over the algorithm used by yacs.me, which loads the entire set of departments, courses, sections, and conflicts up front, and puts them in browser storage. This can take any amount of time from one to ten seconds. So the first main goal was to provide all the information necessary for conflicts - but nothing more.

### Getting a data source

Ryan provided the foundation for this by building on Haoxin's work from over the summer. This work was primarily to provide a means to store on the backend, for each section, a list of sections that conflict with it. We selected Redis to do this: when a section is added to the database, it checks it against every other section and adds each section to the list of conflicts of the other section. Redis is particularly efficient at storing and retrieving mappings like this. Then, whenever a section is returned through the courses API, the list of conflicts is grabbed from Redis and passed along with the rest of the section.

But what the backend can't do is figure out which sections should be marked as conflicted, because it doesn't know what the user's current selections are. And selections change so frequently that the backend shouldn't have to worry about it anyway. This is where the algorithm comes in:

**Given the user's current selections and the courses and sections rendered on the page, mark as conflicted any section that conflicts with selections such that no schedules would be able to be generated if it were selected.**

### Front end changes

What does it mean for a section to be "conflicting" with selected sections? I was eventually able to pin down this definition: a section X conflicts if all selected sections of a single course Y appear in X's list of conflicts. This is where I found a deficiency in the existing way of storing selections. We stored them as a simple list of section IDs without any link to a course, and so there was no concept of "selected sections of a single course". So this list had to be changed into an object that mapped course IDs to section IDs. This required a lot of annoying changes on the frontend, because it meant the entire Yacs.user object that stores selections and everything that uses it had to be changed to account for the new format.

Section conflicts are not particularly volatile, only changing possibly when sections are added or removed. So in order to avoid having to get the conflicts from the API on every request, I implemented our first frontend cache. This simply preserves the map of section IDs to their list of conflicting sections.

### The algorithm itself

First, an auxiliary algorithm is needed to do this computation efficiently, to find section IDs that appear in two lists (or, more specifically, whether any/all of the IDs in one list match the second list). This is pretty simple, though I can't find a name for it anywhere, and it can be done in linear time if both lists are sorted.

Now here is the key component of this algorithm. When it is time to compute conflicts, the current selections are flattened into a list of `1` pairs, and then sorted by section ID. Another small object maps course IDs to the total number of its sections the user has selected. This is a preprocessing step and *only has to happen once;* the list is essentially fixed for the rest of the computation. With this data in hand, then the sub-algorithm can be run with it and the conflicts list of any section S as parameters, decrementing the counter for a course id whenever a conflicting section is found. If any of these counters hit zero, then we know that S conflicts with every selected section of that course, and therefore we can stick the "Conflicts" label on it!

### Analysis

Let:

* C be the number of selected courses,
* P the average number of selected sections per selected course,
* S the total number of selected sections (S = C * P),
* K the average number of section IDs in a conflicts list, and
* N the number of sections that need their conflict status determined.

The preprocessing requires iterating over all selected sections, and then sorting the result, achieving a performance of O(S + S log S). But the essential thing is that this flattening step only has to happen once, regardless of N. Accounting for having to copy the small course count object, running the sub-algorithm using the flattened list then takes O(C + K + S) time, and this happens N times, so the overall performance is O(S + S log S + N(C + K + S)).

Compare this to a naive implementation, which would run the sub-algorithm and iterate over the conflicts list once for each selected course. This achieves O(N(CK + S)) time. Given the fact that N and K can range up to several hundred, the multiplication by C makes for a substantial decrease in performance.

When testing out the conflicts feature, I have found it to be exceptionally performant: conflicts are computed in no more than a couple hundred milliseconds and displayed almost instantly after that, given that it only needs to add a .conflicts class to conflicting sections.

### Future Plans

One nice thing about this algorithm is that it makes it easy to tell *which* course is conflicting, and thus it's easy to generate a message like "Conflicts with Intro to Architecture" rather than the default "Conflicts with selected courses". It should also be easier to suggest which courses conflict on the schedule rather than giving an unhelpful "Try removing some courses". The first thing we need to do, though, is making it all work in our Docker setup. Once that's taken care of, we can get it deployed.

