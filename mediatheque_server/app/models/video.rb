class Video < Media
  TYPES = [:avi, :mkv, :mp4, :ogv]
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

