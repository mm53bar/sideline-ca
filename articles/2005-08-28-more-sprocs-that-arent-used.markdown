--- 
wordpress_id: 177
layout: post
title: More sprocs that aren&#8217;t used
disqus_url: http://blog.sideline.ca/2005/08/28/more-sprocs-that-arent-used/

<p>I'm testing out the install file for Pick'Em v3 and finding some more stored procedures that I don't use.  Here's the list:</p>
<ul>
<li>PickEmPicksGet</li>
<li>PickEmUsersGet</li>
<li>PickEmUsersUpdate</li>
<li>PickEmWeeksUpdate</li></ul>
<p>I also discovered that my regex for creating sql install files was forgetting to put the 'CONSTRAINT' keyword back into DF, PK and FK statements.  Whoops.</p>
<p>Furthermore, I learned that when you're dropping a constraint, you can't use dbo. in front of the name of the constraint that you're dropping.  Weird.</p>
<p>Finally, I learned that databaseOwner and objectQualifier are case-sensitive.  Who knew'</p>
<p> </p>
