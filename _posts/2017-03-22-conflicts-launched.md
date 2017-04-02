---
title: "Conflicts are Launched!"
date: 2017-03-22 10:34:11 -0400
author: Cameron
---

So remember my [previous post](/2016/an-algorithm-for-conflicts) last semester? The one in which I was blithely going on about how it would be great when we rolled out course conflicts in a couple days?

Yeah... that didn't happen.

Having decided that the Redis conflict queries needed to be pipelined and cached better, we sat around for a while over winter break with the frontend implemented, but no real focus on solving these other issues.

Earlier this month, I merged in our latest changes and made sure the conflicts branch was fully up-to-date with the new Docker and ESLint code on master. Then we had to sit down and take a long look at whether our Redis setup was feasible.

Turns out that it's not, really. Richi experimented with the possibility of storing conflicts as a big field of IDs for each section in the database, rather than a large Redis store of pairs of conflicting IDs. The procedure for computing conflicts was moved into a big native SQL procedure. As it turned out, this sped up the conflict computation, and hence other things like building the database, significantly. Frontend speeds didn't change because the API didn't change, but the time to serve the API requests decreased, due to the backend's being able to use the database conflicts field without altering it. (API request times are still higher *compared to the pre-conflicts YACS*, since there are a lot of them in each request, but that's an acceptable tradeoff for being able to show conflicts in the first place.)

So we ditched Redis (we still have it as a Docker container for some caching) and moved over to the pure Postgres implementation. All was looking good, and I submitted the pull request to staging... only to have one of our integration tests fail.

Mystified, we checked the test case, which I had written long before any backend implementation existed. Analytically it appeared fine, but a section that should have been conflicting was not being marked as such; for some reason it wasn't being entered into the database. Richi and I double and triple checked the Ruby and Postgres code computing the conflicts, but couldn't find any errors.

I altered the test cases and learned how to make the Postgres procedure produce output and forward it to Docker (you have to use a `RAISE LOG` in the Postgres function) and eventually found my way to [this little piece of Postgres documentation](https://www.postgresql.org/docs/9.1/static/arrays.html#ARRAYS-ACCESSING):

> By default PostgreSQL uses a one-based numbering convention for arrays, that is, an array of n elements starts with array[1] and ends with array[n].

![Patrick Stewart facepalm](https://farm4.staticflickr.com/3653/3390182310_f86c82cb95.jpg){: width="200px"}

After fixing that, and after verifying the code worked, we were able to get it reviewed and pulled into staging quickly. Now it's just been deployed to master, and I hope it all goes smoothly.

At long last, we've finished what is probably the biggest unimplemented feature of YACS.
