--- 
wordpress_id: 296
layout: post
title: Migrations ain't just cool...they're sexy!
wordpress_url: http://www.sideline.ca/2007/03/30/migrations-aint-just-cooltheyre-sexy/

<a href="http://glu.ttono.us/articles/2005/10/27/the-joy-of-migrations">Migrations</a> are one of those things in Rails that blows me away.  I haven't actually tried to use a single migration with different databases to see how good the abstraction is but I love the idea.

As if merely having migrations wasn't good enough, somebody has decided to make them sexy on top of it.

My current sideline project has a ton of tables with a lot of relationships.  I'm starting to get tired of adding all of the foreign key references in each migration.  While the new <a href="http://errtheblog.com/post/2381">sexy_migrations plugin</a> doesn't get rid of those FK's, it definitely makes them a bit nicer to look at.  Check out this example:

[source:ruby]
class UpdateYourFamily &lt; ActiveRecord::Migration
  create_table :updates do
    foreign_key :user
    foreign_key :group

    text   :body
    string :type

    timestamps!
  end

  def self.down
    drop_table :updates
  end
end
[/source]

Is that nice or what?
