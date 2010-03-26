--- 
wordpress_id: 129
layout: post
title: XSLT for Blog RSS feeds
wordpress_url: http://blog.sideline.ca/2005/04/10/xslt-for-blog-rss-feeds/

<p>I was a little disappointed by the way the default XSLT files in DNN supported RSS feeds from blogs.  So I built my own.  You can download it from <a href="http://aream.ca/DNN/tabid/43/Default.aspx">http://aream.ca/DNN/tabid/43/Default.aspx</a>.</p>
<p>Basically, it consists of a XSL file and a few image files.  Upload the zip file to DNN as a content file (not a module!!) using the Admin -&amp;gt; File Manager.  Be sure to click the checkbox to Decompress Zip Files.</p>
<p>The files contained will be unzipped into your portal folder.  Usually, that's <em>portals/0</em>, but it could vary if you have a non-standard or multi-portal install of DNN.  You can check the root folder for your portal by going to Admin -&amp;gt; Site Settings.  Open up the Advanced Settings and check what your Home Directory.  Then open up the XSLT file that you just uploaded (<em>RSS91_DotText.xsl</em>) and set the ImagePath variable according to the directions listed in it.</p>
<p>That's it!  You should now be able to assign the XSLT file to your Newsfeed module and have your Blog nicely formatted within your site.</p>
<p>Future enhancements that I'd like to do to the Newsfeed module are to automatically pass some parameters to the XSLT.  Parameters such as RootFolder and FeedUrl could help quite a bit with the customization.</p>
