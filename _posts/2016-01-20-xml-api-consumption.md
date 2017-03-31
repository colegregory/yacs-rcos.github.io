---
layout: post
title: XML API Consumption
date: 2016-01-20 10:40:00.000000000 -05:00
type: post
author: Richie
---

I'd like to take a step back and talk a bit about our APIs, or rather, how the front end of app consumes our APIs.

Typically, a web app will display information from its backend in one (or often both) of two ways. In the first way, the server responds to a request for a resource with some HTML it renders using a template (think ERB, Haml, Jade, etc.) and that HTML is displayed by the browser. On the other end of the spectrum, a developer may choose to use AJAX requests to retrieve information from the server, often from a JSON API or the like, parse the response, and use that data to populate the majority of the content on the page. This includes the use of front end MVC frameworks such as Angular, React, and Backbone.

Obviously there are many, many ways to write web applications, but these seem to be the two most common strategies used.

Early in our development, we decided on a sort of hybrid approach. First, the server sends a static HTML document consisting of only the header common to every view of the application, along with the styles and scripts used by every view. There aren't many different views, so the additional overhead of loading all of this at once and not taking full advantage of the Rails asset pipeline is negligible. After the mostly empty home page is loaded, the browser requests the list of departments from the server's API. Now, instead of parsing that information and populating the page content accordingly, or using a front end template, the XML response is put directly into the DOM. By treating this XML document as an HTML document with custom tags, we can simply 'paste' the output from our API on to the page. The styling for this content is already present, and any event handlers are added once the new content is loaded.

How is this different from simply using templated HTML? As well as decoupling the front end from the back end, this approach allows the web application to utilize our API without introducing any additional front end complexity or overhead. The primary motivation behind using our API for the web front end, however, is to maintain consistency across platforms. This way, our web interface and eventually our native mobile application will effectively use the same API, making it much easier for us to ensure consistency across our platforms, as well as the several other RCOS projects that make use of the YACS API. Additionally, because the existence of our API is necessary, the use of HTML templates to display our data would be redundant, and would only stand to increase the complexity of the application, add additional points of failure, and make the application harder to update and maintain.

We believe this approach to be very DRY, efficient, and simplistic. I am very interested to see how this choice will effect the long term development of YACS. My one concern is that if the complexity of the views increase over time, we may outgrow the ability to simply paste XML from a generic API onto the page. Only time will tell for sure but I do believe this implementation will play out very nicely for us.

I encourage anyone with a comment on this approach to leave a reply or drop us a line.
