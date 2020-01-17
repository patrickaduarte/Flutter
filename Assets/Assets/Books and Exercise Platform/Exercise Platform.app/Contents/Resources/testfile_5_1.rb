values_for :firstName, ["Andrei", "Claudiu"  , "Chris",   "Steve"]
values_for :lastName,  ["Puni",   "Cerghizan", "Lattner", "Jobs"]

expects_value :fullName do |firstName, lastName|
	firstName + " " + lastName
end

html_hide [:your_var, :expected_var]

html_add "Your Result" do |firstName, lastName, run_info|
	info = run_info[:info]
	syntaxHighlight("\"#{info["fullName"]}\"")
end

html_add "Expected Result" do |firstName, lastName|
	syntaxHighlight("\"#{firstName + " " + lastName}\"")
end


has_no_output
uid :x43688ab9743e30974227e6f9a94245f4
