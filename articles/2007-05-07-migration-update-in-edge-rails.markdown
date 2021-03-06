--- 
wordpress_id: 314
layout: post
title: Migration update in Edge Rails
disqus_url: http://blog.sideline.ca/2007/05/07/migration-update-in-edge-rails/

<p>Remember that <a href="http://errtheblog.com/post/2381">sexy_migrations plugin</a> that <a href="http://www.sideline.ca/2007/03/30/migrations-aint-just-cooltheyre-sexy">I chatted about back in March</a>?  Well, <a href="http://dev.rubyonrails.org/changeset/6667">changeset 6667</a> has updated Rails to incorporate this migration style into the core.</p>

<p>I read through the updated code and it doesn't appear that the sexy migration style for foreign keys is supported.  At this point, it looks like what has been incorporated is a shorthand notation for datatyping the column names (especially nice for the timestamp columns).  Of course, I'm not a Ruby expert so maybe I'm wrong.  I'll report back if I am.</p>

<p>Not sure how to use it?  There are some decent comments by DHH checked in along with the change:</p>

<blockquote>
	<p>
Instead of calling column directly, you can also work with the short-hand definitions for the default types.  They use the type as the method name instead of as a parameter and allow for multiple columns to be defined in a single statement. </p>

<p>What can be written like this with the regular calls to column: </p>
[ruby]
  create_table "products", :force => true do |t| 
    t.column "shop_id",    :integer 
    t.column "creator_id", :integer 
    t.column "name",       :string,   :default => "Untitled" 
    t.column "value",      :string,   :default => "Untitled" 
    t.column "created_at", :datetime 
    t.column "updated_at", :datetime 
  end 
[/ruby]
<p>Can also be written as follows using the short-hand: </p>
[ruby]
  create_table :products do |t| 
    t.integer :shop_id, :creator_id 
    t.string  :name, :value, :default => "Untitled" 
    t.timestamps 
  end 
[/ruby]
<p>There's a short-hand method for each of the type values declared at the top. And then there's TableDefinition#timestamps that'll add created_at and updated_at as datetimes.</p>
</blockquote>
