values_for :location, [
	Tuple.new({x: 0, y: 0}),
	Tuple.new({x: 1, y: 1}),
	Tuple.new({x: -1, y: -1}),
	Tuple.new({x: 10, y: 11}),
	Tuple.new({x: 30, y: 30})
]

values_for :steps, [
	[:up, :up, :left, :down, :left],
	[:up, :up, :left, :down, :left, :up, :left, :right, :right, :down, :left],
	[:up, :up, :left, :right, :right, :down, :left, :left, :up, :left, :right],
	[:up, :up, :left, :down, :left, :up, :left, :right, :right, :down, :left],
	[:up, :up, :left, :right, :right, :down, :left, :left, :up, :left, :right]
]

solution do |location, steps|
	x, y = location.values

	steps.each do |step|
		if step == :up
			x += 1
		end
		if step == :down
			x -= 1
		end
		if step == :right
			y += 1
		end
		if step == :left
			y -= 1
		end
	end

	"(x: #{x}, y: #{y})\n"
end


uid :xdcc118e6c50bb00138487540f0680248
