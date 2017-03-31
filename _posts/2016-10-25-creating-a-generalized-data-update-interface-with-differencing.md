---
layout: post
title: Creating a generalized data update interface with differencing.
date: 2016-10-25 20:58:28.000000000 -04:00
type: post
author: James
---

Greetings,

Richie and I have been working towards updating the old catalog interface. The old catalog interface was specific to the YACS' distribution of RPI. The goal we have in mind for the update is to create an abstract interface that is specific to the maintainer of the YACS distribution for a specific school. The interface will be paired with a client that is responsible for computing the differences between the updated catalog and the database, and then execute an update for the data that differs between the catalog and the database. The reasons for creating a more generalized client that will be responsible for updating the database is so that it does not need to be reimplemented for each distribution of YACS.

The client has two responsibilities, updating the database and computing the differences between the database and the catalog. To update the database the client needs to execute either a partial update or a full update. The client will receive this information from the catalog interface.

More on this to come.

