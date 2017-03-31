---
layout: post
title: Improving the quality of our frontend code
date: 2016-12-09 21:49:33.000000000 -05:00
type: post
author: Cameron
---

The Javascript component of YACS is a pretty crazy place.

Since the beginning, it's been made up of whatever code we've wanted to throw at it. It started as a pile of event listeners, that turned into jQuery event listeners and calls, that turned back into normal event listeners when we decided jQuery wasn't worth it. Handlebars, when we decided to use it, was cobbled together on top of that. The code and file hierarchy were restructured several times, adding a library of central functions to call the API, bind event listeners, use a simple ORM, and change selected courses. It's currently a hodgepodge of all these things, underlaid by several layers of refactoring; a place where ancient shreds of code from different developers get recycled and repackaged until you don't know where anything originally came from.

This is not a post about changing any of that.

This is a post about our current efforts to lay down some rules on the Javascript code base going forward, so that at least if it's crazy, it's *understandably* crazy.

Nobody who has contributed to the client-side code of YACS thus far has had to follow any standards of code style or correctness, and that's contributed to its mess and poor readability. But now, at last, we're starting to implement those.

I'm currently in the process of adding [ESLint](http://eslint.org) to our development stack. We chose ESLint because of its apparent status as the foremost Javascript code linter, and the best supported. The ultimate goal is to add it to our Travis build so that it will run automatically on pull requests. We're not following any published standards; we're just enforcing consistency with code quality and code style rules (such as always using the === operator) that make sense to us.

Before that, though, there's a couple things to do. First, the eslint-rails gem that is supposed to provide an easy way for Rails developers to use ESLint without installing Node appears to use a version of ESLint that is at least 1 major version behind. When running ESLint, many of the rules I've configured simply throw up errors that they're not defined. Trying to update this properly has not been smooth.

And more straightforwardly, there are a whole host of issues in the codebase that linting easily exposes: missing semicolons, inconsistent string quoting and camelcase naming,  variables that are undefined but somehow never cause a problem in the browser. My immediate task is to go through and fix all of them. Some refactoring is probably going to happen because of this, because the linting helps to expose some underlying design issues as well.

It's not particularly bright or visible work, but the frontend is going to end up better for it.
