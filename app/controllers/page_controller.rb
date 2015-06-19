class PageController < ApplicationController
	def welcome
  		@issues  = [ { title: "Ruby lovers", comments: "4" }, { title: "Rails and Laravel", comments: "5" } ]
  	end

	def about
	end

end