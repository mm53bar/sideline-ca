require 'vendor/serious-0.2.6/lib/serious'
require './lib/serious_helper'

Serious.set :title, 'Sideline'
Serious.set :author, 'Michael McClenaghan'
Serious.set :url, 'http://sideline.ca'
Serious.set :root, Dir.getwd
Serious.set :disqus, 'sideline'
Serious.set :google_analytics, 'UA-7482154-1'
Serious.set :feed_url, 'http://feeds2.feedburner.com/sideline'
Serious.set :cache_timeout, 3
Serious.set :tagline, 'I help software teams make their users happy.'

run Serious
