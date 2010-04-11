--- 
wordpress_id: 116
layout: post
title: Daylight Saving Time and Sports Schedules
wordpress_url: http://www.sideline.ca/2005/03/16/daylight-saving-time-and-sports-schedules/

<p>Man, I'm just stumped.  According to the lovely internet, <a href="http://canada.worldweb.com/TravelEssentials/TimeZones/8-188.html">Daylight Saving Time happens during the summer</a>, from April 3, 2005 to October 30, 2005.  During that time, Alberta goes from <a href="http://canada.worldweb.com/TravelEssentials/TimeZones/8-187.html">Mountain Standard Time</a> (MST) to <a href="http://canada.worldweb.com/TravelEssentials/TimeZones/8-188.html">Mountain Daylight Time</a> (MDT).  MST is 7 hours from Greenwich Time while MDT is 6 hours off.</p>
<p>So, when you look at something like the <a href="http://www.cfl.ca/CFLSchedules05/home.html">CFL Schedule</a>, what the hell is ET'!  Eastern Time'  How do I translate that into something for the <a href="http://aream.ca/Default.aspx'tabid=56">Pick'Em module</a> that gets distributed around the world and has to calculate the proper time according to UTC offsets'</p>
<p>Here's what I think I do.  The first preseason game is on June 7th.  That's definitely within the timespan of Daylight Saving Time.  I will set that game and every other game up until October 30 to use Daylight Saving Time.  If I move over 2 hours to the east from Mountain Daylight Time, I get Eastern Daylight Time which has a UTC offset of -040000.  For every game from November 4th to the end of the season on November 27th, I use EST's offset of -050000.</p>
<p>Does this make sense or am I making something simple into something complicated'</p>
