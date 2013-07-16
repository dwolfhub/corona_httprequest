# HTTP Request Library

#### File Name
requesthttp.lua

#### Note

The HTTP request is asynchronous and therefore callback functions must be entered in order to process the data when it comes back.

The onError callback is run when the flag isError that comes back with the request is marked true. Status codes are ignored. If you need to consider a 404 status code an error for example, place that logic in your onSuccess callback function.

## RequestHttp:send(endPoint, method, queryString, onSuccess, onError)

#### Parameters
> - endPoint (string) the URL that the request should go to
> - method (string) the method of the request
> - header (table)
> - queryString (string) the query string of data to send with the request
> - onSuccess (func) function to run when the request is successful
> - onError (func) function to run when the request is successful

#### Return
> void

### Example 
```lua
local endPoint = 'https://www.API.com'
local method = "POST"
local header = {
    ["X-API-KEY"] = "AAAAAAAAAAAAAAAAAAA"
}
local queryString = "field1=foo&field2=bar"
local onSuccess = function (returnData)
    print('onSuccess Processed')
end
local onError = function (returnData)
    print('onError processed')
end

local requestHttp = require "library.core.http.requesthttp"
requestHttp.send(endPoint, method, header, queryString, onSuccess, onError)
```
