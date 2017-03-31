---
layout: post
title: My External Contributions
date: 2016-12-05 19:42:02.000000000 -05:00
type: post
author: Ryan
---
### Preface

One of the requirements when participating in RCOS is to contribute to an external project (one that exists beyond RCOS and RPI). Below I will briefly outline two external projects that I made contributions to during this semester.

### git for Windows

Sometime in the middle of the semester, I added a very large text file to one of my git repositories. When examining the file in the github desktop application, I noticed that the line number counter was formatted incorrectly; there upwards of a hundred thousand lines in the file, but the comma was placed immediately after the first digit. Curious, I did a bit of research to see if the desktop application was open source and available on github, so that I could create an issue detailing the line number formatting error. Although the desktop application was, unfortunately, not entirely open source, while searching for it I happened to stumble upon something else; the git for windows website.

The site (located at https://git-for-windows.github.io/) had an html error which was causing section titles to appear as light blue (almost impossible to see on top of the dark blue background) rather than white, like the page title. Upon some investigation, I discovered the cause of the incorrect coloring; name tags were formatted as  which caused them to inherit the blue hyperlink text color, instead of using the white title color. I decided to correct this error by replacing 'a name =…' with 'id =…', as well as fix a few typos while I was at it, and submit a pull request to the main repository (located at https://github.com/git-for-windows/git-for-windows.github.io/pull/10). After I explained the purpose of the change and why it addressed the mis-coloring issue, one of the project leaders merged my pull request into the master branch, leaving the site properly colored and more clearly written.

### SCP Containment Breach

SCP containment breach (located at http://scpcbgame.com/) is a free game that I have had a strong connection to for many years. I originally began contributing to this project in early 2013, performing various odd-jobs in the form of art assets and code bug-fixes. Although the project has been open source since its earliest releases, it wasn’t until this year that the source code was moved onto github (previously it was simply included in its own folder with each release of the game)

When I discovered earlier this semester that the project was finally moved onto github, I became interested in catching up with the game's recent changes, but was frustrated to see that the game's launcher still had an age-old bug causing high-resolutions to overlap other options in the graphics settings menu. So I took to the code once more to find the source of this issue. Due to the game's age and depth of content, the code is very extensive and difficult to navigate, but with a bit of searching I was able to locate the section of code responsible for positioning the resolution options in the launcher menu. A small tweak to increase the number of resolution options displayed on each line was all it took to move the higher resolutions back over into the options box in which they belonged. Once again, with my desired changes complete, I returned to github and submitted a pull request with my changes (located at https://github.com/Regalis11/scpcb/pull/58) to the development branch. Before long, the game's creator and lead developer merged my changes, which will go live with the game's next version release.

### Conclusion

Being part of an open source community has helped me to realize areas where I can contribute to projects that I am interested in or benefit from, and these are just two examples of some of the ways I have been able to give back to the open source community. For a complete list of my recent work, my github page can be found at https://github.com/rystills.
