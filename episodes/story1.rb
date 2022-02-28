Episode.new(1, "Type 2", {"2" => {:continue_episode => 2}}, {:completed_episodes => [2,3,8]})
Episode.new(2, "Type \"q\" to save and quit", {}, {:completed_episodes => [2,3], :previous_episode => [4] })
Episode.new(3, "Type 7", {"7"=>{:continue_episode => 4}}, {:completed_episodes => [2,3], :previous_episode => [3]})
Episode.new(4, "Type 8", {"8"=>{:continue_episode => 1}}, {:completed_episodes => [1,2,3]})