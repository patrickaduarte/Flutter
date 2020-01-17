require 'json'
require './eval_api.rb'

# the purpose of the store is to remember user information
# things like if a problem was solved or not and with what code
# we use this to force a certain order/path in solving the exercises
# we also use this in order to generate the start code for some problems
# for example the list problems require the user to solve 

STORE_PATH = "#{File.dirname __FILE__}/.eval"
JSON_STORE_PATH = "#{STORE_PATH}/store"

unless File.exists? STORE_PATH
	`mkdir '#{STORE_PATH}'`
end

unless File.exists? JSON_STORE_PATH
	`echo '{}' > '#{JSON_STORE_PATH}'`
end


def path_for_exercise exercise_id
	"#{STORE_PATH}/#{exercise_id}.swift"
end

def save_code_for exercise_id, code 
	File.open(path_for_exercise(exercise_id), "w+") do |file|
		file << code 
	end
end

def get_code_for exercise_id
	if File.exists? path_for_exercise(exercise_id)
		open(path_for_exercise(exercise_id)).read
	else 
		if eval_online?
			eval_code_for exercise_id
		else
			nil
		end
	end		
end

def store
	JSON.parse(open(JSON_STORE_PATH).read)
end

def store_set key, value
	new_store = store
	new_store[key] = value 
	File.open(JSON_STORE_PATH, "w+") do |file|
		file << JSON.pretty_generate(new_store)
	end
end

def store_get key 
	store[key]
end

def store_get_exercise_info exercise_id
    return {} if exercise_id == nil
    
	s = store_get("exercise_#{exercise_id}") || {}

	s = Hash[s.map { |k, v|
		[k.to_sym, v]
	}]

	# default values
	s[:uid] ||= exercise_id
	s[:code] ||= get_code_for exercise_id
	s[:solved] ||= false 

	# looks for mac app and gets data from there
	if eval_online?
		s[:code] = eval_code_for exercise_id
		s[:solved] = eval_did_solve? exercise_id
	end

	store_set "exercise_#{exercise_id}", s 

	s
end

def solved_exercise exercise_id
	ex = store_get_exercise_info exercise_id
	ex[:solved] = true 
	ex[:code] = get_code_for exercise_id 
	store_set "exercise_#{exercise_id}", ex 
end

def solved_exercise? exercise_id
	store_get_exercise_info(exercise_id)[:solved]
end
