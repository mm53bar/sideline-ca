--- 
wordpress_id: 121
layout: post
title: Fixing ESPNScoreboard module for DNN 2.x
disqus_url: http://blog.sideline.ca/2005/03/21/fixing-espnscoreboard-module-for-dnn-2x/

<p>I imagine that lots of folks are going to want to fix the UrlDecode and Links problems in ESPNScoreboard (note that these are already fixed in ScoreboardFeed).  These were never bugs at all until ESPN changed their format recently.  Anyways, this is the fix that I've done in ScoreboardFeed, so you can probably implement it in ESPNScoreboard.</p>
<p><strong><em>Bug Description</em></strong></p>
<p>The bug has two parts.  The first is the Url Decoding that ESPN introduced recently.  Here's a snippet of one of their datafeeds:</p>
<div>
<p>g1t1=NC%20State&amp;amp;g1t2=UConn&amp;amp;<br />g1s1=65&amp;amp;g1s2=62&amp;amp;g1status=Final+Sun&amp;amp;<br />g1url=http://sports.espn.go.com/ncb/recap'gameId=254000028&amp;amp;g1winner=t1</p></div>
<p> I've added the line breaks for readability.  Notice that instead of 'NC State', 'NC%20State' is entered.  This is called url encoding and is referred to as the UrlDecode bug for ESPNScoreboard's purposes.</p>
<p>The second part of the bug has to do with the way that the game url is parsed.  Since the parsing of each element is based on splitting the terms on the equals sign (=), the second equals sign in the url string breaks the logic since the string is actually split into an array with 3 items rather than 2.  This flawed logic occurs on the following line in the ESPNScoreboard.ascx.vb:</p>
<div>
<p>ScoreboardRow(Url) = CleanString(GameAttributes(5).Split("="c)(1))</p></div>
<p>The outcome of this bug is that the link displayed is not correct.  It is missing the actual value of the gameId (i.e. everything after second equals sign).  This bug is referred to as the Link bug for ESPNScoreboard. </p>
<p><strong><em>Fixing the Bug</em></strong></p>
<p>To fix the UrlDecode bug, you need to clean the text.  I've added a function called Cleanstring to ScoreboardFeed to accommodate this.  Here's the code:</p><pre><div><p>        Private Function CleanString(ByVal DirtyString As String) As String</p><p>            Dim InputString As String = DirtyString </p>
<p>            InputString = InputString.Replace("+", " ")
</p><p>            InputString = Server.UrlDecode(InputString)</p><p>
</p><p>            Return InputString</p><p>        End Function</p></div></pre>
<p>The Link bug isn't as easy to fix.  You could probably work on combining the 2nd and 3rd elements of the array that's created when the url line is split.  I wasn't a big fan of the split calls anyways, so I went a different way.  I used a regex with named matches to pull out the name/value pairs.  This allowed me to eliminate any reliance on looking for specific equals signs.  Here's the code:</p>
<div>
<p>    1 Private Function GetGames(ByVal DataString As String) As ArrayList</p>
<p>    2     Dim ScoreboardList As New ArrayList</p>
<p>    3     Dim Game As GameInfo</p>
<p>    4  </p>
<p>    5     Dim GamePattern As String = "g\d+t1.*'url=[^&amp;amp;]*"</p>
<p>    6     Dim GameMatch As Match = Regex.Match(DataString, GamePattern)</p>
<p>    7  </p>
<p>    8     Dim GameAttributePattern As String = "^g\d+t1=('&amp;lt;team1&amp;gt;.*')&amp;amp;g\d+t2=('&amp;lt;team2&amp;gt;.*')&amp;amp;g\d+s1=('&amp;lt;score1&amp;gt;.*')&amp;amp;g\d+s2=('&amp;lt;score2&amp;gt;.*')&amp;amp;g\d+status=('&amp;lt;status&amp;gt;.*')&amp;amp;g\d+url=('&amp;lt;url&amp;gt;.*')$"</p>
<p>    9     Dim GameAttributeMatch As Match</p>
<p>   10  </p>
<p>   11     While (GameMatch.Success)</p>
<p>   12         GameAttributeMatch = Regex.Match(GameMatch.Value, GameAttributePattern)</p>
<p>   13         While (GameAttributeMatch.Success)</p>
<p>   14             Game = New GameInfo</p>
<p>   15             Game.Team1 = CleanString(GameAttributeMatch.Groups("team1").Value)</p>
<p>   16             Game.Team2 = CleanString(GameAttributeMatch.Groups("team2").Value)</p>
<p>   17             Game.Score1 = CleanString(GameAttributeMatch.Groups("score1").Value)</p>
<p>   18             Game.Score2 = CleanString(GameAttributeMatch.Groups("score2").Value)</p>
<p>   19             Game.Status = CleanString(GameAttributeMatch.Groups("status").Value)</p>
<p>   20             Game.Url = CleanString(GameAttributeMatch.Groups("url").Value)</p>
<p>   21             ScoreboardList.Add(Game)</p>
<p>   22             GameAttributeMatch = GameAttributeMatch.NextMatch</p>
<p>   23         End While</p>
<p>   24         GameMatch = GameMatch.NextMatch</p>
<p>   25     End While</p>
<p>   26     Return ScoreboardList</p>
<p>   27 End Function</p></div>
<p>I've made a few changes in the code.  First among those is that I'm not using a datatable anymore like I did in ESPNScoreboard.  I've now created a class to contain my Game information.  Each instance of the class is added to an ArrayList which is then bound to the repeater.  I like this format better than building a datatable row by row.</p>
<p>Note the huge regex on line 8.  This is the regex that parses through the string for each game.  Thank god for <a href="http://regex.osherove.com/">The Regulator</a> - it was a huge help in writing the regex since I'm a beginner at it.  I've used named groups in the regex.  This allows the code in lines 15 to 20 an easy way to pick out the text.</p>
<p>This code could still work well with the old datatable in ESPNScoreboard.  Just replace all of the Game references with the ScoreboardRow syntax and add each ScoreboardRow to ScoreboardTable within the inner loop.  Don't forget to also change the return type of GetGames from an ArrayList to a DataTable</p>
<p><strong><em>The Future</em></strong></p>
<p>I'm not sure what plans the future has for ScoreboardFeed.  There isn't a lot that can be added to this other than localization support.  If I can find some other web sites that have easily consumable sports scores, then I might extend ScoreboardFeed to have some way to configure the scoreboard retrieval process.</p>
<p>Hopefully this has been useful to some folks.  If not, at least I'm creating some new content to pollute the Internet!</p>
