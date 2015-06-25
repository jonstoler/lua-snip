# lua snippets

Each snippet returns a function, so just `require` the file as whatever you want the function called.

	local split = require "string.split"

# Documentation

Written in [undoc](https://github.com/jonstoler/undoc) format:

	variablename:TYPE @DEFAULT = DESCRIPTION

## debug

### findlocal(loc, stackmod)

*returns the value for a local variable at the given scope level*

**loc:string = the name of the variable to find**  
**stackmod:number @0 = how far down the stack to search**

#### Example

	local var = "value1"
	local function f()
		local var = "value2"
		local function f()
			local var = "value3"
			print(findlocal("var"))    --> "value1"
			print(findlocal("var", 1)) --> "value2"
			print(findlocal("var", 2)) --> "value3"
		end
		f()
	end
	f()

## etc

### tpl(str, tbl)

*moonscript-like string templating with variables*

**str:string = the string to process**  
**tbl:table @_G = the table of values to include**

#### Example

	greeting = "hello"
	tpl("#{greeting}, world!") --> "hello, world!"

	local t = {greeting = "hi"}
	tpl("#{greeting} there!", t) --> "hi there!"

	local t = {greetings = {"hello", "howdy"}}
	tpl("#{t.greetings[1]}", t) --> "hello"

## math

### isnan(n)

*checks whether a number is `nan` or not*

**n:number = the number to check**

### lerp(a, b, t)

*interpolate between two values*

**a:number = the first value**  
**b:number = the second value**  
**t:number = how much to interpolate (0-1)**

## string

### split(str, delim)

*split a string by a delimiter*

**str:string = the string to split**  
**delim:string = the delimiter to use**

#### Example

	local s = "hello_there_friend"
	split(s, "_") --> {"hello", "there", "friend"}

## trim(str)

*remove leading and trailing whitespace from a string*

**str:string = the string to trim**

## table

### seq(min, max, by)

*create a sequence of numbers*

**min:number @1 = first number**  
**max:number = last number**  
**by:number @1 = how much to increment by**

#### Example

	seq(1, 5, 2) --> {1, 3, 5}
	seq(1, 3)    --> {1, 2, 3}
	seq(4)       --> {1, 2, 3, 4}

### serialize(table)

*serializes a table*

**table:table = the table to serialize**

#### Example

	serialize{month = "February", day = 2, year = 1993}
	--[[
	{
		["year"] = 1993,
		["day"] = 2,
		["month"] = "February",
	}
	--]]

	serialize{1, 2, 3}
	--[[
	{
		1,
		2,
		3,
	}
	--]]

### shuffle(table)

*rearranges a table randomly (only works on array-like tables)*

**tbl:table = the table to shuffle**

### sortBy(tbl, key)

*sorts a table by the value of a specific key (all elements of the table must be tables)*

**tbl:table = the table to sort**  
**key:string = the key to sort by**
