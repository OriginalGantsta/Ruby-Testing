def previous_episode_judge(previous_episodes)
        previous_episodes.include?(@user[:previous_episode])
end
     
$requirements.define_requirement(:previous_episode,  method(:previous_episode_judge))