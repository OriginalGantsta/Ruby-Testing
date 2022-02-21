#completed_episodes tests an array of episode keys to see if the user has completed those episodes

@requirement_test_definitions[:completed_episodes] = -> (completed_episodes){
    if @user[:completed_episodes].length > 0
        for episode in completed_episodes
            if !@user[:completed_episodes].include?(episode)
                return false
            end
        end
    else
        return false
    end
    return true
}