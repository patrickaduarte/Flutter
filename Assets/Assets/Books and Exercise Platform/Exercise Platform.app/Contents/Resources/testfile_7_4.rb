expects_func "countdown(_:)", type: "(Int) -> ()"

values_for :_number, [1, 3, 5, 7, 10]

before <<-ERB
func sleep(_ time: Int) {
	print("sleep \\\(time)")
}
ERB


add_func_call "countdown(_:)", "<%= _number %>", print: false
html_hide [:input]

solution do |number|
	res = ""
	(1..number).to_a.reverse.each do |i|
		res += "#{i}\n"
		res += "sleep 1\n"
	end
	res += "GO!\n"
end


uid :x9164daee234d90aab5248e430b8400f6
