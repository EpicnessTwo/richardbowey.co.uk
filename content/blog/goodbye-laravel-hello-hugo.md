---
title: "Goodbye Laravel, Hello Hugo!"
summary: "New year, new website, same old me! This time with less complexity, more Hugo, and absolutely no promises I won't rebuild it again!"
date: '2026-11-13'
---

There are three certainties in life: death, taxes, and me rebuilding my website again.

My last big rebuild actually introduced this blog back in 2022. It's when I finally gave up trying to tame WordPress and switched over to Laravel. At the time, I explained that I was switching from WordPress to Laravel because it's what I use for work. Whilst it's still true that my professional work is focused within the Laravel ecosystem, that itch to try something new was back again.

I also set myself some goals in that blog post too. No cookies, no JavaScript, a clean design, fully responsive and fast. Those goals still ring true. You can still check with your inspector and see no JavaScript being loaded, no cookies being stored. I don't even need one of those obnoxious cookie banners where I promise to keep your data safe whilst only sharing it with my 10,000 marketing partners!

## So why Hugo?

The short answer: why not?

To expand a little on that, I've been wanting to play around with other frameworks recently, and the two that have caught my eye are Hugo and Astro. Hugo seems like a good contender for my personal website since it's small, easy to learn and super fast for building a small portfolio site with a blog attached! There have been a few frustrations along the way, such as not being able to nest shortcodes inside other shortcodes, but I think that's more of a me problem than a Hugo problem.

The docs for Hugo are simple to follow too, and it's actually been a lot of fun learning something new for a change. It's also made me realise just how much I was overcomplicating things with my previous setup.

With Laravel, I needed a full PHP environment just to run what is essentially a mostly static personal website and blog. That meant keeping PHP, Laravel and all their dependencies up to date. In the last year or so, I've had to drop what I was doing on multiple occasions to deal with security updates specific to Laravel and PHP, on top of all the usual maintenance my servers already require. Not exactly how I want to spend my free time! I've got TV shows to binge!

Don't get me wrong, I'm not blaming Laravel or PHP for any of this. Security vulnerabilities are an inevitability of software development, and both projects do a great job of addressing them. But by moving my personal website to Hugo, I've eliminated a lot of that complexity. No PHP runtime and far fewer things to worry about maintaining. Just a bunch of static files that can be served by practically anything.

I also took this chance to rework the design of my website. It's no secret that I'm a fan of the Catppuccin colour schemes, and so I've adopted them here too. I've not quite finished yet either, so expect things to move around or change as I slowly work out what I want on my site. If you have any ideas too, I'm open to them!

## Astro?

Remember when I mentioned Astro? Well, I'm not quite done rebuilding websites just yet! In the next few months, I plan on converting Land of Kittens' website over to Astro!

The requirements around that website are very different from this one, and it comes with its own host of challenges. A lot of dynamic content, links that require server-side processing and such. It's not going to be as simple as this site, but it's going to be a fun challenge! I'll also likely open-source that website at some point too as I'm working through everything. Before that happens, though, I've got some services to build out first, so it's very much a "watch this space".

## Final Remarks

So yeah, new website, new design, new look and feel, but same principles.

Oh, and you can now see the website's source code too. Please don't be too harsh on how much of a mess I made! Learning is part of the process!

[https://github.com/EpicnessTwo/richardbowey.co.uk](https://github.com/EpicnessTwo/richardbowey.co.uk)