values_for :N, [10, 8, 5, 15, 8]
values_for :leapYear, [2016, 2000, 2004, 996, 1568]

solution do |n,leapYear|
	result = ""

	nrLeapYears = 0
	while nrLeapYears < n
		isLeapYear = false
		if leapYear % 100 == 0
			isLeapYear = true if leapYear % 400 == 0
		else
			isLeapYear = true if leapYear % 4 == 0
		end
		if isLeapYear
			result += "#{leapYear}\n" if isLeapYear
		nrLeapYears += 1
		end
		leapYear += 1
	end

	result
end
uid :x4e173852a0c1f23f6d0f8d3d4bcdf8f0
