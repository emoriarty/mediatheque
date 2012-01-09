namespace :db do
  desc "Change the deafult slug field for the title slugged."
  task :friendly_ids => :environment do
    videos = Video.where(['slug = ?', 'missing'])

    videos.each do |video|
      video.save
    end
  end
end