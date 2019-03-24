require 'minitest/spec'
require 'minitest/autorun'
require 'flagit/redactor'

class RedactorTest < Minitest::Test
  describe 'test_redactor' do
    def setup
      @lookout_mock, @commit_mock, @repository_mock, @remote_mock = Array.new(4, Minitest::Mock.new)

      @lookout_mock.expect(:repository, @repository_mock)
      @repository_mock.expect(:remote, @remote_mock)
      @remote_mock.expect(:url, '<commit_url>')
      @lookout_mock.expect(:last_commit, @commit_mock, [ { branch_name: nil } ])
      @commit_mock.expect(:sha, '<commit_sha>')
      @commit_mock.expect(:message, '<commit_message>')
    end

    def test_write_content
      Flagit::Lookout.stub :new, @lookout_mock do
        lookout = Flagit::Lookout.new
        redactor = Flagit::Redactor.new(lookout)
        assert_equal 'Text - <commit_message> <commit_url>', redactor.write_content('Text')
      end
      [@lookout_mock, @commit_mock, @remote_mock, @repository_mock].each(&:verify)
    end
  end
end
