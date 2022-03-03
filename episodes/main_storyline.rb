$main_storyline = Series.new
$main_storyline.write_episode(1, "Type 2", {"2" => {:continue_episode => 2, :test => "Okay here we go"}}, {:completed_episodes => [2,3,1]})
$main_storyline.write_episode(2, "Type \"q\" to save and quit", {}, {:completed_episodes => [2,3], :previous_episode => [4] })
$main_storyline.write_episode(3, "Type 7", {"7"=>{:continue_episode => 4}}, {:completed_episodes => [2,3], :previous_episode => [3]})
$main_storyline.write_episode(4, "Type 8", {"8"=>{:continue_episode => 1}}, {:completed_episodes => [1,2,3,9]})
