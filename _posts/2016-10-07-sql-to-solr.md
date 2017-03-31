---
layout: post
title: SQL to SOLR
date: 2016-10-07 20:52:26.000000000 -04:00
type: post
author: Ryan
---
## Preface

As my first major contribution to the YACS project, I was assigned the task of replacing an SQL query with a Solr search, with the ultimate goal of enhancing Course searching with features such as partial text matching. Solr, an open source search engine, seemed to be a natural choice for our team, due to the fact that it already had a library available called Sunspot which can be plugged right into Ruby on Rails. Unfortunately, things didn't go as smoothly as I had hoped, but with a bit of work I was eventually able to get Solr up and running, and returning useful search results.

## Installation

The first step to installation was to add sunspot_rails and sunspot_solr to the project gemfile, and of course call

> bundle install

After that, all that was left was to generate some default solr files with

> rails generate sunspot_rails:install

Finally, we just called

> bundle exec rake sunspot:solr:start

and… 'command not supported on i386-mingw 32 bit'. Because I was developing on a windows machine, minor inconveniences like this were not uncommon. In a windows environment, it seems, the easiest way to get a solr server running was to instead run it in the foreground by calling

> rake sunspot:solr:run

Success! A word of warning though: the last message that will appear in the console upon starting up solr in this fashion will likely be registering core… Initially I was under the impression that the final message would be something indicating that the server had successfully started, so I took this to be an error and switched over to the betam4x sunspot build instead. As I later discovered, there is no such final message; the standard solr build was working as intended, so I eventually switched back to the standard build without any repercussions.

## Functionality

So we managed to get solr up and running, but we still needed to give it some data to index. So I went into the courses model and added a searchable block informing solr of which fields it should search on. This simply looked like:

```ruby
searchable do #searchable block required by sunspot (specifies which fields to index and search on)
text :number, :name, :description
end
```

Now it was time to call

> rake sunspot:reindex

so sunspot could index the data that we had just added to our Course schema. Finally, we needed to modify our Course searching method to replace the existing SQL query with a call to sunspot search, so I added the following to do just that:

```ruby
courses = Course.search do
   fulltext params
end
```

Unfortunately, because we named our Course searching method 'search', which is the same method name that sunspot uses for searching on an indexed object, it seemed that this code may call our overridden search method, rather than the solr one. To prevent this, I modified the search call in order to specify that I wanted the Sunspot search:

> courses = Sunspot.search(Course) do…

## Getting useful search results

With our data indexed and a call to Sunspot's search method added, we had everything we needed to start up our rails server and test the sunspot search results. However, something still wasn't quite right; when attempting to run searches, no results were being returned, even when searching for exact terms that existed in our indexed Course data. After some messing with the searchable block and reindexing the data again, I was able to get exact matches to be returned when searching, but still didn't have any luck with partial matching. To solve this, I appended the wildcard character '*' to all search parameters prior to searching. While this returned some partial matches, it failed to return others, and seemed to cause exact matching to stop working entirely. Fortunately, A bit of research revealed that solr comes with some pretty useful debugging tools, which can be accessed via entering the following into your browser's URL bar:

> http://localhost:8982

where 8982 is the port number being used by the solr server. This made it easy to test search results with various query parameters, and helped us to confirm that the wildcard character was not functioning the way that we expected it to. A little more research suggested replacing the text fieldType in the solr conf schema.xml file with the following:

```xml
<fieldType name="text" class="solr.TextField" omitNorms="false">
  <analyzer type="index">
    <tokenizer class="solr.StandardTokenizerFactory"/>
    <filter class="solr.StandardFilterFactory"/>
    <filter class="solr.LowerCaseFilterFactory"/>
    <filter class="solr.PorterStemFilterFactory"/>
    <filter class="solr.NGramFilterFactory"
            minGramSize="3"
            maxGramSize="30"/>
  </analyzer>
  <analyzer type="query">
    <tokenizer class="solr.StandardTokenizerFactory"/>
    <filter class="solr.StandardFilterFactory"/>
    <filter class="solr.LowerCaseFilterFactory"/>
    <filter class="solr.PorterStemFilterFactory"/>
  </analyzer>`
</fieldType>
```

The key here is the inclusion of the 'NGramFilterFactory', which will enable partial matching anywhere in a given token. With this change, as well as the removal of the wildcard character, solr searches finally began returning desirable results both when searching for partial matches, as well as when searching for complete matches.

With searching now functional as expected, we were free to tweak the search a bit to more closely match our desired results. In our case, this meant weighting the fields based on importance:

```ruby
fields(:description, :number => 10, :name => 5.0) #weight results most strongly by number, then name, and finally description
```

as well as limiting the number of results per page (as partial matching may return many slightly relevant matches):

```ruby
paginate :page => 1, :per_page => 25 #place a maximum of 25 results on each page (for now we just display page 1)
```

## Stubbing solr

With solr operational and tweaked to our liking, it was time to submit a Pull Request to our staging branch. Upon doing this, I discovered that our travis-CI build test was failing, due to the fact that there was no solr server running. The solution to pass these test cases without having to start and stop a solr server ended up being to stub solr by creating a sunspot.rb file in spec\support containing the following line:

```ruby
Sunspot.session = Sunspot::Rails::StubSessionProxy.new(Sunspot.session)
```

This allowed solr to pass most of our tests, but still failed a couple of cucumber tests, which required a copy of this file to be placed in features\support as well.

## Conclusion

Finally, we have solr searching fully functional, including partial matching and weighted searches, and passing our build test cases. There were a few hiccups along the way, but the end result is working as intended, and leaves room to easily tweak search settings or add functionality in the future as desired.
