---
layout: post
title: Admin Panel Progress
date: 2017-03-22 00:35:33.000000000 -04:00
type: post
author: Kathleen
---

The admin panel has been progressing very nicely. A usable guide has been implemented, and the repo has been moved from my personal GitHub to the YACS organization.

Now that I am waiting on YACS API implementation, I figured it would be best to develop the full CRUD operations beforehand to make integration as seamless as possible. But, in order to avoid the inevitable screwup, it would be best to stub the API.

I admit I am rather unfamiliar with stubbing and Rails testing in general, so I will have to devote some time to learning that. I figured a good exercise for this would be implementing tests for current operations, that way these can still be automatically tested.

Once I am familiar with testing and stubbing, I will stub the YACS API to actually test the create/edit/delete operations. Even though all this testing is done automatically, I should still create frontend form templates and implement create/edit/delete operations in views and controllers.

After the test suite is implemented, the create/edit/delete operations are "implemented", and sufficient documentation is created, I should have the admin panel ready for an alpha release!
