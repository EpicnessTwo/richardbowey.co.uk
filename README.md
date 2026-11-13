# Richard Bowey's Portfolio

Personal portfolio and blog built with [Hugo](https://gohugo.io/) and Tailwind.

## Requirements

- Hugo Extended 0.167.0
- Node.js 22 and npm

## Local development

Install the CSS dependencies and start Hugo’s development server:

```sh
npm ci
hugo server
```

## Production build

```sh
hugo --minify
```

The generated site is written to `public/`.

## Content

- Main pages: `content/`
- Blog posts: `content/blog/` (Markdown)
- Static images and files: `static/`

Each blog post is also published as Markdown at `/blog/<slug>.md`. The blog listings are available as JSON at `/blog.json`.

## Docker

Build the static site into an image that listens on port 80:

```sh
docker build -t richardbowey-portfolio .
docker run --rm -p 8080:80 richardbowey-portfolio
```