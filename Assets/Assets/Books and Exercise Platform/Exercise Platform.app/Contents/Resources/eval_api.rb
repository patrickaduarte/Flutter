require 'net/http'
require 'json'


def eval_url
	eval_api = "http://127.0.0.1"
	eval_port = 1338

	if File.exists? "Book.json"
		info = JSON.parse(open("Book.json").read)
		eval_port = info["evalPort"]
	end

	"#{eval_api}:#{eval_port}"
end

def eval_online?
	begin
		info = nil
		thread = Thread.new do 
			url = "#{eval_url}/api/status".force_encoding("utf-8")
			uri = URI(url)
			req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
			req.body = {}.to_json
			res = Net::HTTP.start(uri.hostname, uri.port) do |http|
			  http.request(req)
			end
		end
		
		info = JSON.parse(res.body)

		info != nil and info["status"] == "online"
	rescue Exception => e 
		false
	end
end

def eval_did_solve? exerciseid
	begin
		info = nil
		thread = Thread.new do 
			uri = URI("#{eval_url}/api/status/#{exerciseid}")
			req = Net::HTTP::Post.new(uri)
			# req.body = {}.to_json
			res = Net::HTTP.start(uri.hostname, uri.port) do |http|
			  http.request(req)
			end
			
			info = JSON.parse(res.body)
		end
		thread.join

		info != nil and info["solved"] == true
	rescue Exception => e 
		false
	end
end

def eval_code_for exerciseid
	begin
		uri = URI("#{eval_url}/api/code/#{exerciseid}")
		req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
		req.body = {}.to_json
		res = Net::HTTP.start(uri.hostname, uri.port) do |http|
		  http.request(req)
		end
		
		info = JSON.parse(res.body)

		info["code"] || info
	rescue Exception => e 
		""
	end
end

# puts eval_did_solve?(:xc2b2668c93bac8799642ed5ba735c644)

# puts eval_online?
