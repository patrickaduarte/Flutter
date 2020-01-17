values_for :problem, [
	"find the longest word in the problem description",
	"we heart swift",
	"I like solving problems with this platform",
	"oneword"
]

solution do |problem|
	res = ""

	problem.split.each do |word|
		if word.length > res.length
			res = word
		end
	end

	res
end

uid :x430cd04edf1dc841e495442af6d9adbb
