--- 
wordpress_id: 158
layout: post
title: What a mess!
wordpress_url: http://www.sideline.ca/2005/07/03/what-a-mess/

<p><img height="55" alt="Animated_poop_machine" hspace="5" src="http://my.aream.ca/blogs/images/animated_poop_machine.gif" width="49" align="left" border="0" />I've been busting my butt this morning trying to get some headway on the <a href="http://aream.ca/DNN/PickEm/tabid/56/Default.aspx">Pick'Em</a> conversion to <a href="http://www.dotnetnuke.com/">DNN 3.x</a>.  After a number of problems with missing SqlDataProviders (switched to <a href="http://www.dotnetnuke.dk/Default.aspx'tabid=224">Dal Builder Pro</a> from <a href="http://dnnjungle.vmasanas.net/Development/Templates/tabid/28/Default.aspx">DNNJungle</a> to fix it), source control blunders (using <a href="http://workspaces.gotdotnet.com/pickem">GotDotNet</a> sucks!) and getting ready for a new little brat (hence the animated image), I think that I've finally got it to a point where I'm damn close to getting some good testing.  Luckily, the <a href="http://www.cfl.ca/">CFL</a> season is upon us, so I should be able to get some testing in the next few weeks.</p>
<p>One glaring problem that I'll have as I finish up the coding is cleaning up the sprocs.  I don't think that I've ever cleaned it out since the original testing of Pick'Em v1.  After switching between a couple of different code generators and then adding my own goodies, my SQL Server is quite a mess!  Here's what I've found:</p>
<blockquote>
<p><strong>In SqlDataProvider but not in SqlServer</strong></p>
<ul>
<li>PickEmCountAll</li>
<li>PickEmGetAll</li>
<li>PickEmDeleteAll</li>
<li>PickEmGamesCountAll</li>
<li>PickEmGamesGetAll</li>
<li>PickEmGamesDeleteAll</li>
<li>PickEmPicksCountAll</li>
<li>PickEmPicksGetAll</li>
<li>PickEmPicksDeleteAll</li>
<li>PickEmPicksByPickEmUsers</li>
<li>PickEmUsersCountAll</li>
<li>PickEmUsersGetAll</li>
<li>PickEmUsersDeleteAll</li>
<li>PickEmWeeksCountAll</li>
<li>PickEmWeeksGetAll</li>
<li>PickEmWeeksDeleteAll</li></ul></blockquote>
<p>Obviously, I'm not a big fan of the CountAll, GetAll or DeleteAll methods.  The PickEmPicksByPickEmUsers didn't come up either.  But, believe it or not, this is the short list!  On to the next one.</p>
<blockquote>
<p><strong>In SqlServer but not in SqlDataProvider</strong></p>
<ul>
<li>PickEmGamesDeleteByWeek</li>
<li>PickEmGamesGetByCurrentWeek</li>
<li>PickEmGamesGetByModules</li>
<li>PickEmGamesGetByPickEmWeeks</li>
<li>PickEmGamesGetScoresByPickEmWeeks</li>
<li>PickEmGamesList</li>
<li>PickEmGetByModules</li>
<li>PickEmList</li>
<li>PickEmPicksGetByModules</li>
<li>PickEmPicksGetByPickEmGames</li>
<li>PickEmPicksGetByUsers</li>
<li>PickEmPicksGetByUsersAndWeeks</li>
<li>PickEmPicksList</li>
<li>PickEmReportsGetByUsers</li>
<li>PickEmScoresUpdate</li>
<li>PickEmTeamsAdd</li>
<li>PickEmTeamsDelete</li>
<li>PickEmTeamsGet</li>
<li>PickEmTeamsGetByModules</li>
<li>PickEmTeamsList</li>
<li>PickEmTeamsUpdate</li>
<li>PickEmUsersGetByModules</li>
<li>PickEmUsersGetByUsers</li>
<li>PickEmUsersList</li>
<li>PickEmWeeksDeleteByModule</li>
<li>PickEmWeeksGetByModules</li>
<li>PickEmWeeksGetByName</li>
<li>PickEmWeeksList</li></ul></blockquote>
<p>Most of these are caused by a) updates to the ERD that removed ModuleId from most of the tables, b) changes in code generation from DNNJungle to DAL Builder Pro and c) I don't even have a freakin' Teams table!  How old are the Team sprocs'! <img src="http://my.aream.ca/blogs/images/smile4.gif" /></p>
<p>Anyways, to be a nice module developer, I suppose that I'll need to write a proper sql file to be deployed with Pick'Em that deletes all of these unneeded sprocs.  What a pain!</p>
<p>Oh by the way, I've attached the ERD if you're interested:  <a href="http://my.aream.ca/blogs/images/Pick_27Em_20ERD.png">File Attachment: Pick'Em ERD.png (35 KB)</a></p>
<p> </p>
