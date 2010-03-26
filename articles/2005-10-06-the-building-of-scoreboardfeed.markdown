--- 
wordpress_id: 179
layout: post
title: The Building of ScoreboardFeed
wordpress_url: http://blog.sideline.ca/2005/10/06/the-building-of-scoreboardfeed/

Ever since I started working with portals, I've been trying to add
scoreboards to them.  Most of my portal work has had to do with
sports pools and having a scoreboard makes a sports pool portal that
much more useful.<br />
<br />
Usually, I would have to run a scrape &amp;amp; parse system to get the
scoreboard.  I would write some code to call the web page and get
its HTML content (i.e scrape).  Then I would run some sort of
algorithm to search through the page (i.e. parse) and get the data that
I needed for my scoreboard.  For the most part, these systems
worked quite well.<br />
<br />
Back when I was an ASP developer, I played around with <a href="http://www.fullxml.com/">FullXML</a>
quite a bit.  I didn't have a database, so FullXML's method of
using XML files as a database appealed to me.  On top of that,
there wasn't a lot of good portals that ran in ASP.  FullXML
really helped me to improve my XML, XSL and XPath skills.  I
actually managed to get a decent little portal up and running for a
pool of over 100 users.  Of course, using XML as your primary
database has some problems.  Scalability and extensibility were
lacking in the site.  Even worse was the capability for advanced
error handling.<br />
<br />
Then I found DotNetNuke.  Back when I was looking at FullXML, <a href="http://msdn.microsoft.com/library/default.asp'url=/library/en-us/dnbda/html/bdasampibsport.asp">IBuySpy</a>
had just come out as an ASP.Net Portal Starter Kit from
Microsoft.  I didn't know .Net and IBuySpy didn't look like it
would do what I wanted so I kept on with ASP.  During the time
that I was playing with FullXML, IBuySpy generated <a href="http://forums.asp.net/90/ShowForum.aspx">quite a little community</a>. 
Before long, IBuySpy had turned into an open source project called
IBuySpy Workshop.  IBuySpyWorkshop went through a couple of more
versions and was rebranded DotNetNuke.<br />
<br />
DotNetNuke has infinitely more opportunities to create a nice little
sports pool portal.  Scalability and extensibility are no longer a
problem.  ASP.Net has great support for advanced error
handling.  Even better, object-oriented techniques are now the
norm.  I was ready to build a better scoreboard.<br />
<br />
ESPN Scoreboard was one of my original modules for DotNetNuke. 
When I was poking around the ESPN site for scores, I noticed that they
used Flash for their scoreboard.  Thinking that I could just grab
the HTML tags for the Flash and insert it into my site, I started
looking at the source HTML for the ESPN web sites.  What I found
is that ESPN actually had Flash parameters that listed the URL of their
scoreboard datafiles.  Since I'm not a huge fan of flash except
for demos and games, I decided that I would scrape &amp;amp; parse these
data files for my scoreboard.  ESPN Scoreboard was born and had
support for NFL, NHL, NBA, MLB, College Football and College Basketball.<br />
<br />
ESPN Scoreboard worked pretty well and I eventually rebranded it
ScoreboardFeed when I rewrote it to work with DotNetNuke 3.  Of
course, almost as soon as ScoreboardFeed was released, ESPN decided
that they didn't like the Flash scoreboards anymore.  When they
got rid of the scoreboards, they also got rid of the data files. 
ScoreboardFeed was dead.<br />
<br />
I didn't think much of the problem until recently.  NFL was the
only scoreboard that still worked and I received numerous e-mails
asking me why the other sports didn't work.  I told folks that it
was akin to an act of god and I didn't have any other options for
them.  I felt bad about it but not too bad.  After all, it
wasn't my fault, was it'  Then something made me change my mind -
hockey came back.<br />
<br />
Since I'm a good Canadian kid and NHL was a sport that didn't have an
ESPN-supported data url, I thrust myself back onto the problem. 
After finding some <a href="http://xmlsports.sourceforge.net/">decent source code</a> (java-based but with lots of good ideas and good urls) along with a <a href="http://www.codeproject.com/aspnet/EncodedUrlBuilder.asp">good OO reference project</a>
(I'm still learning OO after all those ASP years), I dove into building
a new version of ScoreboardFeed.  I had some basic requirements
for this version of ScoreboardFeed based off the limitations that I had
seen in past versions:<br />
<ul>
  <li>it should be able to support different online datasources. 
If ESPN changed their format, then I shouldn't have to rewrite the
whole module in order to support the new way that ESPN formatting their
scoreboards.  For that matter, I should be able to support other
sites as well like TSN, CBS, Yahoo, etc.</li>
  <li>it should have real code that does the parsing and not soley rely
on regular expressions.  Regular expressions will probably still
form the basis for the parsing, but having a bit of code to make
decisions is sure useful!</li>
  <li>it should be able to be extended to support new sports as new
parsing routines are created.  It doesn't have to be
plug-and-play, but it should take too much to add a sport.</li>
  <li>it should be able to load web pages both from the internet and
from local files.  Local files are useful to avoid the lag that
occurs when a web page is dynamically retrieved from the internet.</li>
  <li>it should look the same as the old ScoreboardFeed.</li>
</ul>
That was it.  Not too bad, eh'<br />
<br />
I'll be having a series of posts on this topic.  I'll try to
describe how I built ScoreboardFeed.  I'll talk about some of the
new things that I've learned as I've created parsing routines with
regular expressions, classes for each sport, helper classes, custom
exception classes, and enums.  Hell, I've even managed to cram in
interfaces <i>and </i>abstract classes.  I'll even explain why I use an interface in one situation and an abstract class in another.<br />
<br />
Before I go too far though, I've got a word of caution for you: 
I'm not an OO expert.  I'm not even an OO intermediate.  But
I am a guy that can learn pretty quickly by following somebody else's
example.  The only problem with following an example is that you
might not know the whole story if the example didn't cover 100% of the
material.  That's where you come in as the loyal reader and
benevolent teacher.  I encourage you to comment on my
efforts.  ScoreboardFeed was a great experiment for me to try new
things and expand my knowledge.  Feedback will give me a better
context for that knowledge.<br />
<br />
Thanks for reading this far.  The next post will discuss how I
started to take those basic requirements and put code around them.<br />
<br />
--- 
wordpress_id: 179
layout: post
title: The Building of ScoreboardFeed
wordpress_url: http://blog.sideline.ca/2005/10/06/the-building-of-scoreboardfeed/

Ever since I started working with portals, I've been trying to add
scoreboards to them.  Most of my portal work has had to do with
sports pools and having a scoreboard makes a sports pool portal that
much more useful.<br />
<br />
Usually, I would have to run a scrape &amp;amp; parse system to get the
scoreboard.  I would write some code to call the web page and get
its HTML content (i.e scrape).  Then I would run some sort of
algorithm to search through the page (i.e. parse) and get the data that
I needed for my scoreboard.  For the most part, these systems
worked quite well.<br />
<br />
Back when I was an ASP developer, I played around with <a href="http://www.fullxml.com/">FullXML</a>
quite a bit.  I didn't have a database, so FullXML's method of
using XML files as a database appealed to me.  On top of that,
there wasn't a lot of good portals that ran in ASP.  FullXML
really helped me to improve my XML, XSL and XPath skills.  I
actually managed to get a decent little portal up and running for a
pool of over 100 users.  Of course, using XML as your primary
database has some problems.  Scalability and extensibility were
lacking in the site.  Even worse was the capability for advanced
error handling.<br />
<br />
Then I found DotNetNuke.  Back when I was looking at FullXML, <a href="http://msdn.microsoft.com/library/default.asp'url=/library/en-us/dnbda/html/bdasampibsport.asp">IBuySpy</a>
had just come out as an ASP.Net Portal Starter Kit from
Microsoft.  I didn't know .Net and IBuySpy didn't look like it
would do what I wanted so I kept on with ASP.  During the time
that I was playing with FullXML, IBuySpy generated <a href="http://forums.asp.net/90/ShowForum.aspx">quite a little community</a>. 
Before long, IBuySpy had turned into an open source project called
IBuySpy Workshop.  IBuySpyWorkshop went through a couple of more
versions and was rebranded DotNetNuke.<br />
<br />
DotNetNuke has infinitely more opportunities to create a nice little
sports pool portal.  Scalability and extensibility are no longer a
problem.  ASP.Net has great support for advanced error
handling.  Even better, object-oriented techniques are now the
norm.  I was ready to build a better scoreboard.<br />
<br />
ESPN Scoreboard was one of my original modules for DotNetNuke. 
When I was poking around the ESPN site for scores, I noticed that they
used Flash for their scoreboard.  Thinking that I could just grab
the HTML tags for the Flash and insert it into my site, I started
looking at the source HTML for the ESPN web sites.  What I found
is that ESPN actually had Flash parameters that listed the URL of their
scoreboard datafiles.  Since I'm not a huge fan of flash except
for demos and games, I decided that I would scrape &amp;amp; parse these
data files for my scoreboard.  ESPN Scoreboard was born and had
support for NFL, NHL, NBA, MLB, College Football and College Basketball.<br />
<br />
ESPN Scoreboard worked pretty well and I eventually rebranded it
ScoreboardFeed when I rewrote it to work with DotNetNuke 3.  Of
course, almost as soon as ScoreboardFeed was released, ESPN decided
that they didn't like the Flash scoreboards anymore.  When they
got rid of the scoreboards, they also got rid of the data files. 
ScoreboardFeed was dead.<br />
<br />
I didn't think much of the problem until recently.  NFL was the
only scoreboard that still worked and I received numerous e-mails
asking me why the other sports didn't work.  I told folks that it
was akin to an act of god and I didn't have any other options for
them.  I felt bad about it but not too bad.  After all, it
wasn't my fault, was it'  Then something made me change my mind -
hockey came back.<br />
<br />
Since I'm a good Canadian kid and NHL was a sport that didn't have an
ESPN-supported data url, I thrust myself back onto the problem. 
After finding some <a href="http://xmlsports.sourceforge.net/">decent source code</a> (java-based but with lots of good ideas and good urls) along with a <a href="http://www.codeproject.com/aspnet/EncodedUrlBuilder.asp">good OO reference project</a>
(I'm still learning OO after all those ASP years), I dove into building
a new version of ScoreboardFeed.  I had some basic requirements
for this version of ScoreboardFeed based off the limitations that I had
seen in past versions:<br />
<ul>
  <li>it should be able to support different online datasources. 
If ESPN changed their format, then I shouldn't have to rewrite the
whole module in order to support the new way that ESPN formatting their
scoreboards.  For that matter, I should be able to support other
sites as well like TSN, CBS, Yahoo, etc.</li>
  <li>it should have real code that does the parsing and not soley rely
on regular expressions.  Regular expressions will probably still
form the basis for the parsing, but having a bit of code to make
decisions is sure useful!</li>
  <li>it should be able to be extended to support new sports as new
parsing routines are created.  It doesn't have to be
plug-and-play, but it should take too much to add a sport.</li>
  <li>it should be able to load web pages both from the internet and
from local files.  Local files are useful to avoid the lag that
occurs when a web page is dynamically retrieved from the internet.</li>
  <li>it should look the same as the old ScoreboardFeed.</li>
</ul>
That was it.  Not too bad, eh'<br />
<br />
I'll be having a series of posts on this topic.  I'll try to
describe how I built ScoreboardFeed.  I'll talk about some of the
new things that I've learned as I've created parsing routines with
regular expressions, classes for each sport, helper classes, custom
exception classes, and enums.  Hell, I've even managed to cram in
interfaces <i>and </i>abstract classes.  I'll even explain why I use an interface in one situation and an abstract class in another.<br />
<br />
Before I go too far though, I've got a word of caution for you: 
I'm not an OO expert.  I'm not even an OO intermediate.  But
I am a guy that can learn pretty quickly by following somebody else's
example.  The only problem with following an example is that you
might not know the whole story if the example didn't cover 100% of the
material.  That's where you come in as the loyal reader and
benevolent teacher.  I encourage you to comment on my
efforts.  ScoreboardFeed was a great experiment for me to try new
things and expand my knowledge.  Feedback will give me a better
context for that knowledge.<br />
<br />
Thanks for reading this far.  The next post will discuss how I
started to take those basic requirements and put code around them.<br />
<br />
