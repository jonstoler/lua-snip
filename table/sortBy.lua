return function(tbl, key)
	return table.sort(tbl, function(a, b)
		return (a[key] or 0) > (b[key] or 0)
	end)
end
