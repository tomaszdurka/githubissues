module GithubIssuesCli
  class Command::Comment < Command

    parameter 'body', 'comment body', :attribute_name => :body

    def execute
      github_repo = get_upstream_repo
      issue_number = get_issue_number
      Github::Client::Issues.new.comments.create :user => github_repo[:user], :repo => github_repo[:name], :issue_id => issue_number, :body => body
      print on_green ' '
      puts ' Comment added'
    end
  end
end
