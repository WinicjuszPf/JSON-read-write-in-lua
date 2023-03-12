local Json = require("json")

local JsonStorage = {}

JsonStorage.saveTable = function(t, filename)
    local file = io.open(filename, "w")

    if file then
        local contents = Json.encode(t)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end

JsonStorage.loadTable = function(filename)
    local contents = ""
    local myTable = {}
    local file = io.open( filename, "r" )

    if file then
        -- read all contents of file into a string
        local contents = file:read( "*a" )
        myTable = Json.decode(contents);
        io.close( file )
        return myTable
    end
    return nil
end

return JsonStorage