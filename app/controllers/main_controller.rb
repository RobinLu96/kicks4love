class MainController < ApplicationController

	def index
		@post = Post.all.order(:created_at => :DESC)
	end

	def features
		render "features"
	end

	def oncourt
		render "oncourt"
	end

	def release
		render "release"
	end

	def trend
		render "trend"
	end


end
