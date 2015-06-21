class PageController < ApplicationController
	def welcome
  		@issues  = Issue.all.reverse
  	end

	def about
	end

end