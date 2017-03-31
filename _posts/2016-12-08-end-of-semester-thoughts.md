---
layout: post
title: End of Semester Thoughts
date: 2016-12-08 05:34:02.000000000 -05:00
type: post
author: Mark
---

#### YACS Android App Update

During the middle of November, I created an early concept design of the YACS courses view the way I envisioned it, using my ancient Wacom Graphire 2 tablet. I showed it to the group and the working-concept was well received by the YACS team. Soon after that, mock-ups followed.

I intend to continue working on YACS Android next semester. There are still a lot of features left to make for YACS Android, of which include the sections view, schedules view, and code a lot of application design logic.

#### YACS On Docker

So far, I have created two blog posts about my experiences working with the stellar YACS team to create the Docker build used by YACS. It was a long journey that started mid-November. I started with a working Dockerfile that was created and maintained by Richie, and a dream to make the secure Nginx configuration for YACS. I learned a lot by reading the Nginx docs. I used the Nginx configuration of my homelab as reference when creating the Nginx configuration for YACS, making the Nginx configuration as secure as possible.

#### External Contribution

I decided to help the custom Linux kernel repository that I use on my Google Chromebook Pixel 2 laptop. Everytime I used the brightness script included with the kernel, I was irked by a typo that read “brighness” to the terminal. The typos were introduced in June of 2015. After the typos were corrected, a pull request was submitted to the kernel maintainer. The kernel maintainer reviewed my changes for about an hour, merged my pull request, and thanked me for it. Now, the script no longer has typos. The custom kernel used by many Chromebook Pixel owners to enable sound support because the sound drivers are not in the upstream mainline kernel yet. I plan to contribute to the custom kernel again soon.

#### Closing Thoughts

As the semester wraps up, It’s been satisfying to see how YACS Android and YACS on Docker has progressed. I am ending the semester feeling happy since my secure Nginx pull request was successfully merged into the official YACS docker branch today!

Thanks everyone for all the encouraging support throughout the semester.

I can’t wait for what’s in store for me next!
