class AddSlugToMedia < ActiveRecord::Migration
  def change
    add_column :media, :slug, :string, :null => false, :default => "missing"
  end
end
