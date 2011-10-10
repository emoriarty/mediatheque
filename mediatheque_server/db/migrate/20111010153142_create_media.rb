class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :path
      t.string :file
      t.string :file_type
      t.integer :year, :default => nil, :null => true
      t.text :description, :default => nil, :null => true

      t.timestamps
    end
  end
end
