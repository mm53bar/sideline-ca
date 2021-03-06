--- 
wordpress_id: 299
layout: post
title: In Search of REST
disqus_url: http://blog.sideline.ca/2007/04/04/in-search-of-rest/

Since the Ruby on Rails world is all gaga over REST right now, I figured that I'd jump on that wagon.  I've often prided myself on being part of the latest fads no matter how silly they are.  :)

As a developer that has worked in the MS world for a long time, I'm far more familiar with SOAP than I am with REST.  For the most part, I've kind of seen REST as a lesser form of SOAP.  But that couldn't be farther from the truth.

In the same way that RoR is a better fit than ASP.Net for most web application development, REST is a better fit than SOAP for most web API development.  Of course, these are my own opinions and are certainly open to criticism.  Feel free to leave a comment if you disagree.

The hardest thing with REST is to change the way your mind has been taught to think with SOAP.  It's not just a matter of writing code to expose your business objects as services.  REST isn't really an afterthought that you add on to an existing application.  It's a way to rethink the way you approach your entire application.  For more on this, check out the following links:
<ul>
	<li><a href="http://softiesonrails.com/2007/3/28/rest-101-part-1-understanding-resources">REST 101: Part 1 - Understanding Resources</a></li>
	<li><a href="http://softiesonrails.com/2007/4/3/rest-101-part-2-a-million-apis">REST 101: Part 2 - A Million APIs</a></li>
	<li><a href="http://ariejan.net/2007/03/21/build-an-app-with-ruby-on-rails-resources/">Build an app with Ruby on Rails resources</a></li>
	<li><a href="http://www.loudthinking.com/arc/000593.html">Discovering a world of resources</a></li>
</ul>
These articles will talk about the beauty of CRUD and how well it maps over to the HTTP verbs of GET, POST, PUT and DELETE.  Beautiful stuff.

But I don't think that I truly got it until I read the following quote from "<a href="http://jroller.com/page/richardsearle?entry=how_not_to_represent_a">A false REST understanding</a>" that talks about a REST-enabled web application that has a shopping cart for buying books:
<blockquote>The book entry in the cart then has its own URL, that can be used to delete it or modify the quantity.</blockquote>
Pretty simple quote, eh?  Not exactly earth shattering, is it?

But that idea was enough to make things start to sink into my head.  REST is not about exposing methods over the web, which was the default way that I looked at it after being exposed to SOAP.  It's about exposing a URL for every resource so that you can perform CRUD actions on those resources.  That's why it's important that you normalize your application in the same way that you normalize your database tables.

If that just seems like a bunch of crap, then consider it this way.  You know all of <a href="http://codebetter.com/blogs/jeremy.miller/articles/129542.aspx">those OOP articles</a> that talk about how <a href="http://en.wikipedia.org/wiki/Separation_of_concerns">separation of concerns</a> is a great thing?  Think about what normalization is in a database.  It's the same thing.

It's all starting to make sense now.

<hr />P.S. One last link - you've just got to watch the <a href="http://www.scribemedia.org/2006/07/09/dhh/">David Heinemeier Hansson screencast from RailsConf 2006</a> where he introduces REST support in Rails.  Be sure to follow along with <a href="http://www.loudthinking.com/lt-files/worldofresources.pdf">his slides</a> while you watch the presentation.
