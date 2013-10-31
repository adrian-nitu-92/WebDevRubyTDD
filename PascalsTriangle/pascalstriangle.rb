def compute_row(n)
	return nil unless n.class == Fixnum
	ans = [1]
	i = 1
	cur = []
	
	(n-1).times do
		cur = ans.dup
		for x in (1..cur.size-1)
			ans[x] = cur[x-1] + cur[x]
		end
		ans.push(1)
	end
	ans
end
