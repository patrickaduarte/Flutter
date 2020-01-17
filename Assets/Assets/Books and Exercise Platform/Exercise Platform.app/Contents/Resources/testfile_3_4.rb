values_for :number, [5.1517,10.0,3.3,6.3243,1.51345]


expects_value :roundedNumber do |number|
	(number * 10).to_i / 10.0
end

has_no_output

uid :x1eb3def5b7a8eb2c12905bfc57aa47d4
