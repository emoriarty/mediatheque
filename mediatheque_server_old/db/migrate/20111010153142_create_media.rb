class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :path
      t.string :file
      t.string :file_type
      t.string :cover, :default => nil, :null => true
      t.integer :year, :default => nil, :null => true
      t.text :plot, :default => nil, :null => true

      t.timestamps
    end
  end
end
