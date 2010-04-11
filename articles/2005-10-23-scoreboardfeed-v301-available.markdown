--- 
wordpress_id: 183
layout: post
title: ScoreboardFeed v3.01 available
wordpress_url: http://www.sideline.ca/2005/10/23/scoreboardfeed-v301-available/

<p>I've made <a href="http://www.aream.ca/DNN/ScoreboardFeed/tabid/57/Default.aspx">ScoreboardFeed v3.01 available on my site</a>.  You don't need to register for this download.</p>
<p>I've made a number of changes to this version of ScoreboardFeed which will be detailed in my blog.  The short list of changes is:</p>
<ul>
<li>added scoreboard support for most of the internation soccer games found at <a href="http://soccernet.espn.go.com/">ESPN SoccerNet</a>.</li>
<li>added scoreboard support the Canadian Football League.</li>
<li>fixed text parsing bugs that occurred with some games that were marked as 'Postponed' or 'Delayed' due to hurricane activity.</li>
<li>moved all of the scoreboards into their own assembly.</li>
<li>added support to dynamically discover scoreboards to enhance scalability.  This will eventually evolve into a plug-in model for scoreboards.</li>
<li>reorganized the namespace</li>
<li>began to add unit testing</li></ul>
<p>That's about it.  Separating out the scoreboards was enough of a change for me to brand this a minor release rather than a build revision.  Have fun with it.</p>
