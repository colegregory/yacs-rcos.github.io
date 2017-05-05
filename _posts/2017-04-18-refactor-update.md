---
title: Refactor Update
date: 2017-04-18 19:55:23 -0400
type: post
author: Ayushi
---

As we have mentioned earlier, the YACS team has decided to move forward with a frontend refactor. Our goal is to streamline future updates, features, and new designs. We want new developers to be able to join the team and easily make new changes and updates. Further, we want the future of YACS where external entities that use YACS are able to customize the look and feel of the app to meet their school’s unique needs. 

We want to front end to be an independent application, that can be configured, built, and tested on its own. 

In moving forward with these goals in mind, we decided to try out various frameworks during this refactor. We had considerable discussion on which frameworks would be best suited for the application. We considered using Vue.js but found that the ecosystem for development was not large enough. We then had a “trail period” for the use of React. We quickly learned that React, as marvelous and ubiqutious as the framework is, has quite the learning curve. The syntax and code structure of a React application were entirely foreign to many of us! We also saw our app entering dependency hell, and quickly decided to scrap the React app and change course. Again, this goes to show the perks of having the front end be a separate application, where we can easily scrap changes entirely with ease. 

Ultimately, we have reached a consensus on using Angular 4.0 with Typescript. Angular is a very popular framework, and easiest for new developers to familiarize themselves with. We want to want to make it easy for people to get involved with varying code backgrounds, and hopefully, with a less steep learning curve, we can accomplish this goal. Angular 4 was ugly more successful than React, and also more analogous to old-school web development than the other frameworks we discussed, such as Vue.js or React. Typescript also allowed us to lessen the learning curve, and add elements of object oriented design to our JavaScript application (well TypeScript application :P)

We also played around with a couple CSS frameworks before reaching out final decision. After some research, we found the Material UI was often use in combination with Angular, and we attempted to add our styles using Material UI. However, we quickly found that Material is not only a huge pain to configure and has terrible documention (sorry Material UI advocates), but it is also extremely difficult to customize in a meaningful way. Our major goal in this fronted refactor was to allow easy customization by new developers and external entities. We have decided to move forward with Bootstrap and hopefully take some headache away from styling. Bootstrap is still highly customizable and works well with Angular 4. Further, Bootstrap documentation is excellent, the framework itself is very complete, and there is an enormous ecosystem for development. The switch was very quick and definitely a very good decision. 

To conclude, our team experimented with various technology stacks, and changed our paths as we saw fit. We are confident in the combination of technologies we are using, and we will hopefully be successful in accomplishing our goals in the future. 

More to come!

- Ayushi :)