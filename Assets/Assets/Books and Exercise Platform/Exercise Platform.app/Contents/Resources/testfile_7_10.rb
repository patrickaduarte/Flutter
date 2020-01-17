expects_func "parse(digit:)", type: "(String) -> Int"
expects_func "isNumber(_:)", type: "(String) -> Bool"
expects_func "parse(number:)", type: "(String) -> Int"

values_for :_string, [
	"a",
	"123",
	"1",
	"0",
	"",
	"50",
	"123a"
]


add_func_call :parse, "number: <%= s _string %>", print: true
html_hide [:input]

solution do |string|
	if string.to_i.to_s == string
		string.to_i
	else
		-1
	end
end


uid :x43fa1374423b2555fcb373db233094c9
