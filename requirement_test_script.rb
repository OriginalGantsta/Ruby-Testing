require_relative "requirements/@requirements.rb"


requirements = {:previous_episode => [3, 4, 5, nil], :completed_episodes => [1,2,3]}
puts requirement_tester(requirements = requirements)