require 'minitest/spec'
require 'minitest/autorun'
require 'flagit'

class FlagitTest < Minitest::Test
  describe 'test_lookout' do
    def setup
      @lookout = MiniTest::Mock.new
      @lookout.expect(:list_commits, 'Some commit', ['path'])
    end

    def test_list_commits
      lookout = Flagit::Lookout.new
      lookout.stub :list_commits, @lookout do
        assert_equal 'Some commit', @lookout.list_commits('path')
      end
      @lookout.verify
    end
  end
end
