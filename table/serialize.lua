return function(table)
	local level = 1
	local out = ""
	
	local function indent()
		local l = (level >= 0 and level or 0)
		return string.rep("\t", l)
	end

	local function process(tbl)
		for k, v in pairs(tbl) do
			if type(v) == "table" then
				if type(k) == "number" then
					out = out .. indent() .. "{" .. "\n"
				else
					out = out .. indent() .. '["' .. k .. '"]' .. " = {" .. "\n"
				end
				level = level + 1
				out = process(v)
				out = out .. indent() .. "}" .. ",\n"
			else
				if type(k) == "number" then
					out = out .. indent()
				else
					out = out .. indent() .. '["' .. k .. '"]' .. " = "
				end
				if type(v) == "string" then
					if v:match("\n") then
						out = out .. '[[' .. tostring(v) .. ']]'
					else
						out = out .. '"' .. tostring(v):gsub('"', '\\"') .. '"'
					end
				else
					out = out .. tostring(v)
				end
				out = out .. ",\n"
			end
		end
		level = level - 1

		return out
	end

	process(table)
	out = "{\n" .. string.sub(out, 1, -2) .. "\n}"
	return out
end
