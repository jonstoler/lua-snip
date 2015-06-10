return function(loc, stackmod)
	local stack, idx = 1, 1
	while true do
		local d = debug.getinfo(stack)
		if d.what == "main" then break end
		stack = stack + 1
	end
	
	stack = stack - (stackmod or 0)

	while idx do
		local k, v = debug.getlocal(stack, idx)
		if k == loc then return v end
		idx = k and idx + 1 or nil
	end

	return nil
end
