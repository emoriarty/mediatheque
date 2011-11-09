module MultiMedia
  class Media < ActiveRecord::Base
    # has_and_belongs_to_many :genres
    acts_as_taggable
    acts_as_taggable_on :genres
     
    validates :title, :presence => true
    validates :path, :presence => true,
      :uniqueness => { :scope => :file_type }
    validates :file, :presence => true
    validates :title, :presence => true
    validates :file_type, :presence => true
  end
end
