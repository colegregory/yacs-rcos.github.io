---
title: "ESLint: Fully Integrated"
date: 2017-03-07 17:24:34 -0400
author: Cameron
---

I'm pleased to announce that I've resolved all the issues with the frontend code reported by ESLint and fully integrated it into our CI stack.

A lot of changes were simple, easy things: unnecessary blank lines before the end of a block, trailing commas in some JSON objects, cramped expressions like `var1+6` which needed to be given some air.

Some were more complicated, and they often necessitated tweaking our ESLint config file. Unfortunately I had to disable the no-magic-numbers rule that I had such high hopes for, simply because YACS uses a LOT of magic numbers (usually to do with time). In order to keep that rule I would either have to declare all these numbers as constants where they appear (changing the expression `hour > 12` to `hour > HOURS_AT_NOON` is not helpful), or configure them all as exceptions to the rule, neither of which was feasible.
Interestingly, ESLint appears to ignore comments in your config file, which is a great help, since I couldn't remember my reasons for configuring things otherwise.

A couple were really difficult. In particular, the variable `self` in the Model was shadowing the same variable in the main Yacs object itself. I read a couple scary pieces of documentation saying that in general, shadowing `self` means it's time to refactor your code, but I eventually found that I could scope Model as a member of Yacs rather than as a variable of it.

Then, all I had left to do was to get it working with Travis. I never did figure out how to make the unmaintained eslint-rails gem work with up-to-date versions of ESLint. Instead, I learned how to make Travis itself install and run npm packages like ESLint. From there, it was a simple matter of telling it to run the linter during every build. It will allow the build to pass when only warnings appear and no errors, but if there are too many warnings, it will fail the build. This has the possibility of allowing warnings to accumulate gradually in the frontend. Still, I don't think it's that likely, since I intend to continue running ESLint and fixing all reported problems before finalizing a pull request.

The newly compliant code is now in staging and will get deployed in our next release.
