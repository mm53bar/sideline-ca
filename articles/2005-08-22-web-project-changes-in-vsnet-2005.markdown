--- 
wordpress_id: 174
layout: post
title: Web Project changes in VS.Net 2005
wordpress_url: http://blog.sideline.ca/2005/08/22/web-project-changes-in-vsnet-2005/

Lots of good info at http://weblogs.asp.net/scottgu/archive/2005/08/21/423201.aspx for those of you that haven't heard any of this yet.  

Some of the more obvious changes that will affect me are:

<blockquote>
The ability to both edit and add code while the debugger is attached.  With VS 2002 and VS 2003, attaching and detaching the debugger can often be cumbersome and time consuming (especially when it nukes the process on detach).  When the debugger is attached, developers are not allowed to make any changes to the running web application or web project.  

With VS 2005, we now allow a workflow where developers can launch a web project under the debugger, try out and step through a request to identify an issue, and then ' without closing or detaching the debugger ' add methods, classes, pages and change code in the project, hit save, and then hit refresh in the browser to immediately step through things in the debugger again.  This is supported for both VB and C#, and enables much richer editing support than the 'edit and continue' support in client projects (where only code inside methods can be changed ' and method, parameter, and class signatures can't be changed).  I personally have found it useful to keep the debugger attached for 1-2 hours at a time, while I work on pages, classes and develop the entire web with the ability to step through things at anytime.
</blockquote>

<blockquote>
One of the biggest changes was that we've moved away from compiling everything in a web project into a single DLL (which is the only mode that VS 2002 and VS 2003 support).  Instead, we now partition the web project into multiple more granular assemblies.

All non-code-behind classes, datasets, web-services and other non-UI code that live in the web project are by default now compiled into one common assembly.  Pages and User-Controls are then compiled into separate more-granular assemblies (by default each directory in the web project is compiled into a separate assembly).  Note that the web project can also obviously reference other class library projects as part of a solution too (these work just the same as today and would compile into their own project's assembly).</blockquote>

<blockquote>The optional ability to completely compile a web project, including compiling all .aspx, .ascx, and .master file content (allowing you to compile and then remove the HTML and ASP.NET server control markup code, and optionally even remove the .aspx and .ascx files themselves and just ship the .dll assemblies).  There are a couple of benefits with this feature: 1) It allows you to ship a totally 'locked-down' deployment package for enterprise deployment environments. 2) It allows you to better protect your intellectual property from customers if you don't want them to see or change your markup. 3) It eliminates all runtime ASP.NET compilation steps, avoiding the first-time performance hit when a page is first accessed and the .aspx markup is compiled, and enabling much better application startup time and working set usage.  This later benefit can be particularly noticeable with large applications, and provides a big performance improvement over VS 2003 built apps today.</blockquote>

<blockquote>One of the biggest things in VS 2005 is the introduction of the Visual Studio Team System products, and the advanced development support they provide.  These features are fully integrated with the web project system and allow developers building web projects to take advantage of lots of new capabilities.  A handful of a few of the big new features that touch a little on the web project system include:

1) Ability to develop unit tests for both classes and web UI within a web project (allowing functional ASP.NET UI validation within test projects).  VSTS includes a built-in web replay tool that captures interactions between a browser and the server, and allows easy automation and validation of behavior.

2) Ability to measure and precisely quantify the percentage of code exercised by tests (what we often call code coverage).  A web developer can build a web project, then build lots of tests to exercise its functionality, and can then run those tests and get a report detailing that '74% of the lines of code in the web project were executed during the tests', as well as a precise breakdown of what parts of the code-base were not exercised because boundary and use cases weren't good enough.

3) Ability to load-test web projects to measure RPS (requests per second) throughput, average latency, memory usage and dozens of other metrics.

4) Ability to profile code execution of web projects, and analyze the % of time spent where within a web project as well as memory allocations and usage.
</blockquote>

