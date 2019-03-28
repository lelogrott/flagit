require 'minitest/spec'
require 'minitest/autorun'
require 'flagit/postman'

class PostmanTest < Minitest::Test
  describe 'test_postman' do
    def setup
      @twitter_client_mock = MiniTest::Mock.new
      @twitter_client_mock.expect(:update, true, ["This is a tweet!"])
      @twitter_oauth_mock = MiniTest::Mock.new
      @twitter_oauth_mock.expect(:run_auth_process, true)
    end

    def test_tweet
      Flagit::TwitterOAuth.stub :new, @twitter_oauth_mock do
        Twitter::REST::Client.stub :new, @twitter_client_mock do
          assert Flagit::Postman.tweet('This is a tweet!')
        end
      end
      @twitter_client_mock.verify
      @twitter_oauth_mock.verify
    end
  end
end
