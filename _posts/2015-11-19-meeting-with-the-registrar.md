---
layout: post
title: Meeting with the Registrar
date: 2015-11-19 18:24:06.000000000 -05:00
type: post
author: Cameron
---

At long last, we got to hold our meeting with the RPI Registrar and IACS group! It was a productive meeting, and we were able to get guarantees of support for some of our objectives. We might not get everything we wanted, though.

* Data accuracy: Professor Goldschmidt will be working with Michael Conroy from the Registrar to create a standard format, Excel or similar, for courses. This is a major improvement over the PDF format the old YACS currently gets its data from and will especially help with transient special topics courses.
* Data content: Old YACS scrapes the RPI catalog for course descriptions. The catalog is very inconsistent and sometimes outdated, as the YAPS project has found, and so some bad information/missing information gets displayed. Neither the Registrar nor IACS controls the catalog, though, so we will reach out to the people responsible in the hopes of improving consistency and getting better data feeds.
* Direct database access: None of them has a very positive outlook on our getting direct read-only access to the courses database. RPI evidently has policies in place prohibiting any students or student groups from having direct database access. They don't have the authority to make a decision, though, so they will be contacting the person with the proper authority about it.
* Data availability: Unless we are allowed direct database access, we will be using the two-file model. This involves a large file containing data that is unlikely to change much or often (courses, sections, credits, times, professors) and a small file containing highly time-sensitive data (seats remaining, maximum seats). The large one will be updated more slowly than the small one. They will consider increasing the frequency of these updates during critical times like registration.
* Efficiency: The small file of this model will be converted from XML to tab-delimited text. This helps both of us because neither of us wants to process XML tags and attributes that will just get ignored.

The Registrar is also considering replacing CAPP reports with a more modern system called DegreeWorks. This would affect YAPS, so Professor Goldschmidt will follow up with the person in charge of that.

