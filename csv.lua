--To include this file, use
--dofile('csv.lua')

--[[ Test data
a,b,c
d,2,3
e,4,5
]]

--Extends string type by allowing index selection via at(index) method.
--Can be called as s:at(index)
function string.at(self,index)
    return self:sub(index,index)
end

--Function to convert a *SV file to a Lua array
--file: the name of the file to read
--delim: the delimeter (usually ',')
function dataToTable(file, delim)
    file = io.open(file) --Always ensures that the file is in its beginning position
    local data = {}
    local row = 1
    for current in file:lines() do --file:lines() returns a string
        data[row] = {} --Initialize array within array (make 2d)
        local col = 1 --Used for adding individual columns of data
        data[row][col] = ""
        for ch in current:gmatch('.') do --ch is a character in the string
            if ch == delim then
                col = col + 1
                data[row][col] = "" --initialize string in new column
            else
                data[row][col] = data[row][col] .. ch
            end
        end
        row = row + 1
    end
    file:close()
    return data
end

function tableToTeX(array)
    local result = ""
    for y=1, #array do
        for x=1, #array[y] do
            result = result .. array[y][x]
            if x < #array[y] then
                result = result .. " & "
            end
        end
        result = result .. " \\\\\n"
    end
    return result
end
