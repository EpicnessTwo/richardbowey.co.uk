---
title: 'Link Shorteners, File Uploaders, and my goal to make a single system to do both!'
summary: 'Unifying Link Shortening and File Uploading: Streamlined, User-Friendly, and Open Source!'
date: '2023-05-13'
---

## Introduction

In my continuous endeavor to develop customized systems for both myself and the Land of Kittens community, I've set my sights on revamping our link shortener. We've relied on an outdated version of Yourls for quite some time, but recently we've encountered sluggish performance and usability challenges.

Recognizing the need for an upgrade, I'm determined to create a new and improved link shortening solution. The goal is to enhance the speed, usability, and overall experience for both myself and the community members. By developing a bespoke system tailored to our specific needs, we can overcome the limitations of the outdated Yourls version and create a more efficient and user-friendly link shortener.

## What to use?

With Laravel 10 being a relatively new framework, I've decided to utilize it for this new project. The great thing about Laravel is that it comes with a variety of built-in features, including native libraries for common functionalities like authentication through Laravel Fortify. This means I can save time and effort by leveraging these pre-existing components and focus more on developing the custom aspects of the system, rather than spending all my time on user login implementation.

For the front end, I've chosen to work with the tried and tested Tailwind CSS. I have extensive experience using it, and there's a wide range of high-quality templates available. By utilizing Tailwind CSS, I can benefit from its comprehensive styling capabilities and avoid reinventing the wheel. This allows me to build an efficient and visually appealing user interface without starting from scratch.

By adopting Laravel 10 and incorporating Tailwind CSS into the project, I can take advantage of their respective strengths. Laravel provides a robust framework with native libraries, while Tailwind CSS offers a powerful styling toolset. With these technologies in place, I can focus on writing code and crafting a unique and feature-rich link shortener.

## Where to start?

When starting a new Laravel project, it's essential to begin with the database design. By focusing on the Migrations and Models, you can plan how the data will be stored, which then guides the development of the Controllers. In this particular project, I've prioritized two main tables: "Links" and "Hits."

The "Links" table serves as the storage for all the links that need to be shortened. It will store relevant information such as the original link, the shortened slug (the unique code representing the shortened URL), and other relevant details.

On the other hand, the "Hits" table captures basic metrics for every visit to a shortened link. This table allows us to track and analyze the frequency and usage of the shortened URLs.

Database design encompasses more than just defining the structure of the tables. With Laravel, you can also leverage the power of Factories and Seeders. Factories are particularly useful for generating test data by specifying fake values for each field in the database. Meanwhile, Seeders allow you to define how the data should be populated, including specifying the number of entries and associating them with a particular user.

For example, I can utilize a Factory to generate links and slugs for the URLs, and then use a seeder to determine the quantity of these entries and the user responsible for generating each link.

By incorporating this approach, you not only establish a well-designed database structure but also set the foundation for generating test data that will be valuable in the future, especially when developing the user interface.

Taking the time to plan and create the database design, along with utilizing Laravel's Factories and Seeders, ensures a solid foundation for the project and streamlines the development process.

## The interface

To achieve a clean and user-friendly user interface, I scoured TailwindUI for suitable templates that would serve as a starting point. After conducting a few searches, I found several excellent templates that caught my attention. Leveraging these templates, I can ensure a visually appealing and modern design for the user interface.

In Laravel, my approach to creating the user interface involves breaking the page into multiple sections. Firstly, there's the overarching page template that serves as a foundation for all pages. This template includes elements such as the layout, menu, header, and other components that may be required across multiple pages, such as CSS and JavaScript includes. This ensures consistency and allows for easy management of shared resources.

Once the general page template is in place, I can proceed to develop specific sections for each page. If a particular section is used in multiple areas of the system, I adopt a more generic approach and set it up as a reusable section template. This way, if I ever want to modify the appearance of that section in the future, it can be done effortlessly without impacting other parts of the system. This modular approach provides flexibility and enables easy customization as needed.

