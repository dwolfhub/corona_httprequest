-- Development by Daniel Wolf
-- For Oncall Interactive

--- HTTP Request Library
local RequestHttp = {}

--- json http request
-- @param string endpoint - the URL
-- @param string method - the verb (e.g. 'POST', 'GET', 'PUT', 'DELETE')
-- @param table params - the data to send with the request
-- @param func onError - function to run in the event of an error
-- @param func onSuccess - the function to run after a successful request
function RequestHttp.send(endPoint, method, params, onSuccess, onError)

    -- http request processing function
    function RequestHttp.process(returnData)
        if not returnData.isError then
            onSuccess(returnData)
        else
            onError(returnData)
        end
    end
    
    -- run request
    network.request( endPoint, method, RequestHttp.process, params)

end

return RequestHttp