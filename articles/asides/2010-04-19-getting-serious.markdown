title: Getting Serious

Up until recently, I hosted [sideline.ca](http://sideline.ca) on Dreamhost using Wordpress.  While Wordpress has been good, I've been feeling the need to use a simpler solution.  Throw in my desire to move my hosting to something more Rails-friendly and it became obvious that I needed to leave Wordpress.

While Dreamhost has been cheap (less than $10/month), I wanted to do better in terms of cost.  Something closer to...free.  Amazingly, I had a number of options:

* [GitHub Pages](http://github.com/blog/272-github-pages) - I like the simplicity of maintaining my pages in a git repository as markdown files.  But you need to be a premium member in order to point your domain at your pages.  In addition, I'll be moving another Wordpress instance off of Dreamhost so it would start to get clunky to maintain two different domains here.
* [Codaset Pages](http://pages.codaset.com/) - Looks to be the same idea as Github Pages.  Again, I would need to create a second user to maintain a different blog.
* [Google Sites](http://sites.google.com) - I've got a couple of domains using Google Apps so I could always use Google Sites.  It solves the problem of needing multiple domains but I'm not a fan of having to hardcode a blog as static HTML.
* [Heroku](http://www.heroku.com) - Free hosting for ruby-based apps with the ability to point my domain for free.  Sounds like a winner!

With the platform decision made, I had a large choice of blog applications.  I didn't want anything too heavy but still found a number of options:

* [Jekyll](http://github.com/mojombo/jekyll) - Used for both GitHub Pages and Codaset Pages, Jekyll generates static HTML from a number of files that are combinations of YAML and Markdown.  While generating static HTML means that you can post the files pretty much anywhere, I wanted to stick with an app that served out the content.
* [Toto](http://github.com/cloudhead/toto) - Toto also uses a YAML/Markdown mix in its articles.  It's wired up to use git and Heroku extensively, which means that deploying a new article is as simple as `git push`.  But after using it for a bit, I ran into some issues trying to break my layout files out into smaller subfiles (i.e. something like rails partials).
* [Serious](http://github.com/colszowka/serious) - Serious is "inspired by toto and driven by sinatra".  Again, it used YAML/Markdown for articles but replaced toto's custom framework with [sinatra](http://www.sinatrarb.com/).  After a bit of playing, I decided to go with Serious.

The key for me with Jekyll, Toto and Serious is that they all forgo storing articles in a database.  Instead, they store articles as markdown files in the filesystem.  This change alone makes for a fast site.  Add in the caching of Heroku and you get a site that absolutely flies.  

The only difficulty with losing a database is that you have nowhere to store comments.  Enter Disqus - a 3rd party service that not only will collect and display your comments but will also filter spam and collect references to your posts on Twitter.

I made the decision to go with Serious and Heroku a couple of weeks ago.  After extracting my articles out of Wordpress on Dreamhost, I had to spend quite a bit of time going through and cleaning up some of the links and URL's.  In addition, any images that I had used in Wordpress had to be re-referenced.  But I finally launched my site last week and couldn't be happier!  The workflow of using Markdown and git for writing articles is really intuitive.  In addition, Heroku has been a fantastic free host for the site.

If you're interested in seeing any of the code behind the site, or the articles themselves, I host it all on my Github account at [http://github.com/mm53bar/sideline-ca](http://github.com/mm53bar/sideline-ca).  I've made a few changes to the Serious gem which you can find in the vendor directory.