class AddVideoFieldsToMedia < ActiveRecord::Migration
  def change
    add_column :media, :director, :string, :default => nil, :null => true
    add_column :media, :duration, :integer, :default => nil, :null => true
    add_column :media, :cast, :text, :default => nil, :null => true
    add_column :media, :writer, :string, :default => nil, :null => true
    add_column :media, :composer, :string, :default => nil, :null => true
    add_column :media, :plot, :text, :default => nil, :null => true
  end
end
