values_for :N, [2, 5, 6, 9, 10]

solution do |n|
	result = ""
	(n / 2).times do |i|
			result += "#{i + 1}\n"
			result += "#{n - i}\n"
	end
	if (n % 2 == 1)
		result += "#{n / 2 + 1}\n"
	end

	result
end

uid :xfd6615786c01b0b26184846bfb370e48
