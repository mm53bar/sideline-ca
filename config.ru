require 'serious'
require './lib/serious_helper.rb'

Serious.set :title, 'sideline-ca'
Serious.set :author, 'Your Name here'
Serious.set :url, 'http://sideline-ca.heroku.com'
Serious.set :root, Dir.getwd

run Serious
