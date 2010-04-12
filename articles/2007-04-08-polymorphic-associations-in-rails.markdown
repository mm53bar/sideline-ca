--- 
wordpress_id: 300
layout: post
title: Polymorphic associations in Rails
disqus_url: http://blog.sideline.ca/2007/04/08/polymorphic-associations-in-rails/

<p>Lately I've been playing with a few of the "acts_as_..." plugins that are available for Rails.  Specifically, <a href="http://agilewebdevelopment.com/plugins/acts_as_rateable">acts_as_rateable</a>, <a href="http://agilewebdevelopment.com/plugins/acts_as_taggable_on_steroids">acts_as_taggable</a> and <a href="http://agilewebdevelopment.com/plugins/acts_as_commentable">acts_as_commentable</a>.</p>
<p>All of these share one major feature in common - they take advantage of the ability for Rails to support polymorphic associations.  Expressed a different way, they all support has_many :whatevers.</p>
<p>To quote the <a href="http://wiki.rubyonrails.org/rails/pages/UnderstandingPolymorphicAssociations">Rails wiki</a>:</p>
<blockquote>
Polymorphic associations are promiscuous associations—that is, they are unrestricted in terms of what other classes the association can be with.

Polymorphic associations allow for associations from one model to other model classes(note the plural).
</blockquote>
<p>The wiki has some good articles that will help you to understand polymorphic associations and when you should use them.  While they introduce a lot of flexibility, they could also have some performance problems in larger sites.</p>
<p>This is just one more reason why I'm impressed with this framework.  <a href="http://www.rubyinside.com/16-rjs-resources-and-tutorials-for-rails-programmers-5.html">What will they think of next</a>?</p>
