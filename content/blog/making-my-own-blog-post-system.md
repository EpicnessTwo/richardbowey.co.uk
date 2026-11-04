---
title: 'Making my own Blog Post System'
summary: 'I built my blog system from scratch with JSON and Markdown—no database—just for the challenge and speed.'
date: '2024-11-09'
---

## Introduction

So, for a start, you may ask why I chose to write my own blog post system. There are many existing platforms for blog posts, and even within Laravel (which is what I use for my website), there are many mainstream ways of creating blog posts, with a small database and a few models. However, this website has no database, no models, nothing. I wanted a challenge!

## Where to start?

When I was originally planning out this new website a few years ago, I knew I wanted to set myself some challenges. These were outlined in my first blog post on this website.

1. No cookies
2. No JavaScript
3. A clean design
4. Fully responsive
5. Fast

When working on the plan for Step 5, I chose not to use a database at all for my website, and that is something that remains true to this day. It makes deployments of my website easier as I don't need to worry about connecting it to additional services such as MySQL. I just build and push it somewhere. I still wanted a dynamic blog, though. Manually modifying the HTML and adding new pages every time I wanted to add a new blog post (like this very one) was out of the question.

I did originally plan to use something like SQLite but backed away from that idea at the last minute as I thought it would be far too complex for what I actually wanted out of this. Just a simple blog post index page showing all of my posts, and a show page that allows you to read a blog post. There's also a little-known third page that allows you to read the posts in Markdown, but I'll get to that later.

## So, no database. What instead?

As I've been in the industry for over a decade at this point and have worked with a lot of different storage methods for holding formatted data, I just had to choose the right one for me.

I knew from the start that I wanted to write my posts in Markdown, as this is a syntax I'm very accustomed to. However, out of the box, it doesn't offer enough flexibility for a full blog post system. It's good at holding the actual content but not much else. In this very system, I needed to store a lot more.

1. The Post Title
2. The URL Slug
3. The Picture
4. The Excerpt (Short description)
5. The Post Date

It seems that some Markdown processors do support some form of YAML injections within a Markdown file, but this is very non-standard, and I wanted something more flexible. Something like... JSON!

## So how does it all work?

If you're interested in the coding side, this is the part for you. If you're interested in clean and artisanal code, quickly look away now! My code for my blog post system is very functional but not very clean. It works, and it's fast. That's all that matters.

### Step 1. JSON Format.

In order to store my blog posts inside a JSON file, I needed to come up with a format that works for me—some form of standard for all of the fields. This is how it currently stands.

```json
{  
    "url": "",  
    "title": "",  
    "excerpt": "",  
    "created_at": "",  
    "content": ""
}
```

### Step 2. The controller.

Like with everything in MVC-based systems, you put the bulk of your code into the controller. I knew I'd need at least two functions inside the controller: one for loading the main blog page showing all of my posts and another for displaying a single post.

But between them, there's going to be a lot of duplicated code, so helper functions will also come in very handy here. As my blog posts have evolved, I've added quite a few more as well. The main one is used to actually fetch all of the blog posts for my website.

```php
/**  
 * @return array<string, array<string, string>>  
 */  
public function getBlogPosts(bool $full = false): array  
{  
    // Collect all the blog posts  
    $files = collect(Storage::allFiles('blog_posts'))  
        ->filter(fn($file) => Str::endsWith($file, '.json'))  
        ->sortDesc();  
  
    $posts = $files->mapWithKeys(function ($file) use ($full) {  
        $content = Storage::get($file);  
        $info = json_decode($content, true);  
  
        if (json_last_error() !== JSON_ERROR_NONE) {  
            return []; // Skip posts with bad JSON  
        }  
  
        $url = $info['url'] ?? '';  
  
        $info['thumbnail'] = asset('images/blog/thumbnails/' . $url . '.png');  
        $info['read_time'] = $this->getReadTime($info['content'] ?? '');  
  
        // Only include the content if we're showing the full list  
        if (! $full) {  
            unset($info['content']);  
        }  
  
        return [$url => $info];  
    });  
  
    return $posts->all();  
}
```

You'll notice that this function is set to public; it's actually used in a few other places, such as my sitemaps and XML feeds. The main bulk of this function, however, is to collect all of the blog post JSON files and turn them into a single JSON blob.

This can then be passed through to the blog index page so that I can generate a list of blog posts.

There are two other functions I've added to this controller too, which make the experience a little nicer for readers—both of which are being used in this very blog post.

