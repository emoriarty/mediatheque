class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, :null => false
      t.string :media_type, :null => false
      
      t.timestamps
    end
  end
end
