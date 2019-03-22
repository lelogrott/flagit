class Flagit::Redactor

  attr_accessor :lookout

  def initialize(path = '.')
    @lookout = Flagit::Lookout.new(path)
  end

  def write_content(message, options: { add_commit: { url: true, message: true } } )
    message unless options[:add_commit].present?
    message << " -"
    message << " #{@lookout.last_commit(options[:branch]).message}" if (options[:add_commit][:message])
    commit_url = @lookout.remote.url.gsub('.git',"/commit/#{@lookout.last_commit(branch_name: options[:branch]).sha}")
    message << " #{commit_url}" if options[:add_commit][:url]
  end
end