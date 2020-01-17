values_for :N, [2, 4, 6, 8, 10]

solution do |n|
	result = ""
	n.times do |i|
		result += "#{(i + 1) * (i + 1)}\n"
	end

	result
end

uid :xdb3a4e1873d4cf7fb47724c862d8384d
