require 'minitest/spec'
require 'minitest/autorun'
require 'flagit'

class FlagitTest < Minitest::Test
  describe 'test_flagit' do
    def setup
      @flagit_mock = MiniTest::Mock.new
      @flagit_mock.expect(:run, 'Text - <commit_message> <commit_url>', ['Text'])
    end
    def test_run
      Flagit.stub :run, @flagit_mock.run('Text') do
        assert_equal 'Text - <commit_message> <commit_url>', Flagit.run('Text')
      end
      @flagit_mock.verify
    end
  end
end
