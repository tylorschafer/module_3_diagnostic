class SearchController < ApplicationController

  def index
    render locals: {
      facade: PhoneixMembersSearch.new(params[:house])
    }
  end
end
