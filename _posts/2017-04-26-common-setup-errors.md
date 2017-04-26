---
layout: post
type: post
title: "Common Setup Errors"
date: 2017-04-26 13:19:02
author: Ryan
---

As someone who switched to development on Ubuntu this semester, I ran into a number of errors while setting up a local YACS repository using Docker. In this post I'd like to address a few of these errors and what steps must be taken to resolve them.

**Permission Denied**
When attempting to run docker-compose, as well as the yacs setup files in the bin directory (see https://github.com/YACS-RCOS/yacs/wiki/Setting-Up-Your-Dev-Environment), you may run into Permission Denied errors. To resolve these, simply manually set the permissions for the following files:
~~~~
sudo chmod +x /usr/local/bin/docker-compose
chmod ugo+rwx bin/yacs-generate-cert
chmod ugo+rwx bin/yacs-build
chmod ugo+rwx bin/yacs-dbsetup
~~~~

**Database is not Configured**
When attempting to setup the YACS database via bin/yacs-dbsetup, you may encounter an error stating that the database is not configured. If this happens, check your YACS git directory. It is likely that you are missing one or more files, including the .env file, which houses the environment configuration. You can compare your current repository with the upstream repo through git via the git diff command, and if necessary, add the missing files or checkout a fresh branch from upstream.

**Database must be empty**
When attempting to populate the YAS database, if you have existing data, you are likely to encounter an error due to a non-empty database. For this error, you will need to empty the database before you repopulate it. To do so, enter the following commands:
~~~~
rake docker-compose run web rake catalog:destroy
docker-compose run web rake catalog:load
~~~~
If this does not solve your error, you will need to destroy the database volumes as well via:
~~~~
docker-compose down 
~~~~
Then load the catalog again and you should be good to go.

These are a few of the errors you may encounter while setting up YACS on Ubuntu or a similar unix-based OS. Hopefully this saves some headache down the line!