return function(str, delim)
	if str == "" then return {} end
	local result = {}
	local append = delim
	if delim:match("%%") then
		append = delim:gsub("%%", "")
	end
	for match in (str .. append):gmatch("(.-)" .. delim) do
		table.insert(result, match)
	end
	return result
end
