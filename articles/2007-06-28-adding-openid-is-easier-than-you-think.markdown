--- 
wordpress_id: 334
layout: post
title: Adding OpenID is easier than you think
wordpress_url: http://blog.sideline.ca/2007/06/28/adding-openid-is-easier-than-you-think/

<img src='http://blog.sideline.ca/wp-content/uploads/2007/06/keys_thumbnail.png' alt='keys' class='center'/>

<p>I just got finished adding <a href="http://blog.sideline.ca/2007/05/10/is-63-million-enough/">OpenID</a> to my <a href="http://svn.sideline.ca/piper/" title="Revision 50: /">sideline application</a>.  Truth be told, I'd been putting this off for a month or so because I figured that it would be a real pain.  But after a couple of hours I was pretty much complete and at the point where I started to goldplate.</p>

<p>The first step was to install the <a href="http://identity.eastmedia.com/identity/show/Restful+OpenID+Authentication" title="Restful Open ID Authentication in Identity">RESTful OpenID Authentication plugin</a>.  For <a href="http://piston.rubyforge.org/index.html" title="Piston ~ Easy Vendor Branch Management">Piston</a> users, that's as simple as typing the following:</p>

[code]piston import http://svn.eastmedia.com/svn/bantay/plugins/trunk/restful_open_id_authentication vendor/plugins/restful_open_id_authentication[/code]

<p>For non-Piston folks (<a href="http://gwyn.dezyne.net/page/piston" title="Gwyn Morfey on Rails: Piston">why aren't you using Piston?</a>), just install the plugin like normal:</p>

[code]./script/plugin install http://svn.eastmedia.com/svn/bantay/plugins/trunk/restful_open_id_authentication[/code]

<p>Once you've got that installed, all you need to do is run the generator and add a few routes to your routes.rb.  Give the <a href="http://svn.eastmedia.com/svn/bantay/plugins/trunk/restful_open_id_authentication/README" title="">README</a> a quick glance to get the detail for these steps.</p>

<p>One of the first things that I noticed about the generated code is that it's definitely designed for a site that uses its own authentication system in addition to OpenID.  Since all I want to do is use OpenID, I started getting rid of all the extra code.</p>

<p>That's when I remembered the <em>RESTful</em> part of the plugin's name and wondered "how do they do an authentication when the app's API is called via XML?".  That is, what happens if there isn't a nice login screen that will redirect to an OpenID provider and supply me with a lightweight authentication?  The answer, of course, is obvious:  I have to roll my own authentication.  That means that all the code that I just removed will be needed again if I want to authenticate non-HTML requests.</p>

<p>While I don't like the idea of a dual-authentication system, it seems pretty common out there.  For example, Google authenticates your requests with an API key even though you already have a username and password with them.  I suppose that what I'll end up doing is have existing users register for a username/password if they want API access.  That means that most users will only ever need the OpenID authentication and the username/password will be reserved strictly for the API.</p>

<p>If you haven't tried OpenID (or <a href="https://www.myopenid.com/">created your own account</a>), I highly recommend that you do it.  And I'm not alone - 37 Signals just put up <a href="http://37signals.com/openid/" title="OpenID: Why, how, benefits, 37signals">a special page</a> to explain why OpenID is a good thing.  Check it out!</p>

<p>I'll post some follow-up info on the goldplating that I did to customize the forms and take advantage of something called the <a href="http://www.openidenabled.com/openid/simple-registration-extension" title="Simple Registration Extension">Simple Registration Extension</a>.</p>

