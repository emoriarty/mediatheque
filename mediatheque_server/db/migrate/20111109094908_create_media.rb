class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title, :null => false
      t.string :path
      t.string :file
      t.string :file_type
      t.string :cover, :default => nil, :null => true
      t.integer :year, :default => nil, :null => true
      t.integer :user_id, :null => false
      
      t.timestamps
    end
  end
end
