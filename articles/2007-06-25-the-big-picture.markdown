--- 
wordpress_id: 330
layout: post
title: The Big Picture
disqus_url: http://blog.sideline.ca/2007/06/25/the-big-picture/

<img src='http://www.sideline.ca/images/articles/planning.png' alt='Planning' / class="left">
<h3>Looking back</h3>
<p>Since the beginning of time (or at least 1997), I've been told that the proper way to build an application is from the bottom up.  Focus on your classes, your relationships, your business logic.  Get that working properly and well planned before you start working on your user interfaces.</p>

<p>The reasons for this advice seemed sound.  Your application could be exposed via many interfaces; web page, web service, mobile device, windows application, web api, etc.  Since there are so many options for viewing and using your application, you don't really want to customize your app based on the bias of one type of interface.</p>

<p>Another reason that I heard was a bit more malicious but very truthful.  The idea here was that your customer (or boss) didn't understand the complexities of software development.  That means that if you went out and canned a nice looking user interface, the perception might be that 90% of the work was done.  Of course, you know that you've still got to write the db scripts, create your classes, insert your business logic and wire it all together while avoiding a sky-high bug count.  But none of that matters to your customer (or boss) because the interface is done.  As far as they're concerned, the app must be almost finished and now it's up to you to manage that perception.  This is not a good place to be.</p>

<p>I've faithfully stuck by this advice through almost every single application that I've built or guided others in building.  But I'm starting to think that I might have taken this advice a little too liberally.</p>

<h3>What's the problem?</h3>

<p>In the past, I wouldn't just avoid building the user interface - I would avoid <em>thinking</em> about the user interface.  To me, the interface was just a distraction that would prevent me from thinking purely about the underlying logic and processes.  It would push me towards scope creep and inevitable end up in some level of feature bloat.  Ultimately, I viewed the user interface as something that could be added on at the end of the project, not unlike putting the lid on the garbage can.</p>

<p>But this approach didn't work.  On almost every project, I ended up having to change the underlying code so that I could implement the view.  I would find out that I had forgotten about some details in my business layer.  Worse yet, I would realize that I missed some attributes that needed to be stored in the database.</p>

<p>Not thinking about the user interface caused me to miss a very vital step in software development - planning.</p>

<p>This realization has been hard for me to come to.  I think that it's only because I've had this beaten into me by almost every good Rails blog that I read.  Even the <a href="http://www.37signals.com">37 Signals</a> book, <a href="http://gettingreal.37signals.com/">Getting Real</a>, tells me that I'm wrong <em><a href="http://gettingreal.37signals.com/ch01_What_is_Getting_Real.php">in the very first chapter</a></em>:</p>

<blockquote>
Getting Real starts with the interface, the real screens that people are going to use. It begins with what the customer actually experiences and builds backwards from there. This lets you get the interface right before you get the software wrong.
</blockquote>

<img src='http://www.sideline.ca/images/articles/mockup.png' alt='Mockup' class="right"/>

<h3>Looking forward</h3>

<p>In hindsight, I can see that the approach I was using was focussed on the computer, not the user.  It was designed to make coding easier by extracting away those nitpicky interface details.  I'm noticing that problem on my current project as I move into the user interface and notice that it's difficult to keep my tests passing as I run willy nilly through the models and controllers trying to adjust things so that I can have the views that I want.</p>

<p>For the next project that I work on, I want to try detailing the user interface.  I want mockups for the screens and plans for how the user will interact with the system.  I want to see how the public will interact with the system and what controls only need to be visible if a user is logged in.  I want to plan error messages and screens.  That sounds like a lot of planning, doesn't it?  I've done all of this before, but only in my head.  Time to get my head on paper.</p>

<p>Of course, I want to still agile with all of this so I'll try to keep it to a sane level of planning.  Have you had any experience trying to design a user interface at the beginning of a project?  If so, how did it work out?</p>
