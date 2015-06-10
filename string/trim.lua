return function(l)
	return l:gsub("^%s*(.-)%s*$", "%1")
end
