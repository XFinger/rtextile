ActiveRecord::Schema.define(:version => 0) do

     create_table :<%= plural_name %>  do |t|
      t.string :<%= title %>
      t.text :<%= doc %>
      t.datetime  :created_at
      t.datetime  :updated_at
    end

    add_index :<%= plural_name %>, [:<%= title %>]

end

 