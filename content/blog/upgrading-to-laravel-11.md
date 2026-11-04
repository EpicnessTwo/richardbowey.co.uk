---
title: 'Upgrading to Laravel 11'
summary: 'The joys of upgrading to a release that is less than 12 hours old, and all the fun that it caused!'
date: '2024-03-13'
---

## A quick introduction

As always, this is going to be a quick post. I just wanted to talk about the fact that I've upgraded my website to Laravel 11. I'll talk about the process and some of the issues I ran into.

## So what the hell is a Laravel?

Laravel is a PHP Framework that allows you to build web applications. It's a great framework that has a lot of features and is very easy to use. It's also very popular and has a large community of developers.

Aside from that, it's also the framework that I chose to use for my website. So if you're reading this, you're interacting with it right now!

## Upgrading to Laravel 10... uh, I mean... 11

Yeah, I kinda forgot to upgrade my website for a while. But now that Laravel 11 is out, I figured it was time to upgrade. It was a bit of a pain, but I managed to get it done. Since my website is rather simple and most of the functionality is provided by Laravel, it wasn't too difficult to upgrade.

It wasn't totally without issue though.

## Issue 1: Markdown

I actually write all of my blog posts in Markdown since it's super simple to learn and use. Originally, I was using a package called `graham-campbell/markdown` to parse my markdown files. However, since Laravel 11 has only just been released, the package hasn't been updated to support it yet. Instead of waiting for the package to be updated, I decided to switch to another package, called `spatie/laravel-markdown`. 

It was actually rather simple to switch over, and there's no noticeable difference in performance or look. It also supports a few additional features that I might make use of in the future such as code highlighting.

If you're reading this, then it's working!

## Issue 2: Minification

I was using a package called `htmlmin/htmlmin` to minify my HTML. However, this package also hasn't been updated to support Laravel 11 yet (or even Laravel 10). I'm still on the lookout for a replacement, but for now, I've just disabled minification. It's not a huge deal, but it's something I'd like to fix in the future.

## Conclusion

That's about it. Laravel 11 was released less than 12 hours ago at the time of writing this, so I'm sure that leaving it for a while wouldn't have been a big deal. However, I wanted the challenge and I wanted to see if I could get it done. I did, and I'm happy with the result.

Now for the rest of my websites...

