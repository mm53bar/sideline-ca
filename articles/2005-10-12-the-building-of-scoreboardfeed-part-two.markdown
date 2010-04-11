--- 
wordpress_id: 180
layout: post
title: The Building of ScoreboardFeed, Part Two
wordpress_url: http://www.sideline.ca/2005/10/12/the-building-of-scoreboardfeed-part-two/

Now that I had gone through a few different versions of an online
scoreboard, I was ready to create the ultimate scoreboard with
ScoreboardFeed v3. The first requirement that I needed to tackle was
supporting different online data sources of scoreboard data.
<br />

<br />

During my scoreboard research, Ive found a lot of information on SportsML.  To quote <a href="http://www.sportsml.org/">sportsml.org</a>:

<br />
<blockquote>

SportsML aims to be the global XML standard for the interchange of
sports data. Designed to be as easy to understand and implement as
possible, SportsML allows for the exchange of sports scores, schedules,
standings, and statistics for a wide variety of competitions.
  <br />
</blockquote>


SportsML gave me something that I was looking for: a standard syntax to
representing sports scores no matter where they came from. Now all I
needed was some way to start grabbing the scores.
<br />

<br />

Continuing the SportsML research, I came across <a href="http://xmlsports.sourceforge.net/">XMLSports</a>,
a SourceForge project that seems to have died out in 2003. XMLSports
had a lofty goal: XMLSPORTS is a utility that outputs live sports
scores and statistics in SportsML (XML) format. XMLSports was written
in Java and was designed to scrape sports scores from external web
pages, parse them for game information and then post them in SportsML
format. This sounded pretty close to what I was looking to do.
<br />

<br />

XMLSports seemed to have a lot of potential ideas that could be reused
in building ScoreboardFeed v3. They had Scraper classes for collecting
data. There were Robots and Factories for abstracting away the data
sources. They also had some nice parsing routines and URLs for ESPN.
<br />

<br />

For an OO rookie and a guy in search of inspiration (i.e. source code
that I could steal), XMLSports was a godsend. Written in Java, it would
give me some good ideas from the OO perspective. And since the source
code was freely available, I could flesh out a lot of ScoreboardFeed
directly from XMLSports.
<br />

<br />

Before I knew it, I had a nice little Scoreboard <a href="http://www.startvbdotnet.com/oop/abstract.aspx">abstract class</a> created:


<pre>    Public MustInherit Class Scoreboard<br /><br />        Protected Retriever As IScoreboardRetriever<br />        Protected ScoreboardList As New ArrayList<br /><br />        Public Sub New()<br />            Retriever = New UrlRetriever<br />        End Sub<br /><br />        Public Sub New(ByVal ScoreboardRetriever As IScoreboardRetriever)<br />            Retriever = ScoreboardRetriever<br />        End Sub<br /><br />        Public MustOverride ReadOnly Property SportName() As String<br /><br />        Public MustOverride ReadOnly Property Notes() As String<br /><br />        Public MustOverride ReadOnly Property PublisherName() As String<br /><br />        Public MustOverride ReadOnly Property ScoreboardUri() As String<br /><br />        Public MustOverride Function Retrieve() As ArrayList<br /><br />    End Class<br /><br /></pre>
As
an abstract class, Scoreboard doesn't really do much more than
implement a couple of constructors and provide the stubs for some
properties and methods.  The properties are descriptive and allow
each instance of Scoreboard to have unique values for  SportName,
Notes, PublisherName and ScoreboardUri.<br />

<br />

The nuts and bolts of Scoreboard start to become apparent by looking at
the constructors.  There is a basic constructor that takes no
parameters and instantiates a UrlRetriever.  This constructor is
overloaded if a parameter of type IScoreboardRetriever is passed
in.  As you may have guessed, IScoreboardRetriever is an interface
that defines how to get the scoreboard data.  IScoreboardRetriever
looks like this:<br />

    
<pre>    Public Interface IScoreboardRetriever<br />        Property ScoreboardUri() As String<br /><br />        Function Retrieve() As String<br />    End Interface</pre>

Notice that Retrieve() is the only method in both Scoreboard and
IScoreboardRetriever.  I'm not sure if this is the best design,
but it does give you a clue as to how things will work.<br />

<br />

