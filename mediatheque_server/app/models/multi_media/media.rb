module MultiMedia
  class Media < ActiveRecord::Base
    validates :title, :presence => true,
      :uniqueness => { :scope => :file_type, :case_sensitive => false }
    validates :path, :presence => true,
      :uniqueness => { :scope => :file_type }
    validates :file, :presence => true
    validates :title, :presence => true
    validates :file_type, :presence => true
  end
end
