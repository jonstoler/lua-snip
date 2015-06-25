return function(str, tbl)
	tbl = tbl or _G
	return (str:gsub("%#{(.-)%}", function(key)
		local current = tbl
		for match in (key .. "."):gmatch("(.-)%.") do
			if match:match("(.-)%[(.-)%]") then
				local t, key = match:match("(.-)%[(.-)%]")
				current = current[t] or {}
				current = current[tonumber(key)]
			else
				current = current[match]
			end
			if not current then return "" end
		end
		return current
	end))
end
