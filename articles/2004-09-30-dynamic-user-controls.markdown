--- 
wordpress_id: 33
layout: post
title: Dynamic User Controls
wordpress_url: http://www.sideline.ca/2004/09/30/dynamic-user-controls/

Working with DNN is a challenge if you are looking for a multi-page website experience in your module.  That's because a module is just a user control that is placed on a web page with a bunch of other user controls.  If you want your module to have a different layout (something like a master-detail relationship), then you need to get a bit sneaky.

One of the most common ways to do this is to use asp:panel tags.  These tags will render out as div wrappers that will isolate your UI code.  Then, it's a simple matter to enable or disable these panels to simulate a multi-page experience.  This works but ends up being quite complicated as you try to maintain all of the different panels and the web controls that they contain.

A better way to do it is to move all of your individual panel content into individual user controls.  These user controls are much more isolated and allow for easier maintenance.  The only problem is that there are a few tricks to loading them up.  The article at [Dynamic Web Controls, Postbacks, and View State](http://aspnet.4guysfromrolla.com/articles/092904-1.aspx) lists all of the details that you need to know.  It is an article worth reading just for this line:

>If we need our dynamically added controls to maintain their view state it is paramount that these controls be added before the Load View State stage. That is, these controls must exist within the page's control hierarchy before the view state is loaded. There's only one stage before Load View State - Initialization. That means, if we want our dynamic controls to persist view state we must add them to the control hierarchy in the page's Init event.
