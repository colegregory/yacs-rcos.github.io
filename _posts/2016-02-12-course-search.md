---
layout: post
title: Course Search
date: 2016-02-12 20:24:30.000000000 -05:00
type: post
author: Richie
---

In order to reach our alpha release, the course search feature had to be implemented: until recently the search bar was not actually functional. We had discussed how the search should work, and decided that something resembling a "full-fledged" search function was necessary. However we did not want to add the dependency of an external platform like Apache Solr. The temporary solution we originally came up with was a pseudo-search that would check search terms against multiple columns of each course record and its associated records one at a time. The procedure would return a list of all matched courses ordered by the number of terms that matched each course. This would be very slow to do in Ruby, but I intended to port the algorithm to a PostgreSQL procedure after doing some benchmarking.

After doing some more research, I stumbled upon an excellent [blog post](http://rachbelaid.com/postgres-full-text-search-is-good-enough/) by [Rachid Belaid](http://rachbelaid.com/) detailing the effectiveness and implementation of full-text search, a feature built in to PostgreSQL of which I had no prior knowledge! In this approach, Postgres concatenates specified columns from all of the records to be searched, and aggregates these into a document. Postgres then attempts to match the query text against rows in the document, and can then return records based on their likeness to the query. The beauty of this is that it is all done in SQL, allowing us to leverage the features of SQL in our search. This makes it trivial to select the columns we want to search and how we want to order the result. And of course, it only requires a single transaction and is much faster than anything I could have written in Ruby.

The search is also very configurable and flexible. We had [long ago planned to handle common abbreviations](https://github.com/aosdict/yacs/issues/15) used at RPI, because everyone at RPI is obsessed with abbreviations (or maybe we are just lazy). Postgres' search feature actually allows user-defined dictionaries of synonyms. I plan on leveraging this feature by making synonyms fully configurable. We can abstract the dictionary to a well documented configuration file within the app, and allow future administrators of YACS at other schools to easily define their own colloquial abbreviations and acronyms to be used in the course search feature.

There are more features baked in to Postgres' search that I plan on taking advantage of later in the semester, namely ranking of search results and convenient support for both AND and OR type queries. But before I increase the complexity of the search I need to flesh out a test suite, which is one of my priorities for the coming weeks.

I'll be back soon with more details on the search feature and test suite, as well as our custom deployment!

