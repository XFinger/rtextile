class Create<%= plural_class_name %> < ActiveRecord::Migration
  def self.up
    SCHEMA_AUTO_INSERTED_HERE
  end

  def self.down
    drop_table :<%= plural_name %>
  end
end