Each class that inherits from Scoreboard will create its own parsing
routines in a method called Retrieve().  Before the class can
parse the data, it needs to be retrieved by another class that
implements IScoreboardRetriever.  There is a default class called
UrlRetriever that will be called if no IScoreboardRetriever is passed
to the derived Scoreboard class.  Here is the code for
UrlRetriever:<br />



  
    
  
    
<pre>    Public Class UrlRetriever<br />        Implements IScoreboardRetriever<br /><br />        Private _url As String<br /><br />        Public Property ScoreboardUri() As String Implements IScoreboardRetriever.ScoreboardUri<br />            Get<br />                Return _url<br />            End Get<br />            Set(ByVal Value As String)<br />                _url = Value<br />            End Set<br />        End Property<br /><br />        Public Function Retrieve() As String Implements IScoreboardRetriever.Retrieve<br />            Return GetHttpFeed(_url)<br />        End Function<br /><br />        Public Sub New()<br />        End Sub<br /><br />        Public Sub New(ByVal ScoreboardUrl As String)<br />            _url = ScoreboardUrl<br />        End Sub<br /><br />#Region "Private Methods"<br /><br />        Private Function GetHttpFeed(ByVal url As String) As String<br />            ' Obtain PortalSettings from Current Context<br />            Try<br />                ' make remote request<br />                Dim wr As System.Net.HttpWebRequest = CType(System.Net.WebRequest.Create(url), System.Net.HttpWebRequest)<br />                wr.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)"<br /><br />                ' set proxy server<br />                If System.Convert.ToString(DnnHelper.GetHostSettings("ProxyServer")) &amp;lt;&amp;gt; "" Then<br />                    wr.Proxy = New System.Net.WebProxy(System.Convert.ToString(DnnHelper.GetHostSettings("ProxyServer")), System.Convert.ToInt32(System.Convert.ToString(DnnHelper.GetHostSettings("ProxyPort"))))<br />                    ' set the credentials for an authenticated proxy<br />                    If Not System.Convert.ToString(DnnHelper.GetHostSettings("ProxyUsername")).Equals("") Then<br />                        wr.Proxy.Credentials = New System.Net.NetworkCredential(System.Convert.ToString(DnnHelper.GetHostSettings("ProxyUsername")), System.Convert.ToString(DnnHelper.GetHostSettings("ProxyPassword")))<br />                    End If<br />                End If<br /><br />                ' set the HTTP properties<br />                wr.Timeout = 5000 ' 5 seconds<br /><br />                ' read the response<br />                Dim resp As System.Net.WebResponse = wr.GetResponse()<br />                Dim stream As System.io.StreamReader = New System.IO.StreamReader(resp.GetResponseStream(), System.Text.Encoding.Default)<br /><br />                ' load HTML document<br />                Dim reader As System.Text.StringBuilder = New System.Text.StringBuilder(stream.ReadToEnd)<br />                stream.Close()<br /><br />                Return (reader.ToString())<br /><br />            Catch<br />                ' connectivity issues<br />            End Try<br /><br />        End Function<br />#End Region<br /><br />    End Class
</pre>
UrlRetriever is a simple class that takes a Url through a
property or as a constructor parameter.  When Retrieve() is
called, it calls GetHttpFeed with that Url and returns a string that
represents the Html of a webpage.  While there definitely needs to
be some error handling implemented in the GetHttpFeed method, this code
is pretty much complete.<br />

<br />

There is another Retriever implemented in ScoreboardFeed. 
FileRetriever is designed to load Html files that are on the local
filesystem of the server and return their contents as a string. 
This is useful for two reasons:<br />

<ol>
<li>In sites that have lots of traffic, the scraping of a webpage may
not occur in realtime.  That is, there might be a separate process
running that retrieves a web page from the internet and stores the file
locally so that any processing of that file is not done on the
internet.  Since loading a local file is much faster than
retrieving that same file from the internet, the delay experienced by
the end user should be smaller.</li><li>For testing, it is good to have a number of sample files locally
that have known content.  For example, I am accumulating a number
of test files that have data for games that have not started, games
that are in progress and games that are finished.  Since I know
the format of these files, they are good test data to determine if the
code is running as expected.</li>
</ol>

This is a bit more than I expected to cover in this post.  In the
next post, I'll discuss how I inherited the Scoreboard abstract class
and used it to parse the ESPN scoreboards with the help of the
XMLSports code.<br />
