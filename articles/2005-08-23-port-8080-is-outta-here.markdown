--- 
wordpress_id: 175
layout: post
title: Port 8080 is outta here&#8230;
wordpress_url: http://blog.sideline.ca/2005/08/23/port-8080-is-outta-here/

Now that I've moved to WebHost4Life, I needed to update a lot of my
posts to remove the :8080 reference in the URL's. After a bit of
digging in Google, I found some tidbits that eventually led me to run
this in my Community Server db:
update cs_posts set
body=replace(substring(body,1,datalength(body)),':8080',''),
formattedbody=replace(substring(formattedbody,1,datalength(formattedbody)),':8080','')
where body like '%:8080%' Looks easy enough, eh' <br />
<br />
A simple replace statement wouldn't work because the body and
formattedbody columns are both ntext. For some reason, doing a
substring on the column and then running replace worked fine. I've got
a sneaking suspicion that the substring probably truncated my columns
before running the replace, but I'll deal with that problem when it
arises. That's what backups are for, right'
