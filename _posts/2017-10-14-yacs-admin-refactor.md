---

layout: post
title: YACS Admin Refactor
date: 2017-10-14 15:10:47
type: post
author: Kathleen
---

Since my last blog post, I have completed the upgrade to Rails 5.0.1. However, this upgrade will ultimately be short-lived, as the YACS admin team will be refactoring the application to use Angular 4 like the rest of YACS is using.

After reflecting on my sloppy code, I have determined that my tests were failing not because I couldn't write tests, but because there were major flaws in the code, namely ActiveResource being obsolete. Since ActiveResource is obsolete in Rails 5, it was a lot harder to write code and tests due to lack of documentation.

Hopefully by refactoring the application, the development of YACS Admin will be a lot smoother. Here are just a few benefits of refactoring the application to use Angular 4:

- Much better support for API calls
- Many components and services already exist in the [yacs-web](https://github.com/YACS-RCOS/yacs-web/) repository, so these can be reused and modified
- Angular 4 is used across YACS, so YACS Admin will be standardized

However, there are a lot of drawbacks to refactoring, including:
- Time needed to learn Angular 4/Typescript/Jasmine
- A lot of code needs to be rewritten

With this major refactor in progress, the semester goals need to be revised. Here are the new semester goals:
- Refactor application into Angular app
- Fully implement unit tests
- Visualize periods
- Add authentication
- Dockerize application
- Get application ready for production

I already created a milestone for the refactor, and I expect that this will be somewhat complete by mid-November. Since a lot of frontend code from the legacy app and a lot of Angular code from yacs-web can be reused, this refactor should be relatively quick. I am excited to see where this project is going, and how it can be integrated with the rest of YACS.
