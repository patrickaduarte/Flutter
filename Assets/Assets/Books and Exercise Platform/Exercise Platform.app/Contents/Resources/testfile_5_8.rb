values_for :N, [2, 4, 6, 8, 1]
values_for :M, [1, 3, 2, 5, 10]

expects_function_call "*", "You did not use the magic * operator"
expects_function_call_count ["print"], 1, "You have to use exactly one call to <code>print</code>"

solution do |n, m|
	("*" * m + "\n") * n
end

uid :xe4af4144391a78193fd1c4ff1ccb9917
