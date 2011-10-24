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
  
  class ServiceInfo < ActiveResource::Base 
    AMAZON = { :private_key => 'uNnTg1COfbkynBvQ8Clc9DMNedI9tt0oXGTpNC6e', :public_key => 'AKIAIP5HAFQTSV257XEQ' }
  end
end
