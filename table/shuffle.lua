return function(tbl)
	local count = #tbl
	local j

	for i = count, 2, -1 do
		j = math.random(i)
		tbl[i], tbl[j] = tbl[j], tbl[i]
	end
end
