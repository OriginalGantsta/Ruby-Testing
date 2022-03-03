def test_method(words)
    puts words
end

$episode_returns.generate_return(:test, method(:test_method))