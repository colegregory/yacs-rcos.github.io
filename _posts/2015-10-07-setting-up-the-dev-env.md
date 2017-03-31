---
layout: post
title: Getting Started & Setting up the Dev Environment
date: 2015-10-07 09:03:29.000000000 -04:00
type: post
author: Arijit
---

This post is aimed at setting up the Rails development environment and getting started with contributing to the YACS Project.

Irrespective of the operating system (Windows, OSX, Linux) you are accustomed to, setting up Ruby on Rails is not that hard. But just in case you do not want to mess around with your current settings, or are working on multiple Rails Projects, or are a complete beginner at setting up rails - this guide will help you setup a virtual development environment without shedding a lot of tears.

We will be using Vagrant to set up the development environment inside the virtual machine hosted on your computer. The first things to do will be to:

1. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
2. Download and install [Virtual Box](https://www.virtualbox.org/wiki/Downloads).
3. Clone a copy of the [GitHub repository](https://github.com/aosdict/yacs) onto your local machine.

Almost there! Navigate to the project folder using the terminal (or command line) and fire the following commands:

This command will create the VM.

> vagrant up

This command will let you login to the VM.

> vagrant ssh

Once you have logged onto the VM, change your directory to /vagrant. From there simply execute the following function to start the rails server.

> rails s -b 0.0.0.0

And that's it! You can then open [http://localhost:3000/](http://localhost:3000/) on your local machine's browser to access the website!

Watch this space for updates on how to create your own Vagrantfiles and provisioning scripts.
