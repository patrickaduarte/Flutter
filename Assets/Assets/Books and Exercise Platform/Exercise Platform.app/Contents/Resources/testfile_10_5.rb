values_for :moneyArray, [
	[
		Tuple.new([10, :penny]),  
		Tuple.new([15, :nickle]),  
		Tuple.new([3,  :quarter]),  
		Tuple.new([20, :penny]),  
		Tuple.new([3,  :dime]),  
		Tuple.new([7,  :quarter])
	],
	[
		Tuple.new([23,  :dime]),  
		Tuple.new([33,  :quarter]),  
		Tuple.new([12, :penny]),  
		Tuple.new([35, :nickle]),  
		Tuple.new([27, :penny]),  
		Tuple.new([13,  :quarter])
	]

]

@_coinValues = {
	:penny => 1,
	:nickle => 5,
	:dime => 10,
	:quarter => 25
}

solution do |moneyArray|
	total = 0

	moneyArray.each do |info|
		cnt, type = info.data

		total += @_coinValues[type] * cnt
	end

	s total
end
uid :xffe46ed7922e13fb8835c236c95f96b6
