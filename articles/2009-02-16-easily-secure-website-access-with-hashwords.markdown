--- 
wordpress_id: 378
layout: post
title: Easily secure website access with Hashwords
wordpress_url: http://www.sideline.ca/2009/02/16/easily-secure-website-access-with-hashwords/

<p class="center caption"><img title="key" src="http://www.sideline.ca/images/articles/key.jpg" alt="key" width="500" height="375" /><span>Photo by <a href="http://flickr.com/photos/rattodisabina/2460905893/">Mirko Macari</a></span></p>

I love web apps.  Really...I love them.  While the idea of <a title="Cloud computing - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/Cloud_computing">computing in the cloud</a> scares some people, it fits my needs perfectly.  I'll sign up for a web app on the off chance that it might suit my needs.  While it's easy for me to walk away from these apps if I find something better, there's one thing that I can't walk away from - the password that I used as part of the signup process.
<!--more-->
<h3>Bad passwords are common</h3>
It's no secret that <a title="SitePoint » Passwords: Most People Do It Wrong" href="http://www.sitepoint.com/blogs/2009/02/11/passwords-most-people-do-it-wrong/">lots of people choose bad passwords</a>.  I usually shake my head at those folks and pat myself on the back for using a <a title="Password checker" href="http://www.microsoft.com/protect/yourself/password/checker.mspx">moderately strong password</a>.  Although my password doesn't use mixed case letters or special characters, it does contain both letters and numbers and has 8 characters.  While it's not unhackable, it's stronger than most passwords being used out there.  However, it suffers from a severely fatal flaw - it's the only password that I use.

Of course, I'm not alone - <a title="Survey: Most computer users repeat passwords - Security- msnbc.com" href="http://www.msnbc.msn.com/id/24162478">most computer users repeat passwords</a>.  It's just too much of a pain to remember hundreds of passwords and I'm not interested in writing them down.  Software solutions that store my passwords don't really work either because I can only use them on my home machine.

So that got me thinking - if I have a decent password but my problem is that I repeat it, how can I be more secure?  That led me to create Hashwords.
<h3>What is Hashwords?</h3>
Hashwords is a simple website that will take a master password, a website URL and create a strong password that is unique to you and the website.  You don't even have to remember the password because you can regenerate it at any time.

<img class="center frame" title="hashwords_main" src="http://www.sideline.ca/images/articles/hashwords_main.jpg" alt="Hashwords Main Screen" width="397" height="184" />

Here's how it works.  Visit <a title="Hashwords - Hash Passwords that anybody can create." href="http://hashwords.sideline.ca/">hashwords.sideline.ca</a>.  Choose a password that you're going to use as your master password and type it in.  Then, type in the domain of the site you need a password for.  Keep the domain information simple here - type in <em>google.com</em> instead of <em>http://www.google.com/accounts</em>.  As you type in the URL, you'll see your password being generated.  When you're finished entering your master password and the URL of the site you're visiting, simply copy your new Hashword to be used.  That's it.
<h3>The power of a Bookmarklet</h3>
It can be a bit clunky to open a new browser window or tab just to create a Hashword.  The Hashword bookmarklet makes this process much easier.

<img class="center frame" title="hashwords_bookmarklet" src="http://www.sideline.ca/images/articles/hashwords_bookmarklet.jpg" alt="Hashwords Bookmarklet Screen" width="397" height="169" />

Go to <a title="Hashwords - Hash Passwords that anybody can create." href="http://hashwords.sideline.ca/">hashwords.sideline.ca</a>, click on the Bookmarklet tab and follow the directions to drag the bookmarklet into your browser.  Now you can access Hashwords from any site you want by clicking on the bookmarklet that you created.  To make it even easier, the bookmarklet will automatically fill in the URL for the website that you're currently viewing.  Visit the <a title="Bookmarklet - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/Bookmarklet">bookmarklets page on Wikipedia</a> for more information on how to use bookmarklets.
<h3>How does it work?</h3>
Warning - if your eyes start to roll into the back of your head when people speak geek around you, just skip to the next section.

<img class="center frame" title="hashwords_settings" src="http://www.sideline.ca/images/articles/hashwords_settings.jpg" alt="Hashwords Settings Screen" width="396" height="206" />Hashwords takes your master password and the URL that you've supplied and combines them.  It thens run one of three encryption algorithms (<a title="SHA hash functions - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/SHA">SHA1</a>, <a title="MD5 - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/MD5">MD5</a> or <a title="MD4 - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/MD4">MD4</a>) on this combined text to create an encrypted piece of text.  This encrypted text is usually represented as <a title="Hexadecimal - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/Hexadecimal">hexadecimal</a>.  That means that it is made up of the letters A-F and the number 0-9.  Since strong passwords usually consist of both uppercase and lowercase letters along with special characters, a further encryption is done on the text using <a title="Base64 - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/Base64">Base64</a>.  Base64 is typically an insecure way to encrypt text but in this case it is simply being used to convert the encrypted text into a format that is even more secure.  Finally, the encrypted text is chopped to a user-defined length of either 8, 12 or 16 characters.

Seems simple enough, eh?  The beauty of this approach is that it is recreatable and virtually uncrackable.

But the security doesn't end there.  Hashwords is implemented completely in Javascript using the <a href="http://jquery.com/">JQuery framework</a>.  That means that there is no data sent back to a server so there is no way that your passwords can be compromised.  Furthermore, these passwords aren't stored anywhere (because you can regenerate them whenever you need to) so there is no central list of passwords that can be hacked.
<h3>How do I try Hashwords?</h3>
Go to the <a title="Hashwords - Hash Passwords that anybody can create." href="http://hashwords.sideline.ca/">Hashwords website</a> and drag the bookmarklet into your browser.  Then simply go to a website where you need a password.  When you're on the login page of the website, just click on the Hash It! bookmarklet to launch Hashwords.  Type in your master password and get your new Hashword.  If you want to change the default settings, click on the Settings tab to choose the encryption algorithm, the length of your password and the characters to use in generating your Hashword.

After using Hashwords for a few months, I found some pain points in the workflow.  Changing my settings from the defaults every time I generated a Hashword was annoying.  Even worse was having to type in my master password every single time.  To solve these issues, I turned to browser cookies.  All of the settings are stored in a cookie in your browser for 7 days.  Your master password is stored in a cookie in your browser until you close your browser.  That means that you can use Hashwords conveniently on a public computer without any security concerns as long as you close your browser when you're done.
<h3>Final words</h3>
Let me know how you like Hashwords.  It's a pretty simple little application but has made my online browsing much more secure without having to be tied to a single application that I install on my home computer.  I love it and I hope you do too!
