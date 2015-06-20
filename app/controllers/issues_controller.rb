class IssuesController < ApplicationController
  def show
  	@issue=Issue.find(params[:id])
  end
	def destroy
  	issue = Issue.find(params[:id])
  	issue.destroy
  	redirect_to :root
	end
end
