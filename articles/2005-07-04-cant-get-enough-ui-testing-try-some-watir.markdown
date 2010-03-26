--- 
wordpress_id: 159
layout: post
title: Can&#8217;t get enough UI testing'  Try some Watir!
wordpress_url: http://blog.sideline.ca/2005/07/04/cant-get-enough-ui-testing-try-some-watir/

<p>This is pretty freaking sweet.  I've been looking for a nice app that our QA guy at work could use to help with testing.  Maybe this is it'  It's a nice side-benefit that it can jive with NUnit as well. </p>
<p><em>Integrating Ruby and Watir with NUnit:</em> </p>
<blockquote>
<p align="left"><!--StartFragment --><em>Watir is an open source functional testing library for automated tests to be developed and run against a web browser. </em>Cool' </p>
<p>Here's an example that visits Google, searches for "Programming Ruby" and confirms that it found what it was looking for. The stuff after the # are comments. </p>
<p><font face="Courier New">require</font><font color="#808080"></font><font color="#7f007f">'watir'</font><font color="#808080"></font><font face="Courier New"></font><font color="#008000"># the watir controller<br /></font>include<font color="#808080"></font>Watir<br />test_site<font color="#808080"></font><b>=</b><font color="#808080"></font><font face="Courier New"></font><font color="#7f007f">'http://www.google.com'<br /></font>ie<font color="#808080"></font><b>=</b><font color="#808080"></font>IE<b><font face="Courier New">.</font><font face="Courier New" color="#00007f">new<br /></font></b><font face="Courier New">ie<b>.<font color="#00007f">goto</font>(</b>test_site</font><font face="Courier New"><b>)<br /></b>ie<b>.</b>text_field<b>(:</b>name<b>,</b></font><font color="#808080"></font><font color="#7f007f">"q"</font><b>).</b>set<b>(</b><font color="#7f007f">"pickaxe"</font><b>)</b><font color="#808080"></font><font face="Courier New"></font><font color="#008000"># q is the name of the search field<br /></font>ie<b>.</b>button<b>(:</b>name<b>,</b><font color="#808080"></font><font color="#7f007f">"btnG"</font><b>).</b>click<font color="#808080"></font><font color="#008000"># "btnG" is the name of the Search button</font><br /><b><font color="#00007f"></font><font face="Courier New">if</font></b><font face="Courier New"></font><font color="#808080"></font>ie<b>.</b>contains_text<b>(</b><font color="#7f007f">"Programming Ruby"</font><b>)</b><font color="#808080"></font><font face="Courier New"><br /></font><font face="Courier New">  puts</font><font color="#808080"></font><font color="#7f007f">"Test Passed. Found the test string: 'Programming Ruby'. Actual Results match Expected Results."<br /></font><b><font color="#00007f"></font><font face="Courier New">else<br /></font></b><font face="Courier New">  puts</font><font color="#808080"></font><font color="#7f007f">"Test Failed! Could not find: 'Programming Ruby'"</font><font color="#808080"><br /></font><font face="Courier New">end</font></p>
<p>If you want get Ruby and Watir and start playing: </p>
<ul>
<li><a href="http://rubyforge.org/frs/'group_id=167">Download Ruby for Windows</a></li>
<li><a href="http://rubyforge.org/frs/download.php/4392/watir_v1_31.zip">Download Watir</a> and run install.rb </li>
<li>Go into <em>C:\watir_bonus\examples </em>and run <em>googleSuite_test.rb</em></li>
<li>Then, look at <em>articleExample.rb </em>and make some changes to test your own site. </li>
<li>Enjoy. Feel free to integrate into your NUnit tests if you like using our code above. If you expand it, let us know.<img height="0" src="http://www.hanselman.com/blog/aggbug.ashx'id=ed8a9800-0bf5-44e8-9442-cef92ae39a48" width="0" /></li></ul></blockquote><i>[Via <a href="http://www.hanselman.com/blog/PermaLink,guid,ed8a9800-0bf5-44e8-9442-cef92ae39a48.aspx">ComputerZen.com - Scott Hanselman's Weblog</a>]</i>
