---
layout: post
title: Growing Pains & Opportunity
date: 2017-03-03 00:51:56.000000000 -05:00
type: post
author: Richie
---

I recall a few months ago the sysadmin in charge of provisioning the VM on which YACS runs asking me if we had any persistent data we would want backed up. "No," I replied "all of the data can be easily regenerated." This was true enough at the time, as all of the course data is automatically updated each day. But a few weeks later I had manually added a large number of courses and added custom descriptions to even more. All of these changes were tediously performed through the Rails console one by one, as the data came from individual emails from professors and a large unstructured PDF of new and special topics courses that the registrar in turn tediously compiles each semester.

A few weeks after that, I received an email from our sysadmin informing me that he had allocated us a much more powerful VM to use. This was great news! I was very excited to set up the new machine. However, he had apparently remembered my stating that we did not have any important data, and had not preserved our database. All of the changes I had spent hours manually entering were gone.

This whole experience brought two new needs to light:

1. We need database backups, and
2. We need a better way to make manual changes

Number 1 is no trouble, but it was clear that we needed an admin panel. I thought about this for a few days and I realized that we are in a position to provide a very useful service to the faculty of RPI.

For a little context, each semester at RPI there are a number of new and so called 'special topics' courses, which are often experimental new, courses that are not offered regularly, or just courses that have not made it into the catalog yet. I also learned though email exchanges with professors that it can take up to a year for a course's description or other details to be updated in the official catalog, which can be extremely inconvenient. Often professors worry that their new, exciting courses won't be visible to students before registration begins, or at all, because the processes for updating the catalog and getting the list of new courses out are so inefficient and tedious.

YACS is a solution to this problem and professors realized it before we even did. Because YACS is where students go to look at courses, many professors reached out to us asking for their special topics courses to be added to YACS ahead of the official list being released, so as to provide better visibility to students.

So, I have proposed the following:

First, we will construct an admin panel for YACS. This is already in progress, and is being developed as a microservice with its own repository. I have added API key authentication to the core app, and we are working on completing the necessary extensions to the API to support for CRUD operations, something we have not implemented yet as we have had no need.

Second, we will created a special 'featured' courses area, visible from the YACS homepage, where we will showcase new and special topics courses, or courses otherwise requested to be highlighted.

Using these two features, we will be able to easily do manual edits to the database, highlight new courses, and potentially get this power into the hands of the faculty in charge of doing so. We will be proposing this system to the relevant faculty as an official replacement for the tedious system that is currently in place. If they are interested, they will be able to use YACS to manage this data and get it to students faster than before. And even if they are not interested, we will still have the functionality and simply manage it ourselves.

I am very excited for these new features. I think the admin panel is a huge step forward for us in terms of completeness, and I think the featured page will be great for students and professors.

Look out for my next post on YACS extensions being developed!
