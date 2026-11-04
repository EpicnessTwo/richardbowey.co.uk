---
title: 'From Windows to Linux: The Challenge of Daily Driving something better'
summary: 'I moved my main PC from Windows to Linux to see whether it could fit into my daily workflow without too many compromises. Three months later, here’s how the experiment actually went.'
date: '2026-06-15'
---

## Preface

This blog post was written based on a bunch of notes I made during the Windows phase and was loosely typed up halfway into what was originally going to be a 30-day challenge. Some parts might be less formal, or more story-related, but welcome to the dump of my brain. Life is a story, right? This is why the tenses might switch a little throughout this post.

## How this all started...

For months now, I've been rather vocal to friends about wanting to try running Linux on my PC. I've run many different distros of Linux on my laptops for many years at this point, but I've always felt that installing it on my PC was a final boss of sorts. My PC is where the majority of my screen time comes from; it's my main gaming machine, most of the software I personally write is done here, and I talk to friends online here too. My point is, it needs to be the most stable of my machines. I can get away with reinstalling my laptop because of issues, since I usually keep it fairly disposable and light, but having to reinstall my PC would be considered major downtime for me. I did have some prerequisites though...

Whilst I wouldn't call my setup and use case unique, there were a few things that I needed from day one.

1. All of my peripherals needed to work. I have a Stream Deck XL that I heavily use for shortcuts and toggles, and I want to continue with this practice.
2. Azure AD Remote Desktop support is a must. My work laptop supports this, so this is a definite requirement.
3. Switching shouldn't add any additional burden to any part of my workflow; it should be the same level of effort to do things, or less.
4. VR support, although this isn't as big of an issue at the moment. I'll explain later!
5. A quick and painless way to switch back in case anything major became a pain point.

## The Challenge

I didn't want to jump on the whole Linux challenge that everyone is doing, with a list of tasks I needed to complete and a direct head-to-head comparison with Windows. This is more of a personal challenge to see if I can lessen my reliance on Windows and find a comfy alternative without making too many compromises.

There is something on the line though. As you will read about below, I have Windows on one SSD, Linux on another. Once I was confident with my choice, I'd format one of the drives and keep the other as my OS.

## What I'm working with

I feel that listing my hardware is just as important here, as that can sometimes be a factor in what distro to pick and what limitations will be found. In my case, however, I think my build is pretty well supported on pretty much all Linux distros.

### My PC

**CPU**: AMD Ryzen 9 5900X  
**RAM**: 64 GB DDR4  
**GPU**: AMD Radeon RX 6900 XT

### Peripherals

**Keyboard**: Akko 5075 with some light modifications to the firmware  
**Mouse**: Razer DeathAdder Elite  
**Audio**: Behringer U-Phoria UMC22  
**Other**: Stream Deck XL, Quest 2

From my main PC specs, there should be no issues with switching. AMD is very well supported on Linux, and I have no doubt this will go smoothly. As for my peripherals, my only concerns were my Stream Deck and my Quest 2. My keyboard needs no additional drivers to function fully; all of the custom stuff is in firmware, not software. My mouse has also never worked properly under Windows; the drivers just didn't detect it, so I couldn't change any of the settings outside of the DPI buttons on the mouse itself.

## The ball is now rolling!

Saying I'm going to install Linux on my PC is only half the story. Actually doing it was a totally different chapter. If you take a look back to the fifth requirement for this challenge, I wanted a clean and easy way to restore Windows back to exactly how I left it. Whilst I can easily restore from backups, it's not quite as fast as I wanted. There's over 6 TB of data involved with my Windows install; I'm a bit of a data hoarder...

The first step was to get my total install size as small as possible, so armed with a few tools to tell me where all of my space had gone and the thought process of, "If it's old and I don't immediately know why I need to keep this data, it's not worth continuing to keep it", I started butchering away at my files. Everything important was already backed up both inside my homelab and off-site, so no long-term damage could be caused by doing this.

Fun little question for the reader: do you know how many games you have installed on your computer? How about how much space they all take up?

Yeah... over 2 TB of space was just game installs, some of which I'd not touched in years. Gone!

