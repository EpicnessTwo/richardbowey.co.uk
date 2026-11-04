---
title: "Why I'll never be recommending Virgin Media to anyone going forward."
summary: 'After over a decade as a Virgin Media customer, constant outages, poor support, and broken promises have finally pushed me to switch to a more reliable ISP.'
date: '2025-02-13'
---

## Pretext
This post is going to be a bit of a rant, but it should be seen as a warning about researching companies before you sign contracts with them.

## Introduction

For over 10 years now, I've been a Virgin Media customer in some form. Even back when I was still living with my parents, Virgin Media was our ISP of choice. I was impressed enough with their connection speeds and price that once I moved out and started living on my own, I continued to call them my ISP.

As a long-time customer, however, I've been able to slowly watch the decline of their support and service quality.

## Problem #1 - Lack of IPv6

If you're wanting an internet connection that supports IPv6, look elsewhere. Virgin Media has been teasing that IPv6 support is just around the corner for longer than I've been a paying customer. Despite IPv6 being a protocol that is older than me, Virgin Media seems to be one of the few remaining ISPs that still have no concrete plans to roll it out. This has been a pain point for many of their customers, including myself, as some services start switching to IPv6 and charging more for IPv4 addresses.

Not all is lost, however. There's more than one way to gain access to the nearly 30-year-old standard! Services such as TunnelBroker and SixXS offer 6in4 tunnels that allow you to take your IPv4-only network and make it dual stack (kind of). Whilst this does work on Virgin Media, good luck getting any kind of speed or stability!

Over the years, I've attempted to get an IPv6 tunnel working at full speeds, but for some reason, and only on Virgin Media connections, you're limited to about 20 Mbps. There have been many people complaining about this very issue on the forums and subreddit. I've tested the exact same setup on IPv4-only services I've used, as well as other ISP connections, and none of these issues appear there. Very odd!

It’s unclear why Virgin Media connections struggle with 6in4 tunnels, but many users, including myself, have noticed performance issues.

## Problem #2 - Lack of training

I've had to place my fair share of support calls to Virgin Media over the years, and then some. At one point, I could navigate their phone menu system without actually listening to the options. Once you finally get through to someone, though, the frustration starts. Despite having proof otherwise, you'll be gaslit into thinking you're at fault. Maybe it's a problem with your end device (despite verifying the fault from numerous devices), or there's a power issue with your router. If you use your own router, though—despite it being a supported option—you can bet that your own router will be blamed as the faulty item.

Currently, I'm a Virgin Media Business client, and the plan that I've selected from them automatically puts their router/modem combo unit into Modem Mode, meaning you are required to use your own router. I've lost track of how many times I've been told that the fault is because I'm using a third-party router and not theirs, despite telling them that it's required for their own plan!

## Problem #3 - Too many engineers!

It's always nice to have a dedicated team of engineers at your disposal to go and fault-find at the client's house. Not so much when teams are being sent over and over again for a fault that has already been identified and is somewhere else.

It seems that every support call ends the same way: _"We're going to book an engineer to come and resolve the issue for you. What is your availability?"_ It's a nice gesture, but when the GRE tunnels that my plan relies on are not working because there's a fault with their servers, or there's an identified network fault, why are you trying to force an engineer visit?

In the past month, I've had around four visits from engineers, all of them saying the exact same thing: there's a network fault somewhere outside the scope of their access, and the networking team needs to resolve it. Then, a few days later, a new team shows up and tells me the same thing.

## Problem #4 - Admitting fault

I think this leads on from Problem #3. Being a business customer, the contract between me and Virgin Media is fairly detailed. It outlines what my obligations are as well as what Virgin Media's are too. One of the more _fun_ details of the contract is the 99.9% uptime SLA. With me currently having daily outages, I don't recall the last time my connection was ever up for more than 99.9% of the given time. I have internal and external monitoring on my connection from multiple sources, all of which show an uptime much lower than the outlined SLA in my contract.

Trying to report this and cancel the internet connection, though, will just lead to being told that I have to wait out the duration of my contract. I'm sure the outcome would be very different if I was the one in violation, though!

## My next steps, and a bit of a conclusion.

Due to all of the issues outlined above, and many more, I've finally decided to make the move to another ISP. I get that no service is perfect and that outages happen from time to time, but daily outages? That’s just not acceptable. If I were running a service this unreliable, I wouldn’t expect to keep my customers for long!

To be fair, when Virgin Media’s connection is stable, it’s fast and works really well. They’re also one of the few ISPs that can offer me multiple IPv4 addresses, which has been genuinely useful for what I do. But stability is everything, and at this point, it’s just not there anymore. I’m dealing with outages pretty much daily now, and some have lasted over six hours at a time—completely unacceptable when I rely on my internet connection for work and to run my own services.

To make things worse, where I live is basically a dead zone for mobile service, so switching to my phone’s connection isn’t even an option. When Virgin Media goes down, I’ve got nothing to fall back upon.

Because of all this, I’m moving to a competitor in the area that offers FTTP (instead of coax) and has much better customer reviews. At this point, there’s really nothing Virgin Media could do to keep me—I’m ready to trial other providers and see if they can actually offer a reliable service.

I know this post is a bit of a rant, and I don’t want to make a habit of writing these, but my connection is important. I host services from home, and every time there's an outage, it reflects badly on me.

At the time of writing, I’ve just had yet another email about an engineer call-out. I wonder what they'll think when their connection is no longer my primary line.

**Virgin Media, please do better.**

