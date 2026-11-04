---
title: 'Automating my website with Docker and Watchtower'
summary: 'I decided to streamline my website’s deployment process using Docker and Watchtower. This post covers building a custom Docker image for Laravel and setting up automated deployments.'
date: '2024-09-28'
---

## Introduction

As with most of the ideas I have, this one started when I was perusing YouTube late at night instead of sleeping. I came across a video by a channel called [Dreams of Code](https://www.youtube.com/@dreamsofcode) outlining the best way to set up a production-ready VPS for a website. While watching the video, I suddenly remembered how much work goes into actually deploying one of these blog posts or making any changes to my website.

First, I need to make the changes, which isn't too difficult because of the way I have things set up. But then, to deploy the changes, I need to push the code to the Git repository, log in to my remote server, find the directory for the website, pull the changes, run any post-commands I need to execute, fix permissions... the list goes on!

This video gave me an idea. I wondered if I could take what was done and make it work for my website!

## Step 1: Getting Laravel to work inside Docker.

This may seem like a simple process. Laravel actually has many official and unofficial Docker images. I could just choose one of those and be done with it!

Not so fast.

The standard images expect you to be using a standard installation of Laravel, with a database, maybe some Redis caching, and a few other bits and bobs—all the stuff this website really doesn’t need. Including packages for these would just be pointless for me! So it was time to build my own image.

The first step was picking a base image that my image would then build upon. This was an easy choice since I wanted something lightweight and fast. The choice had to be Alpine! So now it’s time to actually build my image’s Dockerfile.

Here is the basic outline of the Dockerfile I ended up writing for my website:

```dockerfile
FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

RUN apk add --no-cache \
    php \
    ... a rather lengthy list of other packages

RUN curl -sSL https://github.com/composer/composer/releases/download/2.3.5/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

WORKDIR /var/www/html

COPY . /var/www/html
COPY .env.prod /var/www/html/.env

RUN composer install
RUN php artisan key:generate
RUN npm install
RUN npm run prod

EXPOSE 9000

CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "9000"]
```

I’ve shortened the file, as I don’t want this blog post to be a few miles long, but the general idea is to install all the required packages for my website to function, such as PHP and Node.js, install a few more dependencies like Composer, move my website’s files into the container, and then run a few setup commands.

After a quick `docker build .` and test, it all seems to be working just fine!

## Step 2: Where am I putting this image?

Up to now, I’ve only really deployed my own Docker images on GitHub for public projects. As my website is in a private repo (mainly due to shame of the code), I needed a way to actually push the image to the remote server I chose to host this website. For a change, I decided to try out Docker’s own image host, Docker Hub. After registering, I quickly saw that I had access to host one free private image. Perfect, just what I need for this!

With a few commands, I was able to get my local machine logged into my new Docker account, and I had my image built and published.

A few more commands on the server and I could pull the private image down too. Everything was working just as planned!

## Step 3: The Docker stack

This is where the video I watched earlier came into action. I saw from the description that they had actually published the code for their project to a GitHub repo. Amazing, I didn’t need to watch along again and copy everything from the video; I could just grab from the repo instead!

The whole reason I wanted to base my website’s hosting on this repo was that they used something called Watchtower. It’s a Docker image monitoring system that checks periodically for updates to images you have running and will auto-deploy new versions. This one container will allow me to streamline my whole deployment process from a 10-minute task of jumping to terminals and manually deploying, to just pushing my image to Docker Hub and letting Watchtower handle everything else.

This is the Compose file I ended up with after a few tweaks:

```yaml
services:
  watchtower:
    image: containrrr/watchtower
    command:
      - "--label-enable"
      - "--interval"
      - "30"
      - "--rolling-restart"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
  traefik:
    image: traefik:v3.1
    command:
      - "--providers.docker"
      - "--providers.docker.exposedbydefault=false"
      - "--entryPoints.websecure.address=:443"
      - "--certificatesresolvers.myresolver.acme.tlschallenge=true"
      - "--certificatesresolvers.myresolver.acme.email=my@email.address"
      - "--certificatesresolvers.myresolver.acme.storage=/letsencrypt/acme.json"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.web.http.redirections.entrypoint.to=websecure"
      - "--entrypoints.web.http.redirections.entrypoint.scheme=https"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./letsencrypt:/letsencrypt
      - /var/run/docker.sock:/var/run/docker.sock
  portfolio:
    image: mywebsite/image:latest
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.portfolio.rule=Host(`richardbowey.co.uk`)"
      - "traefik.http.routers.portfolio.entrypoints=websecure"
      - "traefik.http.routers.portfolio.tls.certresolver=myresolver"
      - "com.centurylinklabs.watchtower.enable=true"
    deploy:
      mode: replicated
      replicas: 3
    restart: always
```

As you can see, it’s fairly compact and minimal. My website container at the bottom doesn’t actually need any environment flags passing to it or any ports to be exposed. It just works using Traefik’s flags.

## Step 4: The first deploy and test

Everything was running smoothly so far, with no major problems, and everything was tested and confirmed working... but that was about to change!

After `docker compose up`'ing the container stack, I browsed to my website and was greeted by my content, but it didn’t look correct. My stylesheet was not loading properly. I visited the stylesheet manually, and it loaded just fine, so the issue must be something else. Time to open the inspector and look at the network traffic for my website. Oh... CSP errors...

At first, I assumed I’d deployed something incorrectly. It worked perfectly fine when I was testing it locally, but after inspecting the HTML of my website, I found that the stylesheet was being loaded over HTTP rather than HTTPS. That might have something to do with it!

After a quick look through my code, I found that the easiest way to fix this issue was to ensure all URLs generated on the website were forced to HTTPS in the production environment. This is fairly simple in Laravel, and I’ve included the rules I added to my `AppServiceProvider.php`'s boot function just below:

```php
if (config('app.env') === 'production') {
    URL::forceScheme('https');
}
```

## Step 5: Another Deployment!

After fixing that small bug, I rebuilt the image and pushed it back up to Docker Hub. I was pleased to see that after about a minute, my website was automatically fixed. This confirmed that I’d resolved the issue and that Watchtower was actually doing its job perfectly!

Success!

## Wrapping Up

So, in the end, was this required? As with most of the changes I make to this website, no! But it was something fun to try for myself, and I’m pleased with the results. I’m actually going to be re-deploying my website shortly after writing this blog post, so if you’re reading this, it worked!

Now that I’ve completed the transition to a very smooth deployment practice, I’m already thinking about what other websites I currently host and which I can easily move to this new system.

My next steps are going to be seeing if I can get my Traefik to work with my Grafana setup, so I have monitoring enabled, but that’s for another day!

## Credits

I'd like to give a special thanks to [Dreams of Code](https://www.youtube.com/@dreamsofcode) for making [this](https://www.youtube.com/watch?v=F-9KWQByeU0) video as it really inspired me to ~~copy~~ try this setup myself.


