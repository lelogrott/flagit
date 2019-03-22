# The main Lookout driver
class Flagit::Lookout
  require 'git'
  require 'logger'

  attr_accessor :path, :repository

  def initialize(path = '.')
    @path = path
    @repository = Git.open(path)
  end

  def last_commit(branch_name: nil, commit_depth: 20)
    branch = find_branch_by_name(branch_name)
    @repository.log(commit_depth).select { |c| branch.contains? c.sha }.first
  end

  def find_branch_by_name(branch_name)
    return current_or_master unless branch_is_remote(branch_name)
    @repository.branches[branch_name]
  end

  private

  def current_or_master
    branch = @repository.branches.select { |b| b.current && branch_is_remote(b.name) }.first
    return branch unless branch.nil?
    @repository.branches['master']
  end

  def branch_is_remote(branch_name)
    !branch_name.nil? && 
    !(%w(branch_name) & (@repository.branches.remote.collect(&:name))).empty?
  end
end
