--- 
wordpress_id: 336
layout: post
title: Hiding the Spaghetti
wordpress_url: http://blog.sideline.ca/2007/07/10/hiding-the-spaghetti/

<img src='http://blog.sideline.ca/wp-content/uploads/2007/07/spaghetti_thumbnail.png' alt='spaghetti' class="center"/>
As <a href="http://svn.sideline.ca/piper">my sideline app</a> starts to get finished up, I've had to clean up a few of the rough spots.  One of those spots is authorization.

Because I built most of Piper before implementing any kind of authentication, I had anonymous Edit and Destroy links sprinkled all through the application.  At that time, it made sense to display those links so that I could make the site functional.  But once authentication was added, I need to make some decisions before showing those links.

Here's the rules that I ended up with:
<ol>
	<li>Anonymyous users should not be able to edit or destroy anything.</li>
	<li>Anonymous users should only be able to create scores, rankings and comments.</li>
	<li>Authenticated users should be able to create leagues, becoming the "owner" of that league.</li>
	<li>Owners should be able to add teams and games to their leagues.</li>
	<li>Owners should be able to edit their games or teams.</li>
	<li>Owners should be able to destroy their games, but not after scores have been added to them.</li>
	<li>Owners should be able to destroy their teams, but not after games have been added to them.</li>
</ol>
As you can see, all of the rules for non-anonymous users require the app to do some checking.  If the user is authenticated, show a "Create League" link.  If a user owns a league, sprinkle some "Edit" and "Destroy" links throughout the application to help with managing a league along with its games and teams.

This could be accomplished by inserting some conditions in the view.  For example, a quick <em>if</em> could decide whether to show the links:

[ruby]
<% if @league.owner == current_user %>
  <%= link_to 'Edit', edit_leagues_path(@league) %>
  <%= link_to 'Destroy', league_path(@league), :method => :destroy %>
<% end %>
[/ruby]

While this works, it's kind of ugly and messes up the view.  Why not take advantage of the support for helper blocks?

[ruby]
<% show_owner_links_for @league.owner do %>
  <%= link_to 'Edit', edit_leagues_path(@league) %>
  <%= link_to 'Destroy', league_path(@league), :method => :destroy %>
<% end %>
[/ruby]

And then in <em>application_helper.rb</em>:

[ruby]
def show_owner_links_for(owner)
  return unless logged_in?
  yield if owner == current_user
end
[/ruby]

Since this is just a simple example of using a helper block to clean up your view, it might not be apparent why it's a good thing.  But just imagine if the condition was more complicated or was a series of <em>else</em> or <em>elsif</em> statements.  It takes the ugliness out of your view and hides it in a helper.  And after coming from the template world of ASP and ASP.Net, I'm ecstatic to avoid <a href="http://en.wikipedia.org/wiki/Spaghetti_code">spaghetti code</a> as much as I can.

For more ways to clean up your views, check out <a href="http://railscasts.com/episodes/55">Railscast 55: Cleaning Up the View</a> and <a href="http://www.napcsweb.com/blog/2007/07/02/using-ruby-blocks-to-make-custom-helpers-in-rails/">Using Ruby Blocks to make custom helpers in Rails</a>.

P.S. If any of you looked at my list of rules and thought about BDD, you're spot on.  I'll post in the future about implementing some of these rules as extensions to <a href="http://blog.sideline.ca/2007/05/14/the-spec-so-far/">my existing BDD specs</a>.
--- 
wordpress_id: 336
layout: post
title: Hiding the Spaghetti
wordpress_url: http://blog.sideline.ca/2007/07/10/hiding-the-spaghetti/

<img src='http://blog.sideline.ca/wp-content/uploads/2007/07/spaghetti_thumbnail.png' alt='spaghetti' class="center"/>
As <a href="http://svn.sideline.ca/piper">my sideline app</a> starts to get finished up, I've had to clean up a few of the rough spots.  One of those spots is authorization.

Because I built most of Piper before implementing any kind of authentication, I had anonymous Edit and Destroy links sprinkled all through the application.  At that time, it made sense to display those links so that I could make the site functional.  But once authentication was added, I need to make some decisions before showing those links.

Here's the rules that I ended up with:
<ol>
	<li>Anonymyous users should not be able to edit or destroy anything.</li>
	<li>Anonymous users should only be able to create scores, rankings and comments.</li>
	<li>Authenticated users should be able to create leagues, becoming the "owner" of that league.</li>
	<li>Owners should be able to add teams and games to their leagues.</li>
	<li>Owners should be able to edit their games or teams.</li>
	<li>Owners should be able to destroy their games, but not after scores have been added to them.</li>
	<li>Owners should be able to destroy their teams, but not after games have been added to them.</li>
</ol>
As you can see, all of the rules for non-anonymous users require the app to do some checking.  If the user is authenticated, show a "Create League" link.  If a user owns a league, sprinkle some "Edit" and "Destroy" links throughout the application to help with managing a league along with its games and teams.

This could be accomplished by inserting some conditions in the view.  For example, a quick <em>if</em> could decide whether to show the links:

[ruby]
<% if @league.owner == current_user %>
  <%= link_to 'Edit', edit_leagues_path(@league) %>
  <%= link_to 'Destroy', league_path(@league), :method => :destroy %>
<% end %>
[/ruby]

While this works, it's kind of ugly and messes up the view.  Why not take advantage of the support for helper blocks?

[ruby]
<% show_owner_links_for @league.owner do %>
  <%= link_to 'Edit', edit_leagues_path(@league) %>
  <%= link_to 'Destroy', league_path(@league), :method => :destroy %>
<% end %>
[/ruby]

And then in <em>application_helper.rb</em>:

[ruby]
def show_owner_links_for(owner)
  return unless logged_in?
  yield if owner == current_user
end
[/ruby]

Since this is just a simple example of using a helper block to clean up your view, it might not be apparent why it's a good thing.  But just imagine if the condition was more complicated or was a series of <em>else</em> or <em>elsif</em> statements.  It takes the ugliness out of your view and hides it in a helper.  And after coming from the template world of ASP and ASP.Net, I'm ecstatic to avoid <a href="http://en.wikipedia.org/wiki/Spaghetti_code">spaghetti code</a> as much as I can.

For more ways to clean up your views, check out <a href="http://railscasts.com/episodes/55">Railscast 55: Cleaning Up the View</a> and <a href="http://www.napcsweb.com/blog/2007/07/02/using-ruby-blocks-to-make-custom-helpers-in-rails/">Using Ruby Blocks to make custom helpers in Rails</a>.

P.S. If any of you looked at my list of rules and thought about BDD, you're spot on.  I'll post in the future about implementing some of these rules as extensions to <a href="http://blog.sideline.ca/2007/05/14/the-spec-so-far/">my existing BDD specs</a>.
