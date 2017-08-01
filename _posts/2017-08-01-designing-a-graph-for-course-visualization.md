---
layout: post
type: post
title: "Designing a Graph for Course Visualization"
date: 2017-08-01 19:06:12
author: Ryan
---
This summer much of my work has revolved around creating a graph to allow YACS users to visualize course dependencies and plan out which courses they will take. To make this happen, I had to get pretty far out of my comfort zone, doing all of my development from within Linux, and making use of existing libraries and code as much as possible rather than reinventing the wheel.

After some early prototyping, the first major challenge involved designing the graph class from the ground up to work within our existing framework of Angular and Docker. This was easier said than done, and required a lot of back and forth communication between me and Emmett before we were able to get things rolling.

Once we were able to load in the graph class, I was off to develop the core functionality of the graph. At first, I wrote everything myself, from loading data, to displaying and updating nodes and edges, and even to implementing node dragging and automatic layouts. This was great for rapid development, but before long it became clear that we wanted some more advanced features (namely dynamic, force based graphs) and the cost of developing this from scratch was simply going to be too high. As a result, I found myself at the next big hurdle; how best to rewrite all of the functionality that I had so far to fit within an existing d3 force directed sample project.

After some discussion with the rest of the team, I settled on an appropriate graph template, and got to work once again. Before long, I had all of my original functionality up and running again, while looking and feeling better than ever thanks to d3's built-in force directed graph structure.

At the present I am in the process of refining the graph; evaluating what must be done to make the graph as readable and space efficient as possible. I look forward to continued refinement and the implementation of additional features for usability in the near future!
