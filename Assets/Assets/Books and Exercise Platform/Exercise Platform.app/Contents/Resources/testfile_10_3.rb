expects_enum :HandShape, [
	:rock,
	:paper,
	:scissors
]

expects_enum :MatchResult, [
	:win,
	:draw,
	:lose
]

expects_func "match(first:second:)", type: "(HandShape, HandShape) -> MatchResult"

values_for :first, [
	:rock,
	:paper,
	:scissors,
	:rock,
	:paper
]

values_for :second, [
	:rock,
	:rock,
	:scissors,
	:scissors,
	:paper
]

add_func_call :match, "first: <%= s first %>, second: <%= s second %>", {
	print: true,
	call: "toString(match(first: <%= s first %>, second: <%= s second %>))",
	setup: <<-EOF
		func toString(_ result: MatchResult) -> String {
			if result == .win {
				return ".win"
			} 
			if result == .lose {
				return ".lose"
			} 
			if result == .draw {
				return ".draw"
			} 

			return ""
		} 
	EOF
}

html_hide [:input]

solution do |first, second|
	sol = :draw

	if first != second 
		sol = :lose

		if first == :rock and second == :scissors
			sol = :win
		end

		if first == :paper and second == :rock
			sol = :win
		end

		if first == :scissors and second == :paper
			sol = :win
		end
	end

	s sol
end

uid :x4486027c3f893052e2f021c40e151a35
