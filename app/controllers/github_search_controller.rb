class GithubSearchController < ApplicationController

	def search 
		response = GithubSearch.search(params[:q])
		render json: {repos: response}
	end	

	def import
		GithubSearch.import(params)
		render json: {status: "200"}
	end

	def packages
		packages = Package.order('count desc').limit(10)
		render json: {packages: packages}
	end	
		
end
