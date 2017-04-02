---
title: "A Blog Post About Blog Posts"
date: 2017-04-02 16:11:03
author: Cameron
---

If you're reading this, it means you're on the new and improved YACS Blog!

This blog is hosted on GitHub Pages, and it's a marked improvement over Wordpress. Instead of having to log into Wordpress, write up your post using HTML for the interesting parts, and sign your name at the bottom, all you have to do is create, commit and push a Markdown file! I've also created a script to speed up this process, so you don't have to manually enter the date and time in the filename and the file itself.

This week I've spent making the blog has been a crash course in Jekyll, the publishing framework used by GitHub Pages. Jekyll is nice because it's "blog-ready": all it requires is that you add a file with a few pieces of YAML data at the top. It's been confusing, but I've finally got it set up the way I want it.

### Customization

Another advantage of the new blog is customization: rather than selecting some themes on Wordpress and putting up with sidebars and buttons in the corner that we can't get rid of, we have full control over the display of the site. We can have whatever separate pages we want, as many posts on the front page as we want, and very simple navigation.

### Straightforward Authors

On Wordpress, we had a shared "yacsrpi" account. Everyone had the password, and every post was authored by "yacsrpi". The system to indicate that you had written a post was by signing your name at the bottom of the post, which clearly wasn't very visible. Here, you express your authorship in the YAML header and the site transforms it into your custom name and Github avatar at the top of every post. Much cleaner. Also, access control is now determined by who can commit to this page's repository; that is, the developers. No more need to share and possibly leak the password.
