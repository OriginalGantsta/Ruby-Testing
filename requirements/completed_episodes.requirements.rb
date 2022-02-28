#completed_episodes tests an array of episode keys to see if the user has completed those episodes

def completed_episodes_judge(completed_episodes)
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
end

Requirement.new(:completed_episodes, method(:completed_episodes_judge))