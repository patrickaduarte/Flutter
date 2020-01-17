expects_func "repeatPrint(message:count:)", type: "(String, Int) -> ()"

values_for :message, ["+", "-", "*", "()", "@"]
values_for :cnt,    [1,     3,   5,    7, 10]

add_func_call :repeatPrint, "message: <%= s message %>, count: <%= cnt %>", print: false
html_hide [:input]

solution do |message, cnt|
	message * cnt + "\n"
end


uid :xd7bc6255d5faa6a5aa5f5c09626a8938
