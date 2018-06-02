class ApplicationController < ActionController::API
		# before_action :cors_preflight_check
	# after_action :set_cors 

	def cors_preflight_check
	  if request.method == :options
	    headers['Access-Control-Allow-Origin'] = '*'
	    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
	    headers['Access-Control-Allow-Headers'] = '*'
	    headers['Access-Control-Max-Age'] = '1728000'
	    render :text => '', :content_type => 'text/plain'
	  end
	end


	def set_cors
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
	end

end
