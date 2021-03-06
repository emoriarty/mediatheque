shared_context "shared video attributes" do
  before :each do 
    @attr = { 
      :title => "alien (1979)", 
      :path => "/home/enrique-arias/Videos", 
      :file => "alien (1979).avi", 
      :year => "1979", 
      :file_type => Video.to_s,
      :plot => "When commercial towing vehicle Nostromo, heading back to Earth, intercepts an SoS signal from a nearby planet, the crew are under obligation to investigate. After a bad landing on the planet, some crew members leave the ship to explore the area. At the same time as they discover a hive colony of some unknown creature, the ship's computer deciphers the message to be a warning, not a call for help. When one of the eggs is disturbed, the crew do not know the danger they are in until it is too late.",
      :duration => 5000,
      :director => "Ridley Scott",
      :writer => "Dan O'Bannon",
      :cast => "Sigourney Weaver, John Hurt, Yaphet Kotto, Tom Skerritt, Veronica Cartwright, Harry Dean Stanton, Ian Holm",
      :composer => "Jerry Goldsmith"
    }
  end
end
