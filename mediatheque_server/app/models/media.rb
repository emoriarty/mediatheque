class Media < ActiveRecord::Base
  validates :title, :presence => true
  validates :path, :presence => true
  validates :file, :presence => true
  validates :title, :presence => true
  validates :file_type, :presence => true
end
