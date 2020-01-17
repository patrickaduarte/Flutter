values_for :N, [2, 4, 6, 8, 10]

solution do |n|
	result = ""
	a = 1
	b = 0
	n.times do
		result += "#{a}\n"
		a,b = a + b, a
	end

	result
end
uid :xd8a1a7f5f2decbb3a7473f3bf659199a