So my plan was now in place: get my Windows install as small as possible! Currently, it was spread across a 2 TB NVMe drive and 6 TB of HDD space. If I could get that below 2 TB of total used space, I could migrate it all over to an external HDD for safekeeping and have an easy restore point whilst leaving me with a blank slate.

## Change of plans!

Most of the way through cleaning out the clutter from my PC, I decided I wanted a break and headed to town for some lunch. Armed with my headphones and a comfy hoodie, I ventured into the outside world. I'm not going out there without some comforts; there are people around!

My trip led me past a popular UK electronics discount store, and I decided to head in to see what deals were currently in the window. A lot of consoles, overpriced RAM and GPUs, a 2 TB Gen4 NVMe drive at half the price of others with similar specs, a lot of phones... wait...

Why is that NVMe so cheap? Too good to be true?! I took a closer look through the glass and it didn't look heavily used. The pins were immaculate, there was no residue from thermal pads, but the store could have easily cleaned it up... but they do also offer a five-year warranty... something isn't adding up.

I left the store empty-handed and continued on the main side quest of getting some food. But I couldn't get the idea out of my head. I had to go back and grab it. One quick purchase later and it was now mine! Where's the catch though? There's always a catch with these things!

Armed with an NVMe, a drink and a sandwich, I headed back to the comforts of home. I had to at least test this thing...

I inserted it into a caddy, connected it to my PC and booted up CrystalDisk. Yes, it's still an amazing tool. 40 GB of total reads and writes, less than an hour of power-on time, and I was the second power-on count?! Did I just buy a brand-new NVMe for the price of a used one? Jackpot!

Okay, looks like I can hold off on migrating my Windows install to an external drive. I now actually just need any data I want to move over to Linux with me. That makes my life easier!

## The install

So, I haven't actually mentioned what distro I picked yet. There were some contenders based on my years of experience with Linux. I could go with Debian or Ubuntu since I have the most experience with them, I could try something like Pop!\_OS or Chimera since I sometimes do have a chance to game, I could go for something like Amarchy, or I could consult those "TOP 10 LINUX DISTROS YOU NEED TO INSTALL RIGHT NOW" articles. Instead, I went with what I'd been running on my laptop for the past year or so, something I was fairly comfortable with, and something I'd only had to reinstall once. That was due to my laptop catching fire. Manjaro!

Yes, my laptop did actually catch fire. I still miss my trusty XPS 13...

So, data backed up? Check! Important files on a spare external drive? Check! Manjaro flashed to a USB? Check! I was ready!

I swapped over my NVMe to the new one, booted to the USB and... and... error. Yeah, I never worked that part out. For some reason, the 2026 build of Manjaro I had freshly flashed just wouldn't allow me to boot. I even tried it on other devices and got the same error. But not a total loss, I still had a late 2025 build on the USB too!

The installation process was fairly simple, and it was nice to be able to do it all with the Ethernet cable attached! Those who don't want to sign in to a Microsoft account will know that pain from the Windows 10 days.

It was installed! I also resolved the issue of an outdated build by just running updates; that fixed everything and brought me up to date.

## The problems...

My first problem was the whole Azure AD support for Remote Desktop. Someone had created a PR to get this working inside Remmina, but it hadn't been released just yet. Luckily, I know some people, and armed with knowledgeable friends and persistence, I was able to get the feature built into Remmina. I could now log in to my work machine and continue to do my job.

The second problem wasn't as straightforward. For some reason, PlymouthD was consuming more and more RAM on my PC the longer it was on! At its peak, it was consuming around 16 GB of RAM. For those who don't know what that is, and I was very much in that boat not too long ago, it handles that fancy splash screen you get when booting up your PC and hides the walls of output logs from the boot process. I think it does a few other things too, but either way, it should not be consuming RAM like it was an Electron app! I never found the cause of this either, instead opting to remove it altogether from my install. I didn't really care about a fancy start-up screen anyway, and it hasn't impacted anything else.

Another issue is RustDesk. I often use this to remotely access my laptop and PC, especially when I'm away. It works fine when I want to connect to my laptop, but for some reason, I get an error about not being able to render the screen when I connect to my PC. I've still not worked this one out yet. For now, my solution is to just make sure all my code is pushed up and anything I need to access whilst away is either accessible over my VPN or local on my laptop. Not ideal, but it will do until I can find a solution.

