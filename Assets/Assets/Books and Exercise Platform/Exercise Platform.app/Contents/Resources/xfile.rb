require 'securerandom'
require './store.rb'

class Xfile 

	attr_accessor :_name, 
				  :_uid, 
				  :_requires,
				  :_succedes,
				  :_make_code,
				  :achievements

	def initialize filepath
		self._name = "<untitled exercise>"
		self._uid = "x#{SecureRandom.hex}".to_sym
		self._requires = []
		self.achievements = []
		self._succedes = nil
		self._make_code = nil 

		xfile_data = open(filepath).read

		# migrate old id/uid notation
		if xfile_data[/^id :x[0-9a-f]{32}/]
            xfile_data[/^id :x/] = "uid :x"

            File.open(filepath, "w") do |file|
                file << xfile_data
            end
        end

        # check for uid 
		unless xfile_data[/uid :x[0-9a-f]{32}/]
			xfile_data += "\nuid #{self._uid.inspect}\n"

			File.open(filepath, "w") do |file|
				file << xfile_data
			end
		end

		instance_eval(xfile_data)
	end


	def name iname
		self._name = iname
	end

	def uid iuid
		self._uid = iuid
	end

	def requires irequires
		self._requires << irequires
	end

	def succedes isuccedes
		self._succedes = isuccedes
        requires isuccedes
	end

	def achievement name, message, image = nil
		image ||= name 

		self.achievements << {
			name: name,
			message: message,
			image: image
		}
	end

	def make_code &imake_code
		self._make_code = imake_code
	end

	def start_code 
		return "" unless self._make_code

		requires_info = self._requires.map { |exercise_id| 
			store_get_exercise_info exercise_id
		}
		succedes_info = {}

		if self._succedes
			succedes_info = store_get_exercise_info self._succedes
		end

		self._make_code.call(requires_info, succedes_info)
	end
    
    def can_open?
        requires_info = self._requires.map { |exercise_id|
            store_get_exercise_info exercise_id
        }.inject(true) { |r, info|
            r && (info[:solved] == true)
        }
    end


	def to_hash
		{
			name: self._name,
			uid: self._uid,
			requires: self._requires,
			succedes: self._succedes,
			makeCode: self._make_code,
			achievements: self.achievements
		}
	end
    
    def get_info
        {
            name: self._name,
            uid: self._uid,
            requires: self._requires.map { |exercise_id|
                store_get_exercise_info exercise_id
            },
            succedes: store_get_exercise_info(self._succedes),
            startCode: start_code,
            can_open: can_open?,
			achievements: self.achievements
        }
    end

end


