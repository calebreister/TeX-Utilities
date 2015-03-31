require('util')

--[[These functions define the sciPair type. A sciPair is a pair of numbers
    where the first represents a decimal value, and the second represents a
    power of 10.
]]

SciPair = {} --Defaults to 1E0 (see SciPair:new)
SciPair.__index = SciPair --Allows methods to be called using var:method()

function SciPair:new()
    local sp = setmetatable({1,0}, SciPair)
    return sp
end

function SciPair:set(str)
    --Separate a decimal value and its power of 10 within a string.
    local part = 1
    for i=1, #str do
        if str:at(i):match('[%d%.]') then
            self[part] = self[part] .. str:at(i)
        elseif str:at(i):match(' *[eE] *') then
            part = 2
        else
            error("invalid character")
        end
    end
    self[1] = tonumber(self[1])
    self[2] = tonumber(self[2])
end

function SciPair:eng()
    --[[I found this JS at http://www.rapidtables.com/convert/number/scientific-notation-converter.htm
        The "eng" variables are most useful.
        
        function Convert_Sci()
	    {
		    a = document.calcform.sci.value;
		    b = document.calcform.sci2.value;
		    b = parseInt(b);
		    dec = a*Math.pow(10,b);
	     	dec = roundnum(dec,10);
		    sign=""; if(b>=0) sign="+";
		    e = a+"e"+sign+b;
		    f = Math.floor( Math.log(Math.abs(a))*Math.LOG10E );
		    norm = a/Math.pow(10,f);
	     	norm = roundnum(norm,10);
		    norm2= parseInt(b)+f;
		    mod = norm2%3;
		    eng  = norm*Math.pow(10,mod);
	     	eng  = roundnum(eng,10);
		    eng2= norm2-mod;
		    if( Math.abs(eng)<1 )
		    {
			    eng*=1000;
			    eng2-=3;
		    }
	     	eng  = roundnum(eng,10);
		
		    document.calcform.dec.value = dec;
		    document.calcform.e.value = e;
		    document.calcform.norm.value = norm;
		    document.calcform.norm2.value = norm2;
		    document.calcform.eng.value = eng;
		    document.calcform.eng2.value = eng2;
	    }
    ]]
end

function SciPair:tostring(pre, post)
    if pre == nil then pre = 'E' end
    if post == nil then post = '' end
    return self[1] .. pre .. self[2] .. post
end

function SciPair:totex()
    return self:tostring("\\E{") .. "}"
end

