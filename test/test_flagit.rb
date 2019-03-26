require 'minitest/spec'
require 'minitest/autorun'
require 'flagit'

class FlagitTest < Minitest::Test
  describe 'test_flagit' do
    def setup
      @flagit_mock = MiniTest::Mock.new
      @flagit_mock.expect(:hi, 'Text - <commit_message> <commit_url>', ['Text'])
    end
    def test_hi
      Flagit.stub :run, @flagit_mock do
        assert_equal 'Text - <commit_message> <commit_url>', @flagit_mock.hi('Text')
      end
      @flagit_mock.verify
    end
  end
end