## The first week

This was probably one of the more frustrating weeks of the challenge.

I've grown attached to all of the programs I had installed on Windows, and realising that most of them were missing was a bit of an eye-opener. I knew I used a lot of software, but I don't think I realised just how much of my day-to-day workflow depended on things already being installed and ready to go.

It wasn't too difficult to install most of this software again on Linux, but it was certainly different. Some of it was also a little less intuitive to install than I expected.

A good example of this is PhpStorm and RustRover, two IDEs I use quite often for both work and personal development. For some reason, both of them require their own JRE runtime to be installed, but unlike other software in the package manager, those runtimes aren't actually listed as dependencies.

Installing either IDE without the dependency will just throw an error about the Java runtime not being installed, which is confusing when I've already got a few versions of Java installed for Minecraft! After quite a bit of searching, you just have to know that both IDEs have their own runtime packages, and that those need installing too.

Aside from that, the rest of my most-used software, such as Zen Browser, Obsidian and Discord, installed cleanly.

I do have a note about Discord though. Why is it smart enough to know it needs an update, but the updater itself attempts to download a Debian package file instead? I'm not sure where the blame lies here, and I know the solution is to just close the Discord updater and run the updates through my Arch package manager instead. It's still just a little annoying, but I guess I just need to make sure to run updates more often.

Scratch that last part. It seems Discord actually changed out their updater, and now it's not so much of a problem anymore! Yay Discord?

On the topic of package managers, Pamac is such a nice gap between the comforts of `apt` and the currently confusing approach of `yay`. Being able to install packages with subcommands instead of flags makes it feel more natural. I know it's a bit of a stop-gap, but it certainly helps!

## So, can I actually daily drive this?

After the first week, things started to feel a bit more normal. The initial rush of reinstalling software, finding alternatives and working around missing bits had mostly passed, and I was starting to use the machine instead of constantly configuring it.

That was probably the point where the challenge became more interesting. It stopped being "Can I install Linux on my PC?" and became "Can I actually live with this every day?"

For the most part, the answer was yes.

The boot process was a lot faster, most of the software I actually use was either already supported or had a decent alternative, and the machine didn't seem to slow down after a few days of uptime in the same way my Windows install sometimes did. It felt like I was spending less time fighting the machine and more time just using it.

That said, it wasn't perfect.

Some games still refused to play nicely. Midnight Ghost Hunt, for example, just wouldn't load. I didn't spend too long trying to fix that one, partly because there are only so many hours in the day, and partly because my friends and I could just switch to something else instead. Annoying? Definitely. A deal breaker? Not really.

The stranger issue was with my screens. From time to time, usually after the machine had been locked for a while, HDR and scaling would start behaving oddly. Sometimes turning one of my monitors off and on again would fix it. Other times, it needed a reboot. I've still not worked out exactly what's causing it, but it's one of those little reminders that things aren't quite seamless yet.

Still, despite the rough edges, this was the point where Linux on my main PC started to feel less like an experiment and more like my actual setup.

## So, three months later...

So, three months later, am I still running Linux on my main PC?

Yes!

I think the biggest compliment I can give it is that most days, I don't really think about it anymore. The first week was full of reinstalling software, tweaking things, finding workarounds and occasionally wondering whether I'd made a terrible mistake. But now? It just feels like my PC.

That feels like the real success of this whole experiment. It didn't need to be perfect, it just needed to stop getting in the way. For the most part, that's exactly what happened.

By this point, the positives weren't really individual features anymore. It was more that the machine felt normal. I wasn't booting into Linux and thinking about what might break, what might be missing, or whether I should have stayed on Windows. I was just using my PC.

There are still things I need Windows for, especially on my work laptop, but my personal machine doesn't feel like it's missing anything important anymore.

That's probably the real answer to this whole challenge. Linux on my main PC hasn't been flawless, but it has been good enough that I stopped treating it like a challenge.

As for the Windows drive? That's gone now. I needed more space for games, and apparently that was the final push it needed.

At this point, it's just what I use.