```php
private function getReadTime(?string $content): int  
{  
    // Return 0 if the content is null or empty  
    if (empty($content)) {  
        return 0;  
    }  
  
    $wordCount = str_word_count(  
        strip_tags(  
            app(MarkdownRenderer::class)  
                ->convertToHtml($content)  
                ->getContent()  
        )  
    );  
  
    // Averaging 200 words per minute  
    return ceil($wordCount / 200);  
}

private function transformCodeBlocks(string $html): string  
{  
    $html = preg_replace_callback('/<code([^>]*)>(.*?)<\/code>/s', function ($matches) {  
        $highlighter = new Highlighter();  
        $attributes = $matches[1];  
        $content = $matches[2];  
  
        // Check for classes in the <code> tag  
        $hasClasses = preg_match('/class\s*=\s*["\'].*?["\']/', $attributes);  
  
        if (! $hasClasses) {  
            return '<span class="code-inline">' . htmlspecialchars($content) . '</span>';  
        }  
  
        preg_match('/language-([\w-]+)/', $attributes, $language);  
  
        // Sanitize and transform code content  
        $content = str_replace("\t", '    ', $content);  
        $content = html_entity_decode($content);  
  
        // Highlight content based on detected language or default fallback  
        $highlightedContent = $highlighter->highlight($language[1] ?? 'plaintext', $content)->value;  
  
        // Preserve spaces in text content between tags  
        $highlightedContent = preg_replace_callback('/>([^<]*)</', function ($textMatches) {  
            $text = str_replace(' ', '&nbsp;', $textMatches[1]);  
            return '>' . $text . '<';  
        }, $highlightedContent);  
  
        // Replace newlines with <br> for formatted output  
        $highlightedContent = nl2br($highlightedContent);  
  
        // Return formatted code block  
        $languageLabel = isset($language[1]) ? '<span class="code-block-language">' . htmlspecialchars($language[1]) . '</span>' : '';  
        return '<div class="code-block"><div class="inner-code-block">' . $highlightedContent . '</div>' . $languageLabel . '</div>';  
    }, $html);  
  
    return preg_replace('/~~(.*?)~~/', '<del>$1</del>', $html);  
}
```

The first function here allows me to split the blog post into words, which I then divide by 200 to work out the read time of a post. This works on the fact that people older than around 16 read at just over 200 words per minute. While it will never be fully accurate, it's a good indicator of how long one of my posts is without having to click on it and skim-read it.

The second function addresses some issues I've run into with the package I used to convert my blogs from Markdown to HTML, with code blocks being the main challenge. Most processors expect you to use something on the front end of your website to actually render the code blocks correctly, including features like code highlighting. As I don't use any JavaScript on my website, however, I had to get creative and render this all server-side first.

There are also standard functions here that return the index page, the blog page, and the Markdown page. But these are fairly simple, so I don't feel like making this post even longer by showing them.

## Writing the posts and importing them!

Now for the fun part! As my posts are written in Markdown, I can use anything I want to write them. If I'm in a rush, I can use something like Vim or Nano, or I can use something such as Obsidian to make it easier to write. Either way, I just need a simple Markdown file at the end of it. Once a post has been written, I just have to make a nice-looking thumbnail for the post, a bit of an excerpt, and name it!

For importing new posts, I have a small command within the backend of my website. I just pass through the Markdown file, specify the additional information such as the title and preferred slug, and it converts it to a JSON file for me. One deploy later, and it's ready for everyone to read.

## Would I change anything?

### Comments

I've always liked the idea of people being able to give me feedback on my posts. Currently, there are many social media links below this post that people are more than welcome to use to let me know what they think of a post. However, as my website deployments are essentially read-only, there's no way to store comments on the page below the post.

I might explore more options in the future for this, but for now, the current system works well enough.
### Storage

With the way I store my posts, which by now should be fairly understandable, every new post will slow down the page loads for the blog system a little. For now, it's really not a big issue as I don't have too many blog posts, but in years to come, I might want to change things up a bit so I can use pagination and similar features.

### Importing posts

For now, I'm quite happy with importing my posts before I deploy a new version of my website, but in the future, it would be nice to have some form of backend on my website that allows me to work on blog posts and schedule them. This would need a database for sure, though, and I don't feel like the pros outweigh the cons here.


## Wrapping Up

The whole purpose of this post was to outline how I handle blog posts for my website. I've had a few people ask in the past, so now, instead of having to explain it (poorly), I have somewhere I can point them.

As my website is constantly evolving, there may be a part 2 of this someday when I've got the time to come up with a new plan and rework everything. But for now, that is all!

Thanks for reading, as always!