By following this methodology, I can create an organized and maintainable user interface for the project. Utilizing the selected templates as a starting point, combined with Laravel's flexible templating system, allows for efficient development while ensuring the UI remains clean and adaptable.

## The logic

At its core, a link shortener operates on a simple principle. When a user clicks on a shortened link, it registers as a "hit," allowing us to track the number of times the link has been visited. Subsequently, the user is redirected to the original, longer link. Understanding this fundamental functionality makes implementing it in code straightforward.

Moving forward, presenting metrics for the links is also relatively simple. With every hit, we store the corresponding date and time, enabling us to group and aggregate this data based on various timescales such as hours, days, or months. By leveraging this data, we can generate graphs and metric counters that display relevant statistics. This approach results in a clean and intuitive interface, with the logic seamlessly populating the desired data.

By embracing this streamlined logic and implementing it effectively, we can develop a link shortener system that performs its core functions efficiently and presents valuable metrics to users in a visually appealing manner.

## What about uploading files?

Once I had completed the initial concept of the link shortener, I found myself inspired to take the idea further and create another project—a file uploader. Having used ShareX for many years, I appreciated the convenience of automatically uploading screenshots to a service and receiving a link instead of the actual image. This made sharing images across various platforms, such as games or contact forms, much easier. ShareX also supported file uploads, which I wanted to leverage.

However, I realized that running two separate systems with similar functionalities seemed redundant. Instead, I decided to combine the features of both projects into a single system, allowing me to utilize just one domain name.

Considering the potential storage requirements for years' worth of files and screenshots, I opted for utilizing S3 storage. I was already familiar with Wasabi's S3 storage and, conveniently, Laravel had native support for it.

Following a similar approach to the link shortener project, I began by designing the database structure, followed by developing the necessary controllers and, ultimately, creating the user interface. Since the file uploader served a similar purpose as the link shortener—providing a link to access an image or file—I could leverage a significant portion of the existing code.

For the uploader, I referenced ShareX's documentation on implementing a custom uploader. Here's the flow: I capture a screenshot, which is then sent as part of a web request to the system. The system uploads the image to S3, stores a record of it in the database, and generates a unique link to associate with the uploaded file. Subsequently, the system responds to the request by providing the link, which is now readily available on my clipboard for immediate use.

By following this approach, I not only streamlined the development process by reusing code but also integrated the convenience of ShareX's uploader functionality into the unified system.

## Conclusion and Future Ideas.

With a fully functional link shortener and file uploader system in place, I've been actively using it in my day-to-day interactions. If you're someone I frequently communicate with, chances are you've already witnessed the convenience of this system when sharing images and files.

While the system is operational, I consider it a work in progress. I have a few additional ideas and improvements that will make it even more user-friendly and versatile.

1. Datatables: Currently, data is presented in stylish tables on the page. However, for long-term smooth operation, I plan to reimplement these tables using Laravel Datatables. This will enable pagination and efficient search capabilities, making it easier to navigate and locate specific entries.

2. Public Access to Metrics: In the spirit of transparency, I plan to introduce a feature that allows public access to anonymous metrics about the hits on the shortened links. Users will be able to view aggregated data such as the number of visits, popular links, and other relevant statistics. This will provide insights into the overall usage of the system without compromising individual privacy or revealing specific user information.

3. Code Block Support: While the system already allows the upload of code files, retrieving them only provides the file itself. I aim to implement a feature that displays the code on the page, formatted with the appropriate syntax highlighting. This will greatly enhance the readability and usability of code-related uploads.

4. Open Source: As someone who has greatly benefited from open source software, I aspire to contribute back to the community by making this quirky little system open source. However, before releasing it to the public, there's still significant work to be done. I need to clean up the codebase and ensure it meets the necessary standards for sharing and collaboration.

By incorporating these enhancements and embracing the open source ethos, I hope to make this system more robust, user-friendly, and accessible to a broader community of users and developers.

Thank you for taking the time to read through this extensive blog post. I appreciate your attention and hope that the information provided was valuable and engaging. If you have any further questions or need assistance with any other topic, please don't hesitate to reach out using one of the links in the website footer!

