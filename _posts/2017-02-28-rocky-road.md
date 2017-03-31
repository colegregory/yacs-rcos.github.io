---
layout: post
title: Rocky Road
date: 2017-02-28 22:08:53.000000000 -05:00
type: post
author: Kathleen
---

Hello, YACS! My name is Kathleen and I am a new contributor.

As you can tell from the title, progress for me has been rocky recently.

In order to even begin working on YACS, I had to install Docker. Simple, right? Not when your Linux distribution (Mint) makes it nearly impossible to install Docker. After no luck with attempting to install Docker on Mint, I had to back up everything on my Mint partition before wiping it entirely to switch to Ubuntu, a much more Docker-friendly distribution.

Usually, an Ubuntu install is relatively painless if you know what you're doing. But mess one thing up, and it easily becomes *very* painful. This was my case, as I forgot to actually burn the .iso I put on the USB drive I was using! I didn't even realize it until wiping my Mint partition, rebooting, and staring into the eyes of the Devil himself, better known as grub rescue.

Grub rescue is essentially a simplified version of bash terminal. Usually, you can get back into your Linux partition by following this guide. None of these suggestions worked.

That was when I realized: I didn't burn the ISO. My initial solution was to boot into my Windows partition, burn the ISO, then get Ubuntu up and running. The only problem was I couldn't get into my Windows partition, so I asked around for a Windows 8 repair disk. After no luck with the Windows 8 repair disk, I found a friend who has several spare USB drives with bootable Linux images. I plugged in the bootable drive, installed Ubuntu, and I finally had a working Linux distro!

I did have to do a LOT of work to get YACS itself working, but changing a few DNS servers in a JSON file is nothing when you nearly bricked your computer to get one package.

After spending 3 weeks getting Docker working, then another week getting YACS working, then another week trying to figure out the codebase, I finally made my first contribution to YACS!

Now, when you refresh the page, a randomly generated flavortext will show on the footer instead of the usual "A Red-Hat supported RCOS project", and the word RCOS links to rcos.io.

Non-developers will easily be baffled as to how I sacrificed five weeks and an entire operating system for a small piece of text to display at the bottom of a page. Problems like these, however, are a rite of passage for any software developer. Had I not made such a disastrous mistake even putting Mint on my computer, I wouldn't know how insecure and unsupported Mint actually is. Needless to say, I'm a lot more patient with minor errors now.
