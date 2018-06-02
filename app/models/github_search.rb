class GithubSearch
	URL = "https://api.github.com/search/repositories?q="
	def self.search(query)
		url = URL+query
		response = RestClient.get url
		repos = JSON.parse(response)["items"]
		serialized_reponse = repos.map{|a| { id: a['id'], full_name: a['full_name'], forks_count: a['forks_count'], stars: a['stargazers_count']} }
	end	
end	