require 'minitest/spec'
require 'minitest/autorun'
require 'flagit/lookout'

class LookoutTest < Minitest::Test
  describe 'test_lookout' do
    def setup
      @lookout_mock = MiniTest::Mock.new
      @lookout_mock.expect(:last_commit, 'Some commit')
    end

    def test_last_commit
      Flagit::Lookout.stub :new, @lookout_mock do
        lookout = Flagit::Lookout.new
        assert_equal 'Some commit', lookout.last_commit
      end
      @lookout_mock.verify
    end
  end
end
