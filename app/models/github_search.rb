class GithubSearch
	URL = "https://api.github.com/search/repositories?q="
	def self.search(query)
		url = URL+query
		response = RestClient.get url
		repos = JSON.parse(response)["items"]
		serialized_reponse = repos.map{|a| { id: a['id'], owner: a['owner']['login'], name: a['name'], forks_count: a['forks_count'], 
			stars: a['stargazers_count'], imported: !(Import.find_by(repo_name: a['name'], owner: a['owner']['login']).nil?) } }

	end

	def self.import(params)
		begin
			owner = params[:owner]
			repo_name = params[:repo_name]
			url = "https://raw.githubusercontent.com/#{owner}/#{repo_name}/master/package.json"
			puts url
			response = RestClient.get url
			parsed = JSON.parse(response)
			self.create_packages(parsed)
			Import.find_or_create_by(repo_name: repo_name, owner: owner)
		rescue
			nil
		end	
	end

	def self.create_packages(res)
		dependencies = res['dependencies']
		dependencies.keys.each do |key|
			package = Package.find_or_create_by(name: key)
			package.increment(:count)
			package.save!
		end
		
		devDeps = res['devDependencies']
		devDeps.keys.each do |key|
			package = Package.find_or_create_by(name: key)
			package.increment(:count)
			package.save!
		end
	end

end	