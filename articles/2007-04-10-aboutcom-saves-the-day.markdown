--- 
wordpress_id: 305
layout: post
title: About.com saves the day!
wordpress_url: http://blog.sideline.ca/2007/04/10/aboutcom-saves-the-day/

Who knew that about.com could be useful?  I've recently been working with Rails on Oracle 8i and ran across a problem when I updated my client to support a 10g database.  The error was:
<blockquote> ORA-12705: Cannot access NLS data files or invalid environment specified</blockquote>
I found the solution at <a href="http://ruby.about.com/od/enterprise/ss/ruby_oracle_4.htm">ruby.about.com</a>:
<blockquote>Another common problem is interference with a current or prior Oracle client install. The error "ORA-12705: Cannot access NLS data files or invalid environment specified" usually occurs because of an incorrect NLS_LANG setting.

Unix users can just unset NLS_LANG but Windows users will need to modify their registry using regedt32 and remove the NLS_LANG key in the following location.
<blockquote>\HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\</blockquote>
</blockquote>
Everything worked just fine as soon as I went into regedit and deleted the NLS_LANG key.  Hooray!
