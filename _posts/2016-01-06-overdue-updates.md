---
layout: post
title: 'Overdue Updates'
date: 2016-01-06 02:49:01.000000000 -05:00
type: post
author: Richie
---
## General Updates

Hello!

We apologize for the radio silence, but we’re back at it after finals and are making good progress.

Development last semester was definitely a learning experience for all of us. If you look at our early git history, you’ll see more than a fair share of rewriting and deletions. This stemmed from our goal to fill the shoes of the existing application (yacs.me). We first attempted to start by implementing the full schema and APIs for the entire application. While we were writing tests for all of this code, we did not properly adhere to test driven practices. This is where our friend Stephen at Red Hat was incredibly helpful. He reminded us that although our goal was to replace an existing system, that should not change what our development process would be. From there, we focused on implementing the application feature by feature, instead layer by layer. This probably should have been the obvious approach, and starting with this mindset would have saved us a lot of time. This lesson has stuck with us through our development since then, and we began implementing it early enough that we weren’t set back too far.

## Recent Progress

I’m now strictly adhering to test driven practices. I initially made the decision not to push this as I was afraid it would create a barrier to entry given that the res of the team wasn’t familiar with Rails, and having to learn a test framework before learning the web framework seemed counterintuitive. This has not really been an issue, however, and now that we are getting into the more tedious components of the application (namely, the scheduler) test driven development has been a major asset. Testing the scheduler at first seemed a little daunting, but we took it one step at a time and it ended up being very intuitive. A detailed breakdown of the development of the scheduler will follow this post.

