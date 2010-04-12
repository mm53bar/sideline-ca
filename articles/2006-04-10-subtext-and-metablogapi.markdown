--- 
wordpress_id: 236
layout: post
title: SubText and MetaBlogAPI
disqus_url: http://blog.sideline.ca/2006/04/10/subtext-and-metablogapi/

<p>Any astute readers out there might have noticed that I've recently switched from CommunityServer to SubText.  Actually, any person that got within 10 feet of me over the last 2 weeks has probably heard my horror story of trying to get CS to give me back my data.</p>
<p>Anyways, I fired up BlogJet today and wanted to hit SubText.  The only problem is that I had no idea what URL to specify for the MetaBlogAPI service.  I checked out the aptly named 'services' folder but couldn't find anything.  There were a few asmx files that I tried to no avail.</p>
<p>A quick Google found a page that listed the web.config file for SubText.  In there, I found a HttpHandler entry for the MetaBlogAPI:</p>
<blockquote>
<p><font face="Arial" size="2">&amp;lt;HttpHandler pattern="(':/services\/metablogapi\.aspx)$" type = "Subtext.Framework.XmlRpc.MetaWeblog, Subtext.Framework" handlerType="Direct" /&amp;gt;</font></p></blockquote>
<p><font face="Arial" size="2">I'll have to look at the code a bit later to see how it's wired up, but for now I can use the 'services/MetaBlogAPI.aspx' to satisfy my BlogJet requirements.</font><br /></p>
