class GithubSearchControllerController < ApplicationController
	def search 
		response = GithubSearch.seach(params[:q])
		render json: {repos: response}
	end		
end
