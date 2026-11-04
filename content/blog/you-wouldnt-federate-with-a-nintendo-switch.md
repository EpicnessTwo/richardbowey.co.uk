---
title: "You wouldn't federate with a Nintendo Switch!"
summary: 'Explore the fun and impractical journey of running a fediverse instance from a Nintendo Switch.'
date: '2023-08-04'
---

Before I start rambling on with this blog post, I want to say that this is not a tutorial or a guide on how to replicate what I've done. Those with the right knowledge and hardware can easily do this too!

## Where did this start?

In June of this year, a good friend of mine gifted me a Nintendo Switch that was faulty. As I love to tinker with hardware, this was a fun challenge for me to try and get it back into fully working order. It only required replacements for the Switch and Joycon rails. Now I had a fully working Nintendo Switch that was unpatched and could run the RCM exploit!

I started out with basic custom firmware for homebrews so that I could play some of my favorite PSP games again but I wanted to do more. I noticed that there was a port of Ubuntu Linux that could be installed onto the Switch... this is where the fun began!

## So, how did I do it?

As I stated at the start, I'm not going to go into crazy amounts of detail about what I did. This is more of a showcase and the story behind it. I first needed to work out what software I wanted to run. I knew it was going to be a fediverse server, but those who have been around on fedi for a while will know how many different ones there are, and all of the forks too! As I had recently switched one of my main instances over to [Firefish](https://joinfirefish.org) recently, this seemed like a good place to begin.

The first step was to install everything I'd need to get this running, I already knew I wanted to run the fediverse instance inside of Docker to make my life a lot easier. This means that all of the software requirements would be installed inside a container image rather than me needing to manually install everything myself, saving a lot of time and effort. But can you even run Docker on a Nintendo Switch? Yes, yes you can!

Next, I needed the actual software! At first, I attempted to clone the git repo but for some reason, I was running into a lot of problems where the connection speed would drop to nothing, or it would outright fail. Luckily, they offer the ability to download the current state of the code as a zip file, so a quick wget later and it was downloaded. Whilst I was there, I noticed that Firefish does actually offer arm64 images for Docker, even better... if it actually worked on the Switch.

With that idea out of the window, I knew I needed to build it locally instead. So with a quick change in the docker-compose file and of course putting the Switch into an overclock, I ran the command that I knew would consume most of my night. `docker-compose build`.

**-- 2 Hours Later --**

Technically, it took around 2.5 hours to build Firefish. Mainly because my ISP decided I didn't need an internet connection for about 30 minutes meaning I had to restart the build. But once it had been completed, I proxied the switch through my Nginx server and started the instance, waiting for it to fire up. After about 2 minutes, I was greeted by the Firefish welcome page, so I quickly set up my account and attempted to follow my main account to test out federation... and it worked!

## The Aftermath

It's been a few days now since I started this experiment. Since then, I have also tested [Akkoma](https://akkoma.dev) which is another instance software and aside from a few issues getting it to build, it also works flawlessly. As I'm writing out this blog post, notifications are pouring in from the few posts I made on the instance and whilst the CPU is a little "spicy", it doesn't seem to be impacting the instance at all.

## Do I recommend doing this?

The short answer, no.

The longer answer, maybe? Running a fediverse instance from a Nintendo Switch is really impractical, it wasn't designed to be used in this way and it's thanks to a lot of other people finding exploits in the console that I've even managed to get this far. That doesn't equate to maybe though. That comes from my love of tinkering with hardware and software, if I can do things like this, so should you! Just because something is designed to do only one thing, why shouldn't we at least see if it can do something else? Small projects like this are a great way to quickly learn about hardware and software, so tinker away!

