require 'rails/generators'                
require 'rails/generators/migration'      

class RtextileGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :title, :type => :string, :required => true, :banner =>  "model:title"
  argument :doc, :type => :string, :required => true, :banner =>  "model:doc"
  include Rails::Generators::Migration
  
 
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
  # Every method that is declared below will be automatically executed when the generator is run

 def create_migration_file
   f = File.open File.join(File.dirname(__FILE__), 'templates', 'schema.rb')
   schema = f.read; f.close
   
   schema.gsub!(/ActiveRecord::Schema.*\n/, '')
   schema.gsub!(/^end\n*$/, '')

   f = File.open File.join(File.dirname(__FILE__), 'templates', 'migration.rb')
   migration = f.read; f.close
   migration.gsub!(/SCHEMA_AUTO_INSERTED_HERE/, schema)
   
   tmp = File.open "tmp/~migration_ready.rb", "w"
   tmp.write migration
   tmp.close

   migration_template  '../../../tmp/~migration_ready.rb',
     "db/migrate/create_#{plural_name}.rb "
   remove_file 'tmp/~migration_ready.rb'
 end
 
 
  def add_route  
    route "resources #{plural_name.to_sym.inspect}" 
    route "match 'download' => '#{plural_name}#download', :as => :download"
    route "match 'download_html' => '#{plural_name}#download_html', :as => :download_html"
  end 
   
  def create_helper_file
    create_file "app/helpers/#{plural_name}_helper.rb", <<-FILE
    module #{plural_class_name}Helper
    
    end
    FILE
  end
  
  def copy_templates
    template "show.html.erb", "app/views/#{plural_name}/show.html.erb"
    template "_show.html.erb", "app/views/#{plural_name}/_show.html.erb"
    template "_form.html.erb", "app/views/#{plural_name}/_form.html.erb"
    template "edit.html.erb", "app/views/#{plural_name}/edit.html.erb"
    template "index.html.erb", "app/views/#{plural_name}/index.html.erb"
    template "new.html.erb", "app/views/#{plural_name}/new.html.erb"
    template "model.rb", "app/models/#{name}.rb "   
    template "controller.rb", "app/controllers/#{plural_name}_controller.rb"
    
  end 
  
  def add_RC      # add require RedCloth to application_controller
   line = "class ApplicationController < ActionController::Base"
   gsub_file 'app/controllers/application_controller.rb', /(#{Regexp.escape(line)})/mi do |match|
   "#{match}\n  require 'RedCloth'\n"
  end
  end
  
  def class_name
    name.camelize
  end 
  def plural_class_name
    plural_name.camelize
  end
end
