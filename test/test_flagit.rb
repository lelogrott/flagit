require 'minitest/spec'
require 'minitest/autorun'
require 'flagit'

class FlagitTest < Minitest::Test
  describe 'test_lookout' do
    def setup
      @lookout = MiniTest::Mock.new
      @lookout.expect(:last_commit, 'Some commit')
    end

    def test_last_commit
      lookout = Flagit::Lookout.new
      lookout.stub :last_commit, @lookout do
        assert_equal 'Some commit', @lookout.last_commit
      end
      @lookout.verify
    end
  end
end
