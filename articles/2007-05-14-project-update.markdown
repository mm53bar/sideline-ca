--- 
wordpress_id: 322
layout: post
title: Project update
disqus_url: http://blog.sideline.ca/2007/05/14/project-update/

<a href="http://www.amazon.com/Programming-Ruby-Pragmatic-Programmers-Second/dp/0974514055" title="Amazon.com: Programming Ruby: The Pragmatic Programmers' Guide, Second Edition: Books: Dave Thomas,Chad Fowler,Andy Hunt"><img src="http://ec1.images-amazon.com/images/I/413REDP4TQL._AA240_.jpg" align="left" vspace="10" hspace="10" border="0"></a>
<p>I posted last week about <a href="http://www.sideline.ca/2007/05/08/ccrb-on-my-rails-project/" title="sideline.ca  &raquo; CC.rb on my Rails project">my progress with test/spec</a> as I started work on a new project.  Since then, I've expanded my spec quite a bit.  I've really found BDD to be a lot of fun.  The cycle of thinking up a spec and then going through the <a href="http://www.jamesshore.com/Blog/Red-Green-Refactor.html" title="James Shore: Successful Software">red-green-refactor cycle</a> has really allowed me to bulk up my app without even firing up a web browser.  This is something that I always seemed to struggle with in TDD for one reason or another.</p>
<p>I just got word from my doctor today that I'm still 7 weeks or so from going back to work (my surgery is booked for this Thursday) so I'm hoping to have this little app up and running by the time I go back to work.  For the most part, it's not the coding that's slowing me down.  Instead, it's all of the research that I'm doing as I implement some of the niftier features in Rails and all of the plugins that are out there.  In fact, I'm having a hard time stopping myself from researching features that I won't be implementing right away.</p>
<p>Here's the short-list of features that I've either already learned or will be learning:</p>
<ul>
	<li><a href="http://behaviour-driven.org/" title="BehaviourDrivenDevelopment - Behaviour-Driven Development">BDD</a> using <a href="http://chneukirchen.org/blog/archive/2007/01/announcing-test-spec-0-3-a-bdd-interface-for-test-unit.html" title="chris blogs: Announcing test/spec 0.3, a BDD interface for Test::Unit">test/spec</a> or <a href="http://rspec.rubyforge.org/" title="RSpec Home">RSpec</a></li>
	<li><a href="http://openid.net/" title="OpenID: an actually distributed identity system">OpenID</a> authentication</li>
	<li>REST as a web API</li>
	<li>REST authentication</li>
	<li>handling different MIME types (i.e. iCal, JSON) within a respond_to block in Rails REST</li>
	<li>using <a href="http://cruisecontrolrb.thoughtworks.com/" title="CruiseControl.rb">CC.rb</a> for <a href="http://en.wikipedia.org/wiki/Continuous_integration" title="Continuous integration - Wikipedia, the free encyclopedia">continuous integration</a>
	<li><a href="http://www.juixe.com/techknow/index.php/2006/06/18/acts-as-commentable-plugin/" title="Juixe TechKnow &raquo; Acts As Commentable Plugin">acts_as_commentable</a> plugin</li>
	<li><a href="http://acts_as_voteable.richcollins.net/rdoc/">acts_as_voteable</a> plugin</li>
	<li>simple design for a <a href="http://www.pearsonified.com/2007/04/definitive-guide-to-semantic-markup.php" title="The Definitive Guide to Semantic Web Markup for Blogs &#8212; Pearsonified">CSS-driven XHTML site</a> that uses semantic markup</li>
	<li>how to use <a href="http://demo.script.aculo.us/" title="script.aculo.us - web 2.0 javascript demos">AJAX</a> where it <em>should</em> be used rather than where it <em>can</em> be used</li>
	<li>deployment to a remote host (<a href="http://www.dreamhost.com/r.cgi?263573">Dreamhost</a>) using <a href="http://capify.org/" title="Capistrano:  Home">Capistrano</a></li>
	<li>managing plugins using <a href="http://piston.rubyforge.org/usage.html" title="Piston ~ Easy Vendor Branch Management">Piston</a></li>
	<li>using <a href="http://seattlerb.rubyforge.org/heckle/" title="seattlerb's heckle-1.3.0 Documentation">Heckle</a> rather than a coverage analysis tool</li>
</ul>
<p>Right now, I'm knee deep in the second edition of <a href="http://www.amazon.com/Programming-Ruby-Pragmatic-Programmers-Second/dp/0974514055" title="Amazon.com: Programming Ruby: The Pragmatic Programmers' Guide, Second Edition: Books: Dave Thomas,Chad Fowler,Andy Hunt">Programming Ruby</a> and I've got to say that it's a fantastic book!  I've definitely been enjoying Ruby as I get more familiar with it but still get stumped on some of the syntax or the idioms.  This book is helping with that.  I'm now starting to think that the greatest feature of Ruby on Rails is the Ruby language itself.</p>
<p>Feel free to follow along with the progress of my project at <a href="http://svn.sideline.ca/piper">svn.sideline.ca/piper</a>.  For now, it's codenamed Piper in honour of <a href="http://www.vanislandbrewery.com/index.php?pageid=2" title="Vancouver Island Brewery - Products - Brewers of all natural premium ales and lagers - 2">Piper's Pale Ale</a> from Vancouver Island Brewery.</p>
