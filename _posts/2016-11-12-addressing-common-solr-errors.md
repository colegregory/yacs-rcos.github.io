---
layout: post
title: Addressing Common solr Errors
date: 2016-11-12 19:57:42.000000000 -05:00
type: post
author: Ryan
---
### Preface

Working with Apache solr this semester has enabled me to quickly and easily process searches, while also including advanced features such as weighting, filtering, and partial matching. Unfortunately, there are several errors that I frequently ran into when trying to setup or modify sunspot solr, so below I will outline a few of my more commonly faced issues and how I went about resolving them.

### solr starts successfully, but no matches are returned

Sometimes, when setting up solr, it may seem like everything is configured correctly, but upon submitting a query, you are unable to find any results, despite knowing that your database should contain your query. When trying to determine the cause of empty search results, the first thing you should do is verify that all of the data you want to search against has a properly configured 'searchable' block. the searchable function specifies which fields solr should index in its database; without it, solr will have no way of knowing what data to store, and will not store anything at all.

Once you are confident that your searchable block correctly specifies the fields you want solr to index, you still need to repopulate that index by calling rake sunspot:reindex. If after reindexing you still aren't getting any search results, you should check to make sure your index is actually being populated. While solr is running, you can see detailed information about each of your solr cores by navigating to the lucene control panel at http://localhost:8982/solr/#/~cores. from here, select your development core. The amount of documents that solr has indexed can be seen under 'Index' as 'numDocs'. If this value is 0 after you have called reindex, you most likely did not configure your searchable block to point to valid fields in your data.

The last possibility is that your 'numDocs' is not 0, despite the fact that your search isn't returning any results. Fortunately, lucene makes it easy to diagnose this as well. in the bottom-left corner of the page, select your desired core from the dropdown list, and then navigate to 'Query'. The query page gives you a graphical interface to easily test every aspect of your query, and defaults to a *:* expression which is guaranteed to return all of your indexed data. From here, you can play with the format of your query until you are able to locate the data you were searching for, which should give you an idea of why your original query format wasn't returning the data you wanted.

### solr's basic functionality works, but my custom filter isn't being applied

solr is a powerful tool right out of the box, but like me you may quickly find yourself needing to extend its default functionality to suit your project's requirements. Often, the easiest way to modify solr's behavior is to directly alter the solr schema.xml file. For instance, when searching for a way to cleanly implement partial matching, I ended up adding a filter to my schema to enable solr's NGramFilterFactory.

This is all well and good, but one day, you may find that for whatever reason you need to generate a clean solr directory by calling rails generate sunspot_rails:install (as it turns out, this situation comes up a lot more frequently than you would expect). But after doing so, something's wrong; that custom filter you added to the schema is no longer being applied to your searches. As it turns out, the solr schema.xml is one of the files that is re-generated automatically when performing a fresh solr install. Naturally, this means that whatever changes you made to this file will be overwritten by the default file. There are a couple of ways to instruct solr to apply your schema changes without directly modifying the xml file yourself, but if you intend to fresh install solr only when necessary to fix functionality, an easy way to re-apply your changes is to include your solr schema.xml in your github repository. This way, whenever you want to do a fresh install, all you need to do is instruct git to revert any changes to your schema after the install, and you won't have to worry about keeping an up-to-date local copy backed up.

### In Summary

I have found that the most important things to keep in mind when debugging issues with solr are that your index is defined and built correctly, and any modifications to your schema haven't been overwritten. If all else fails, remember that you can always start fresh; delete your solr folder, uninstall and reinstall the sunspot_rails and sunspot_solr gems, then reinstall and reindex solr. Sometimes, a bad git-merge or a gemfile error can mess up your solr install seemingly without reason. But as long as you don't forget to keep any files that you have altered from the default solr directory, such as the solr schema, in your github repository, you never have to worry about losing any changes.
