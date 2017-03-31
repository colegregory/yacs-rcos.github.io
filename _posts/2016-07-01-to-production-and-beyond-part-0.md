---
layout: post
title: To Production, And Beyond! (Part 0)
date: 2016-07-01 19:06:51.000000000 -04:00
type: post
author: Richie
---
## Introduction

A good portion of my efforts ~~this month~~ (edit: I started writing this in April) have gone towards deploying YACS on a server here at RPI. This will be part one of a multi-part series documenting my experience deploying the application.

I have deployed web applications before, but never "from scratch", i.e. from a clean VM. The first step to getting the app production-ready was switching to a production level web server. This is equally important whether you are deploying on your own server or using a toolchain like Heroku.

If you are unfamiliar with the inner workings of Ruby on Rails, there are a few things you should know about how Rails handles HTTP requests. Part of the beauty and bane of high level web frameworks like Rails, Sintra, Express, or Django is that they allow the rapid creation dynamic and sophisticated web applications without requiring much background in network programming. That's all fine and dandy, and if you don't need to worry about scale then you can probably even have a successful deployment without going any further down the rabbit hole. But once you find yourself needing to support many concurrent users, it pays a lot to know a little about your web server.

You can think of your Rails server as being divided into three layers: the application, which is your model-view-controller app that makes use of the fancy Rails APIs, the web server, which handles HTTP communication, and the middleware, the layer in between which acts as a wrapper around the web server. The Rack middleware used by Rails also provides a host of functionality such as authentication and caching via a horizontal pipeline, and decorates requests and responses to and from the web server. There is a lot more to know about middleware but I'll leave that up to you to research. For now we will just look at Rack as an abstraction of the web server.

## The Web Server

Because Rails abstracts the implementation of the web server to the Rack middleware, we can plug and play any web server that conforms to the Rack interface.

The default web server included with Rails (WEBrick) is single-threaded and single-process, and is generally slow and only intended to be used in development. There are several web servers designed for use in production Rails environments. The most popular are Puma, Passenger, Thin, and Unicorn. [This](https://www.digitalocean.com/community/tutorials/a-comparison-of-rack-web-servers-for-ruby-web-applications) is a great, albeit slightly old post from DigitalOcean detailing the differences between some of these options that I found to be quite helpful. You should do your own research and decide what server is most effective for your application and server configuration. For YACS, we chose to use Puma. The reason for this, in short, is that it supports the use of many multithreaded worker processes. Puma calls this feature "clustered mode" and it uses multiple discreet processes for handle multiple requests in parallel.

## Parallelism in Ruby

Multithreading alone is not as effective is due to the fact that MRI Ruby handles context switching between threads in a way that prevents true parallelism ([great post](http://www.csinaction.com/2014/10/10/multithreading-in-the-mri-ruby-interpreter/) by Christoph Schiessl). If this isn't new information, feel free to skip ahead a bit.

If you're new to Ruby and MRI is a foreign term, it is the reference implementation of Ruby created by the language's inventor Yukihiro Matsumoto and written in C. As stated before, although MRI Ruby has threads, it uses a Global Interpreter Lock which prevents true parallelism. There are thus two ways to achieve parallelism in Ruby: to use multiple processes, or use a different interpreter.

JRuby, a popular Ruby interpreter written (mostly) in Java, solves this problem by leveraging the multi-threading provided by the JVM. JVM threads map to native threads, which can actually execute in parallel. If you are coming from Python this should all sound very familiar. A small problem with JRuby however is that there can be compatibility issues with gems that have native extensions.

## Back to YACS

Like I said, for YACS we're using Puma with several processes. This allows us to handle requests in parallel, but uses a fair amount of memory. This is because each worker process is a fork of the full application, and uses as much memory. The machine we are hosting on can accommodate four workers to handle four concurrent requests. RPI's student body is on the order of a few thousand students, so this turns out to be enough concurrency for us.

We have also added Apache to our production stack, which is configured to serve static assets and statically cached pages. The app server can serve static files, but nowhere near as fast as a file server like Apache of Nginx. Ideally, we would like our static files separated from the application, but we are currently using the Rails asset pipeline so that isn't really a possibility at this point.

Stay tuned for more advanced posts featuring: containers, caching, instrumentation, and continuous deployment/integration!
