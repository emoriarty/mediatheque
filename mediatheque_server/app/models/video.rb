class Video < Media
  TYPES = [:avi, :mkv, :mp4, :ogv]
  
  has_attached_file :cover, :styles => { 
    :main_list => "183x260#", 
    :list => "130x198#",
    :thumb => "100x100>" 
  }

  def cover_main_list
    cover.url(:main_list)
  end

  def cover_list
    cover.url(:list)
  end
end
# == Schema Information
#
# Table name: media
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  path       :string(255)
#  file       :string(255)
#  file_type  :string(255)
#  cover      :string(255)
#  year       :integer
#  user_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#  director   :string(255)
#  duration   :integer
#  cast       :text
#  writer     :string(255)
#  composer   :string(255)
#  plot       :text
#

