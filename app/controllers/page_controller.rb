class PageController < ApplicationController
	def welcome
  		@issues  = Issue.all
  	end

	def about
	end

end