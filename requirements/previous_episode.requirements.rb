#previous_episode tests an array of episode keys to see if it contains the user's previous episode

@requirement_test_definitions[:previous_episode] = -> (previous_episodes){  
        return previous_episodes.include?(@user[:previous_episode])
}