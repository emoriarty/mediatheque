module MultiMedia
  class Genre < ActiveRecord::Base
    has_and_belongs_to_many :videos
    
    validates :name, :presence => true,
      :uniqueness => { :scope => :media_type }
    validates :media_type, :presence => true,
      :uniqueness => true
  end
end
