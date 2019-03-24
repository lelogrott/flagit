class Flagit::Redactor

  attr_accessor :lookout

  def initialize(lookout)
    @lookout = lookout
  end

  def write_content(message, options: { add_commit: { url: true, message: true } } )
    message if options[:add_commit].nil?
    last_commit = @lookout.last_commit(branch_name: options[:branch])
    message += " -"
    message += " #{last_commit.message}" if (options[:add_commit][:message])
    commit_url = @lookout.repository.remote.url.gsub('.git',"/commit/#{last_commit.sha}")
    message += " #{commit_url}" if options[:add_commit][:url]
  end
end