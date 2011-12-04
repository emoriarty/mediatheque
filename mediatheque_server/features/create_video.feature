Feature: Create video

  So users can manage videos and browse them
  As a user
  I can create a video-movie
	
	@pending
	Scenario: Create a video
		Given me as a user who wants create a new video
		When I create a video with title Alien
		Then Alien should be in my videos list