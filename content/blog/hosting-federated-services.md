---
title: "What I've learned from hosting federated services for the last three years."
summary: "In this blog post, I'm going to be focusing a lot on ActivityPub-related federation."
date: '2023-03-21'
---

## Introduction
In this blog post, I'm going to be focusing a lot on ActivityPub-related federation. When I mention "instance", I'm talking about a single server on the fediverse network.

This post is here to overview my experience in running all of this, and so I won't be touching on any of the drama or politics from the fediverse. If you want to learn more about that, there are plenty of other places for it.

## So where did it all start?
Back in late 2020, I was talking to a few friends and noticed the word "fedi" or "fediverse" would show up in conversation. This was something I'd heard a few times before but I hadn't given it much thought... but now my friends were talking about it too! After a little digging (asking them what this interesting system was), I decided to join and see what all of the fuss was about. My first choice was where to join. With the decentralized nature of the fediverse, you have a choice of which instance to join, and so I chose to join kitty.social which is run by a good friend of mine.

After a small learning period, I started using this more and more. It was nice to be on a social platform that wasn't constantly pushing an algorithm, or demanding more and more of my information to use it. All I needed to provide was a valid email address, a username, and a password. I very quickly noticed too that the atmosphere on the fediverse was vastly different from similar social platforms such as Twitter. Everything seemed to be a lot calmer and it was easier to make connections with other users.

Due to a few issues with kitty.social and my drive to get a better understanding of this platform, I chose to start hosting my own fedi instance. Since my entry point was Pleroma, this was a good place to start.

## Hosting
Hosting a fediverse instance is nothing like hosting a typical website. There are a lot more moving parts and a lot more to consider. For a start, you initially need to understand the performance requirements of your projected local user base. If you plan to have a lot of active users, you need to make sure the underlying hardware can handle it.

With my choice of Pleroma in hand, I originally hosted the software using some unused resources on a dedicated server I had. Since I use Docker for everything I can, this wasn't really much of an issue as I could limit the resource usage of Pleroma and I didn't have to deal with any conflicts in software versions. Since then, the fediverse server has been moved to a small VPS that is pretty much dedicated to hosting Pleroma.

The fediverse does generate a lot of web requests at times though; this is something we observe quite a lot! If someone with a lot of followers across many other instances shares something that you posted, suddenly, there are now a lot of other instances requesting that original post from you... all at once! You get used to this kind of traffic, however.

## Moderation
So this is one area that I found very interesting. Moderation within the fediverse is also decentralized to a point. If you come across a problematic user, you can directly deal with the issue yourself or forward it to the server that the user resides on. This is amazing because you're always in control of what is visible on your own server.

From the beginning, I became friends with a few other server admins that have similar views on moderation to me. This is something I do recommend as it allows you to ask others for help, or input on situations that may be a little more complex such as problematic servers.

## Trying other software!
After about a year in, I noticed a few close friends trying out an upcoming fediverse software called Misskey. It had many additional features, a much cleaner interface, and overall seemed to be a lot friendlier to use.

Originally, I set up a single-user Misskey server with the intention of just testing out the software to see these new features for myself, but I very quickly became hooked. Everything just felt more natural and the new features were really useful. Being able to share someone else's post as part of your own post was amazing; learning about MFM (Misskey Flavored Markdown) and the creative posts you can make using it was just a lot of fun! I've even contributed to MFM by adding a feature that I felt was missing.

So... the plan of keeping the Misskey server as a testing ground just for myself kinda fell through. Without me really noticing, I was using it more than my original Pleroma server; I had invited some friends to come and try it too and suddenly, it was my main account. Whilst I still maintain everything for the Pleroma server, going back to the interface for it just feels a little dated now, although I do have a plan for this in the near future...

## The forks!
As is always the case with open-source software, forks often happen. There's a conflict in ideas and plans for the software and someone makes the choice to develop those on their own fork instead.

I've been keeping my eye on a fork of Pleroma called Akkoma, which solves quite a few issues I've faced when running Pleroma as well as adding in some additional cool features. To keep it brief, we are planning on upgrading the instance to this in the near future.

A few months ago, I also started looking into forks of Misskey and quickly came across Foundkey. They continued the drive for new features, improved performance quite a bit, and did a bit of spring cleaning to the code base. So my plan was set, try and migrate the instance from Misskey to Foundkey.

We were a few versions behind on the updates due to some back-end issues, but this turned out to be a good thing since the version the instance was using was "pre-fork". This means that updating straight to Foundkey would be a breeze... right? Apparently not!

## Switching from Misskey to Foundkey
Since we have a few users now on our Misskey server, we did the sensible thing of testing the upgrade before going ahead with it, and I'm glad we did because there were a few headaches.

To start this, we downloaded one of the latest backups we made and got everything up and running again in a test environment. Once we confirmed that everything was working, we started the process of upgrading it and noting down anything we had to do outside of the typical steps.

The first issue we came across was that Foundkey was using a much newer version of Postgres, so now we had to factor in migration for the database as well. Luckily, after some careful planning and testing, we had this working smoothly every time.

And now for the strange issue. Once we'd upgraded the database, we switched the software over and started the database migrations... but it was getting stuck every time we attempted the process. It was time to do some investigation.

We quickly found the migration that was causing this problem, but the issue was that it wasn't doing anything that would actually cause this problem. It didn't make any sense! Eventually, we brought one of the Foundkey developers into the loop and now there were more of us scratching our heads at this odd behavior. In a last-ditch effort, I removed that specific migration for now and tried again... it worked! We added it back in so that it would run that migration and... it still worked! Yay! We had a migration plan fully completed, even if it was a little strange.

To keep things short, we scheduled some downtime for the live instance, followed the migration plan and everything just worked. We've been using Foundkey for over a month now and I can't say we've had any significant issues.

## Summary
Wow, this post ended up being much longer than I originally thought it would be, but I'm going to leave it here. Maintaining all of this can be a little stressful at times, but it's very rewarding knowing that you're contributing to something important.

I will eventually make a "Part 2" of this, where I discuss other federated services I host such as XMPP and Matrix, but as you can see from my frequency of blog posts, I can't really say when that will be finished!

I've included a few thanks to people below who have assisted greatly over my time here as well as links to their fediverse profiles (very fitting). This list is far from complete and there have been so many people who have helped me over the past few years! If your name isn't below, I still appreciate everything you've done!

---

[Kira](https://deargod.no/@kira) has given me a lot of moral support and help, as well as contributed as a moderator for my instances.

[Johann](https://genau.qwertqwefsday.eu/@Johann150)'s help was well needed when it came to migrating from Misskey to Foundkey. He's also fixed a lot of small issues with Foundkey as we've found them.

[Puniko](https://mk.absturztau.be/@puniko) is a good friend and has always been someone I can ask for assistance when it comes to moderation.

[Stux](https://mstdn.social/@stux) has by far one of the biggest and most active following on my timeline. He's also helped stress-test our instances quite a few times by sharing my content!

Psycadelika (Not on fedi) has also been a huge help! She checked this blog post for grammatical mistakes. There were a few!

