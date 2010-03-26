--- 
wordpress_id: 344
layout: post
title: Set up new Slicehost with Ruby and Rails
wordpress_url: http://blog.sideline.ca/2008/03/02/set-up-new-slicehost-with-ruby-and-rails/

<p>OK, this one is going to be all technical.</p>

<p>I signed up with SliceHost a while back but recently decided to re-image my slice.  The plan is to go with a Ubuntu Dapper Drake 6.06 LTS image since that seems to have the most documentation for Rails stuff.  This is mostly Greek to me so this installation list is a good way for me to keep track of everything for the future.</p>

<h3>References</h3>
<ul>
	<li>http://wiki.neeraj.name/slicehost/published/HomePage</li>
	<li>http://hivelogic.com/articles/ruby-rails-leopard/</li>
	<li>http://ubuntuforums.org/showthread.php?t=649881</li>
	<li>http://codersifu.blogspot.com/2007/03/howto-install-ruby-in-ubuntu-edgy-610.html</li>
</ul>

</h3>Steps</h3>
<pre>
	ssh root@x.x.x.x                       # insert IP address here
	adduser --ingroup users myusername     # pick something nicer than 'myusername'
	visudo
</pre>
<p>Go to the end of the file and add the following line:</p>
<pre>
	myusername ALL=(ALL) ALL
</pre>
<p>And save the file.  Logout and then back in with the new username.</p>
<p>Bring the slice up to date with the following commands:</p>
<pre>
	sudo apt-get update
	sudo apt-get dist-upgrade
	#Restart the slice
	sudo shutdown -r now
</pre>
<p>We're going to deviate from apt-get here a little bit so that we can install the latest and greatest version of Ruby from rubyforge.  Before grabbing Ruby, we need to install a few tools and create a directory for our source files first:</p>
<pre>
	 sudo apt-get install build-essential curl
	 mkdir /home/myusername/sources
	 cd /home/myusername/sources
</pre>
<p>To use Ruby 1.8.6, you have to install it manually instead of using apt-get.  Here's the steps:</p>
<pre>
	curl -O ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p111.tar.gz
	tar xzvf ruby-1.8.6-p111.tar.gz
	cd ruby-1.8.6-p111
	./configure --prefix=/usr
	make
	sudo make install
	sudo ln -s /usr/bin/ruby /usr/local/bin/ruby
	cd ..
</pre>
<p>Now when you type:</p>
<pre>ruby -v</pre>
<p>You should see:</p>
<pre>ruby 1.8.6 (2007-09-24 patchlevel 111) [x86_64-linux]</pre>
<p>Now that Ruby is installed, Ruby Gems can be installed.  Everything is much easier after this.</p>
<pre>
	curl -O http://files.rubyforge.mmmultiworks.com/rubygems/rubygems-1.0.1.tgz
	tar xzvf rubygems-1.0.1.tgz
	cd rubygems-1.0.1
	sudo ruby setup.rb
	sudo gem update
	cd ..
</pre>
<p>That's it.  A bit of a pain but at least everything is set up and good to go.  The next step is to get Rails and Mongrel installed.  After that, Apache, mongrel clusters and MySQL need to be setup.  Finally, things should be ready for Capistrano!</p>
--- 
wordpress_id: 344
layout: post
title: Set up new Slicehost with Ruby and Rails
wordpress_url: http://blog.sideline.ca/2008/03/02/set-up-new-slicehost-with-ruby-and-rails/

<p>OK, this one is going to be all technical.</p>

<p>I signed up with SliceHost a while back but recently decided to re-image my slice.  The plan is to go with a Ubuntu Dapper Drake 6.06 LTS image since that seems to have the most documentation for Rails stuff.  This is mostly Greek to me so this installation list is a good way for me to keep track of everything for the future.</p>

<h3>References</h3>
<ul>
	<li>http://wiki.neeraj.name/slicehost/published/HomePage</li>
	<li>http://hivelogic.com/articles/ruby-rails-leopard/</li>
	<li>http://ubuntuforums.org/showthread.php?t=649881</li>
	<li>http://codersifu.blogspot.com/2007/03/howto-install-ruby-in-ubuntu-edgy-610.html</li>
</ul>

</h3>Steps</h3>
<pre>
	ssh root@x.x.x.x                       # insert IP address here
	adduser --ingroup users myusername     # pick something nicer than 'myusername'
	visudo
</pre>
<p>Go to the end of the file and add the following line:</p>
<pre>
	myusername ALL=(ALL) ALL
</pre>
<p>And save the file.  Logout and then back in with the new username.</p>
<p>Bring the slice up to date with the following commands:</p>
<pre>
	sudo apt-get update
	sudo apt-get dist-upgrade
	#Restart the slice
	sudo shutdown -r now
</pre>
<p>We're going to deviate from apt-get here a little bit so that we can install the latest and greatest version of Ruby from rubyforge.  Before grabbing Ruby, we need to install a few tools and create a directory for our source files first:</p>
<pre>
	 sudo apt-get install build-essential curl
	 mkdir /home/myusername/sources
	 cd /home/myusername/sources
</pre>
<p>To use Ruby 1.8.6, you have to install it manually instead of using apt-get.  Here's the steps:</p>
<pre>
	curl -O ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p111.tar.gz
	tar xzvf ruby-1.8.6-p111.tar.gz
	cd ruby-1.8.6-p111
	./configure --prefix=/usr
	make
	sudo make install
	sudo ln -s /usr/bin/ruby /usr/local/bin/ruby
	cd ..
</pre>
<p>Now when you type:</p>
<pre>ruby -v</pre>
<p>You should see:</p>
<pre>ruby 1.8.6 (2007-09-24 patchlevel 111) [x86_64-linux]</pre>
<p>Now that Ruby is installed, Ruby Gems can be installed.  Everything is much easier after this.</p>
<pre>
	curl -O http://files.rubyforge.mmmultiworks.com/rubygems/rubygems-1.0.1.tgz
	tar xzvf rubygems-1.0.1.tgz
	cd rubygems-1.0.1
	sudo ruby setup.rb
	sudo gem update
	cd ..
</pre>
<p>That's it.  A bit of a pain but at least everything is set up and good to go.  The next step is to get Rails and Mongrel installed.  After that, Apache, mongrel clusters and MySQL need to be setup.  Finally, things should be ready for Capistrano!</p>
