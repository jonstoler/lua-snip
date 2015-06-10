return function(min, max, by)
	by = by or 1
	if min and not max then
		min, max = 1, min
	end

	local t = {}
	for i = min, max, by do
		table.insert(t, i)
	end

	return t
end
