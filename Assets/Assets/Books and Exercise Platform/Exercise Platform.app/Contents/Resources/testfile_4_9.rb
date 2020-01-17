values_for :N, [2, 4, 6, 8, 10]

solution do |n|
	result = ""
	
	n.times do |i|
		result += " " * (n - i - 1)
		result += "*" * (2 * (i + 1) - 1)
		result += "\n"
	end

	(n - 1).times do |i|
		result += " " * (i + 1)
		result += "*" * (2 * (n - i - 1) - 1)
		result += "\n"
	end

	result
end
uid :xadabcb7b9cc66f2277a6b56d3baa978b
