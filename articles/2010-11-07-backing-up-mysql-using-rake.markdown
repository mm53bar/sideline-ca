title: Backing up MySQL using Rake

I was recently looking for a nice way to back up MySQL on our staging server.  A Google search brings up a bunch of different ways but I ended up going with some code from the [data_sync plugin](https://github.com/carr/data_sync) on GitHub.  
~
In particular, I ended up creating this Rake task:

    namespace :db do
      desc "Dump the current database to a MySQL file"
      task :database_dump => :environment do
        databases = YAML::load(File.open(Rails.root.join('config', 'database.yml')))
        timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
        sql_path = "#{Rails.env}_#{timestamp}.sql"
        tar_path = "#{Rails.env}_#{timestamp}.tar.bz2"
    
        case databases[Rails.env]["adapter"]
          when 'mysql'
            ActiveRecord::Base.establish_connection(databases[Rails.env])

            commands = []

            mysql_dump_command = []
            mysql_dump_command << "mysqldump"
            if databases[Rails.env]["host"].present?
              mysql_dump_command << "-h #{databases[Rails.env]["host"]}"
            else
              mysql_dump_command << "-h localhost"
            end
            mysql_dump_command << "-u #{databases[Rails.env]["username"]}"
            if databases[Rails.env]["password"].present?
              mysql_dump_command << "-p#{databases[Rails.env]["password"]}"
            end
            mysql_dump_command << "#{databases[Rails.env]["database"]}"
            mysql_dump_command << " > #{Rails.root.join('db', sql_path)}"

            commands << mysql_dump_command.join(' ')
            commands << "cd #{Rails.root.join('db')}"
            commands << "tar -cjf #{Rails.root.join('db', tar_path)} #{sql_path}"
            commands << "rm -fr #{Rails.root.join('db', sql_path)}"

            `#{commands.join(' && ')}`
        
            puts "Dumped #{tar_path}"
          else
            raise "Task doesn't work with '#{databases[Rails.env]['adapter']}'"
        end
      end
    end

Running this task will created a compressed and timestamped MySQL backup in the db folder of your Rails app.  What's nice is that this task is easy to wire into your Capistrano deployment.

    desc "Export the database into the db/ folder"
    task :dump, :except => { :no_release => true } do
      run "cd #{current_path}; rake RAILS_ENV=#{stage} db:database_dump"
    end
    
Even better, you can call the `dump` task before running any of your other db-related cap tasks.

    desc "Run pending migrations on already deployed code"
    task :migrate, :except => { :no_release => true } do
      dump
      run "cd #{current_path}; rake RAILS_ENV=#{stage} db:migrate"
    end
    
I've found this to be a nice simple solution.