values_for :a, [1, 12, 123, 567, 100]

solution do |a| 
	a % 10
end

html do |a, run_info|
	"The last digit of #{a} is #{run_info[:output]}"
end
uid :x5e35a768b5f881551ec71f87791f87a1
