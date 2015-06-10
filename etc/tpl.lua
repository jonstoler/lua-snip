return function(str, tbl)
	tbl = tbl or _G
	return (str:gsub("%#{(.-)%}", function(key)
		local current = tbl
		for match in (key .. "."):gmatch("(.-)%.") do
			current = current[match]
			if not current then return "" end
		end
		return current
	end))
end
