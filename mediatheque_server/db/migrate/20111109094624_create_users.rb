class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname_1
      t.string :surname_2
      t.string :nick
      t.string :password
      t.date :birthday
      t.string :country

      t.timestamps
    end
  end
end
