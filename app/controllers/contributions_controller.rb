class ContributionsController < ApplicationController
  def index
    # https://api.github.com/search/issues?q=state%3Aclosed+author%3Arandallreedjr+type%3Apr
    @contributions = GithubSearch.new.search
  end
end
