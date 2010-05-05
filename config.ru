require 'vendor/serious-0.2.6/lib/serious'
require './lib/serious_helper'

Serious.set :title, 'Sideline'
Serious.set :author, 'Michael McClenaghan'
Serious.set :url, 'http://www.sideline.ca'
Serious.set :root, Dir.getwd
Serious.set :disqus, 'sideline'
Serious.set :google_analytics, 'UA-7482154-1'
Serious.set :feed_url, 'http://feeds2.feedburner.com/sideline'
Serious.set :typekit, 'jjt6lnd'
Serious.set :myopenid, 'mm53bar'
Serious.set :cache_timeout, 28800
Serious.set :tagline, 'I help software teams make their users happy.'
Serious.set :extension, 'markdown'

run Serious

