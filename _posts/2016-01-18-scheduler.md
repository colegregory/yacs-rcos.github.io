---
layout: post
title: Scheduler
date: 2016-01-18 02:15:09.000000000 -05:00
type: post
author: Richie
---
#### At long last, we have a functioning scheduler.

The task of the scheduler is not complicated, but it must perform its function completely and efficiently. Its job is to take a set of sections spanning one or more courses as input, and output a set of unique combinations of sections, which we will call schedules.

The output set of the scheduler is valid if:

* it contains every possible valid schedule
* it contains no duplicate schedules
* it contains no invalid schedules

A schedule can be said to be valid if:

* no section conflicts with any other section within the schedule
* there is exactly one section of each selected course in the schedule

The most important part of developing the scheduler was finding a way to ensure it works properly every time. Testing an individual schedule for validity is trivial as is testing schedules for uniqueness, but testing the output of the scheduler as a whole is not quite as easy. How can we test that the correct number of schedules are generated?

If we carefully construct our test data, we can turn this matter into a very easy math problem. The key here was giving each course record and identical set of **n** sections, where there are no conflicts within the set. This allows us to easily calculate the correct number of schedules, **S**. In this case, given **k** courses, **S** is equal to the number of ways we can pick a unique ordered subset of size **k** of sections from the set of **n** non-conflicting sections per course.

The reason we've constructed this very specific test case is because **S** can now be found by the formula:

![equation](assets/images/screen-shot-2016-01-18-at-8-54-43-pm.png)

This holds for **n** > **k **> **0**. When **k** = **0**, and when **k** > **n**, **S** should obviously be zero. For our tests, we use **n** = **6** and by varying **k**, we can comprehensively test the scheduling algorithm.

The algorithm itself is a simple Depth-First Search on the sections and courses. In the search, we look to assign **k** variables, where each variable is assigned to be one of the **n** sections corresponding to a course. I've yet to benchmark the performance of the search, but it appears to be sufficient for now. There is definitely much room for optimization, and once we have some benchmarks we'll be looking into trying other algorithms or adding some sort of hinting to the basic DFS. I would also like to rewrite this as a PostgreSQL procedure, as having this recursive algorithm in Ruby is probably not as scalable as we need. I've never written an SQL procedure, but I don't anticipate this being a major pain point, but we will see...
